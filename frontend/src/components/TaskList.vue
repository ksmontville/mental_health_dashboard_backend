<template>
  <div class="toggleButtons">

    <div class="btn-group">
      <button class="btn-primary" :class="{ active : isActive}" type="button" @click="toggleHidden">Add</button>
      <button class="btn btn-secondary dropdown-toggle dropdown-toggle-split" type="button" data-bs-toggle="dropdown" aria-expanded="false"></button>
      <span class="visually-hidden">Toggle Dropdown</span>
      <ul class="dropdown-menu">

        <li><button class="dropdown-item" type="button" value="Custom" @click="addTask">Custom</button></li>
        <li><button class="dropdown-item" type="button" value="Random" @click="addTask">Surprise Me!</button></li>
        <li class="dropdown-divider"></li>

        <li class="dropdown-header"><h6>By Category</h6></li>

        <li class="dropdown-item"><label>Creative</label>
          <ul class="sub-menu" v-for="preset in presets[0]" :key="preset.id">
              <li><button class="dropdown-item" type="button" :value="preset.title" @click="addTask">{{ preset.title }}</button></li>
          </ul>
        </li>

        <li class="dropdown-item"><label>Mental</label>
          <ul class="sub-menu" v-for="preset in presets[1]" :key="preset.id">
              <li><button class="dropdown-item" type="button" :value="preset.title" @click="addTask">{{ preset.title }}</button></li>
          </ul>
        </li>

        <li class="dropdown-item"><label>Physical</label>
          <ul class="sub-menu" v-for="preset in presets[2]" :key="preset.id">
              <li><button class="dropdown-item" type="button" :value="preset.title" @click="addTask">{{ preset.title }}</button></li>
          </ul>
        </li>

        <li class="dropdown-item"><label>Social</label>
          <ul class="sub-menu" v-for="preset in presets[3]" :key="preset.id">
              <li><button class="dropdown-item" type="button" :value="preset.title" @click="addTask">{{ preset.title }}</button></li>
          </ul>
        </li>

      </ul>

      <button class="toggleButtons current" v-bind:class="{ active: activeButton === 'toggleButtons current' }" @click="toggleCurrentTasks">Current</button>
      <button class="toggleButtons complete" v-bind:class="{ active: activeButton === 'toggleButtons complete' }" @click="toggleCompleteTasks">Complete</button>
      <input class="toggleButtons showAll" type="checkbox" @click="toggleShowAllTasks" ref="showAll">Show All
    </div>

  </div>

    <section v-show="!isHidden" class="content addForm" ref="addForm">
      <form ref="addTaskForm" v-on:submit.prevent="postTask">
        <input v-model="user.sub" type="hidden" ref="auth0IDInput" name="auth0ID">
        <br><label for="activity">Activity</label><br>
        <input v-model="task.title" type="text" ref="activityInput" name="title"><br>

        <label for="description">Description</label><br>
        <textarea v-model="task.description" type="text" ref="descriptionInput" name="description"></textarea><br>

        <label for="duration">Duration (minutes)</label><br>
        <input v-model="task.duration" type="number" ref="durationInput" name="duration"><br><br>

        <input type="submit" value="submit">
        <br>

      </form>
    </section>

  <div>
      <ul class="taskList">
        <li v-for="task in tasks[0]" :key="task.id">
          <div v-if="user.sub === task.owner">
            <div class="taskList__child">

              <br><label for="activity">Activity</label><br>
              <input class="taskList__input" v-model="task.title" type="text" id="activity" name="activity" v-bind:readonly="!task.canEdit"><br>

              <label for="description">Description</label><br>
              <textarea class="taskList__input" v-model="task.description" type="text" id="description" name="description" v-bind:readonly="!task.canEdit"></textarea><br>

              <label for="duration">Duration (minutes)</label><br>
              <input class="taskList__input" v-model="task.duration" type="text" id="duration" name="duration" v-bind:readonly="!task.canEdit"><br>

              <h6>Created: {{ task.created.slice(0, 10) }}</h6>
              <span>Complete: <input type="checkbox" @click="markTaskComplete(task)" v-model="task.completed" id="isComplete" name="isComplete">
                <label v-if="task.completed">{{ task.date_completed }}</label>
              </span><br>

              <button v-if="!task.canEdit" @click="task.canEdit = !task.canEdit" id="editButton">Edit</button>
              <button v-else @click="editTask(task).then(toggleCanEdit)" id="submitButton">Submit</button>
              <button @click="deleteTask(task)">Remove</button><br>

            </div>
          </div>
        </li>
      </ul>
    </div>

</template>

<script>
import {useAuth0} from "@auth0/auth0-vue";
import axios from 'axios'
import {ref, reactive, computed} from "vue";

const API_URL = 'http://localhost:8000'

export default {
  name: "TaskList",

  setup() {
    const {user, getAccessTokenSilently} = useAuth0();
    const presets = reactive([])
    const tasks = reactive([])
    const task = {
      'id': '',
      'owner': '',
      'title': '',
      'description': '',
      'duration': '',
      'completed': false,
      'date_completed': '',
      'canEdit': false,
    }

    const currentTasks = computed( () => { tasks.filter( task => task.completed === false ) } )
    const activeButton = ref("toggleButtons current")

    let isHidden = ref(true)
    let isActive = ref(false)
    let currentIsActive = ref(false)
    let completeIsActive = ref(false)
    let showAllTasks = ref(false)
    let canEdit = ref(false)

    getPresets()
    getCurrentTasks()

    async function getPresets() {
      const creative = await axios.get(`${API_URL}/api/preset/?category=creative`)
      presets.push(creative.data)

      const mental = await axios.get(`${API_URL}/api/preset/?category=mental`)
      presets.push(mental.data)

      const physical = await axios.get(`${API_URL}/api/preset/?category=physical`)
      presets.push(physical.data)

      const social = await axios.get(`${API_URL}/api/preset/?category=social`)
      presets.push(social.data)
      }

    async function getAllTasks() {
      const token = await getAccessTokenSilently();
      const data = await axios.get(`${API_URL}/api/tasks/`, {
        headers: {
          Authorization: `Bearer ${token}`
        }
      });
      tasks[0] = data.data
    }

    async function postTask() {
      try {
        const token = await getAccessTokenSilently();
        const response = await axios.post(`${API_URL}/api/tasks/`, {
          'owner': user.value.sub,
          'title': task.title,
          'description': task.description,
          'duration': task.duration,
          'date_completed': 'null'
        }, {
          headers: {
            Authorization: `Bearer ${token}`,
          }
        });
          tasks.push(response.data)
          task.title = ""
          task.description = ""
          task.duration = ""
        await setTaskList()
      } catch(errors) {
        console.log(errors)
      }
    }

    async function deleteTask(task) {
      try {
        const token = await getAccessTokenSilently();
        await axios.delete(`${API_URL}/api/tasks/${task.id}`, {
          headers: {
            Authorization: `Bearer ${token}`,
          }
        }); await setTaskList()
      } catch(errors) {
        console.log(errors)
      }
    }

    async function editTask(task) {
      try {
        const token = await getAccessTokenSilently();
        await axios.put(`${API_URL}/api/tasks/${task.id}`, {
          'owner': user.value.sub,
          'title': task.title,
          'description': task.description,
          'duration': task.duration,
          'completed': task.completed,
          'date_completed': task.date_completed,
        }, {
          headers: {
            Authorization: `Bearer ${token}`
          }
        }); task.canEdit = ! task.canEdit
      } catch(errors) {
        console.log(errors)
      }
    }

    async function markTaskComplete(task) {
      try {
        const token = await getAccessTokenSilently();
        await axios.put(`${API_URL}/api/tasks/${task.id}`, {
          'owner': user.value.sub,
          'title': task.title,
          'duration': task.duration,
          'completed': !task.completed,
          'date_completed': new Date().toLocaleString()
        }, {
          headers: {
            Authorization: `Bearer ${token}`
          }
        }); await setTaskList()
      } catch(error){
        console.log(error)
      }
    }

    async function getCurrentTasks() {
      try {
        const response = await axios.get(`${API_URL}/api/tasklist/?owner=${user.value.sub}&completed=false`)
        tasks[0] = response.data
      } catch(error) {
        console.log(error)
      }
    }

    async function getCompleteTasks() {
      try {
        const response = await axios.get(`${API_URL}/api/tasklist/?owner=${user.value.sub}&completed=true`)
        tasks[0] = response.data
      } catch(error) {
        console.log(error)
      }
    }

      async function setTaskList() {
        if (activeButton.value === 'toggleButtons current') {
          await getCurrentTasks()
        } else if (activeButton.value === 'toggleButtons complete') {
          await getCompleteTasks()
        } else {
          await getAllTasks()
        }
      }

      return {
        user, tasks, task, isHidden, canEdit, currentTasks, showAllTasks, isActive, currentIsActive, completeIsActive,
        activeButton, presets,
        getAllTasks, postTask, editTask, deleteTask, markTaskComplete, getCurrentTasks, getCompleteTasks
    }
  },
  methods: {
      deactivateButtons() {
        this.activeButton = ""
      },
      toggleCanEdit() {
        this.task.canEdit = !this.task.canEdit
      },
      toggleHidden() {
        this.isActive = !this.isActive
        this.isHidden = !this.isHidden
      },
      toggleCurrentTasks() {
        if (!this.showAllTasks) {
          this.activeButton = 'toggleButtons current'
          this.getCurrentTasks()
        }
        else {
          this.deactivateButtons()
          this.getAllTasks()
        }
      },
      toggleCompleteTasks() {
        if (!this.showAllTasks) {
          this.activeButton = 'toggleButtons complete'
          this.getCompleteTasks()
        }
        else {
          this.deactivateButtons()
          this.getAllTasks()
        }
      },
      toggleShowAllTasks() {
        if (!this.showAllTasks){
          this.deactivateButtons()
          this.getAllTasks()
        }
        else {
          this.activeButton = 'toggleButtons current'
          this.getCurrentTasks()
        }
        this.showAllTasks = !this.showAllTasks
      },
      async addTask(event) {
        if (this.isHidden) {
          this.isHidden = !this.isHidden
        }
        if (event.target.value === 'Custom') {
          this.clearFormInputField()
        }
        else if (event.target.value === 'Random') {
          const response = await axios.get(`${API_URL}/api/preset/`)
          const presets = response.data
          const randomIndex = Math.floor(Math.random() * presets.length)

          const data = presets[randomIndex]
          this.setFormInputField(data)
        }
        else {
        const response = await axios.get(`${API_URL}/api/preset/?title=${event.target.value}`)
        const data = response.data[0]
        this.setFormInputField(data)
        }
      },
      clearFormInputField() {
        this.isActive = true

        this.task.title = ''
        this.task.description = ''
        this.task.duration = ''

        this.$refs.activityInput.value = ''
        this.$refs.descriptionInput.value = ''
        this.$refs.durationInput.value = ''

        this.$refs.activityInput.placeholder = 'Custom'
        this.$refs.descriptionInput.placeholder = 'Custom'
        this.$refs.durationInput.placeholder = '10'
      },
      setFormInputField(data) {
        this.isActive = true

        this.$refs.activityInput.value = data.title
        this.$refs.descriptionInput.value = data.description
        this.$refs.durationInput.value = data.duration

        this.task.title = data.title
        this.task.description = data.description
        this.task.duration = data.duration
      },
    },
}
</script>

<style scoped>

</style>
