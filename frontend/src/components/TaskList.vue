<template>
  <div class="container-fluid p-2 dashboard bg-wrapper bg-gradient">

    <div class="dashNav container-fluid p-2 mt-2 mb-2">
      <DashboardNavbar />
    </div>


    <div class="d-flex flex-column justify-content-start align-items-center">

      <div class="btn-group" role="group">
        <button class="btn btn-dark dropdown-toggle" @click="" type="button" data-bs-toggle="dropdown" aria-expanded="false">
          New Activity
        </button>
        <ul class="dropdown-menu">
          <li><button class="dropdown-item" type="button" value="Custom" @click="addTask">Custom</button></li>
          <li><button class="dropdown-item" type="button" value="Random" @click="addTask">Surprise Me!</button></li>
          <li class="dropdown-divider"></li>

          <li class="dropdown-header"><h6>By Category</h6></li>

          <li class="dropdown-item"><label class="menu-label">Creative</label>
            <ul class="sub-menu" v-for="preset in presets[0]" :key="preset.id">
                <li><button class="dropdown-item" type="button" :value="preset.title" @click="addTask">{{ preset.title }}</button></li>
            </ul>
          </li>

          <li class="dropdown-item"><label class="menu-label">Mental</label>
            <ul class="addTask sub-menu" v-for="preset in presets[1]" :key="preset.id">
                <li><button class="dropdown-item" type="button" :value="preset.title" @click="addTask">{{ preset.title }}</button></li>
            </ul>
          </li>

          <li class="dropdown-item"><label class="menu-label">Physical</label>
            <ul class="sub-menu" v-for="preset in presets[2]" :key="preset.id">
                <li><button class="dropdown-item" type="button" :value="preset.title" @click="addTask">{{ preset.title }}</button></li>
            </ul>
          </li>

          <li class="dropdown-item"><label class="menu-label">Social</label>
            <ul class="sub-menu" v-for="preset in presets[3]" :key="preset.id">
                <li><button class="dropdown-item" type="button" :value="preset.title" @click="addTask">{{ preset.title }}</button></li>
            </ul>
          </li>
        </ul>

        <button class="btn btn-outline-light toggleButtons current" v-bind:class="{ active: activeButton === 'toggleButtons current'}" @click="toggleCurrentTasks">Show Current</button>
        <button class="btn btn-outline-light toggleButtons complete" v-bind:class="{ active: activeButton === 'toggleButtons complete'}" @click="toggleCompleteTasks">Show Complete</button>
        <input type="checkbox" class="btn-check toggleButtons showAll" id="showAllToggle" @click="toggleShowAllTasks" ref="showAll">
        <label class="btn btn-outline-light" for="showAllToggle">Show All</label>
      </div>

      <section v-show="!isHidden" class="container-fluid p-2 content addForm" ref="addForm">
        <form ref="addTaskForm" v-on:submit.prevent="postTask">
          <ul>
            <li>
              <input class="form-control" v-model="user.sub" type="hidden" ref="auth0IDInput" name="auth0ID">
            </li>

           <li>
             <label class="form-label" for="title">Activity</label><br>
             <input class="form-control form-control-sm" v-model="task.title" type="text" ref="activityInput" id="title" name="title">
           </li>

            <li>
              <label class="form-label" for="description">Description</label>
              <textarea class="form-control form-control-sm" v-model="task.description" type="text" ref="descriptionInput" id="description" name="description"></textarea>
            </li>

            <li>
              <label class="form-label" for="duration">Duration (minutes)</label>
              <input class="form-control form-control-sm" v-model="task.duration" type="number" ref="durationInput" id="duration" name="duration">
            </li>

            <li>
              <input class="btn btn-dark" type="submit" value="submit" @click="toggleHidden">
              <button class="btn btn-dark m-2" @click="toggleHidden">cancel</button>
            </li>
          </ul>
        </form>
      </section>



      <section id="taskList">
        <ul class="taskList">
          <li v-for="task in tasks[0]" :key="task.id">
            <div v-if="user.sub === task.owner">
              <div class="container-fluid list-group taskList__child">
                <div class="container-fluid card">
                  <div class="card-body" style="color:black;">
                    <h5 class="display-5 card-title">{{ task.title }}</h5>
                    <h6 class="card-subtitle mb-3 text-muted">{{ task.duration }} minutes</h6>
                    <p class="card-text">{{ task.description }}</p>
                  </div>

                <div class="card-body text-left">
                  <div class="container-fluid p-2 text-center btn-group" role="group">
                    <button class="btn btn-dark" v-if="!task.canEdit" @click="task.canEdit = !task.canEdit" id="editButton">Edit (Coming Soon)</button>
                    <button class="btn btn-light" v-else @click="editTask(task).then(toggleCanEdit)" id="submitButton">Submit</button>
                    <button class="btn btn-secondary" @click="deleteTask(task)">Remove</button><br>
                    <input class="btn-check" type="checkbox" :id=task.id v-model="task.completed" @click="markTaskComplete(task)">
                    <label class="btn btn-outline-info" :for=task.id>Done!</label>
                  </div>
                  <p class="card-text p-2 mt-2" style="color:black;"><label v-if="task.completed"><em>&check; {{ task.date_completed }}</em></label></p>
                </div>
              </div>
            </div>
            </div>
          </li>
        </ul>
      </section>
    </div>

  </div>
</template>

<script>
import {useAuth0} from "@auth0/auth0-vue";
import axios from 'axios'
import {ref, reactive, computed} from "vue";

const API_URL = 'https://dli-backend.herokuapp.com'

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
        }); await setTaskList(); console.log(task.id)
      } catch(error) {
        console.log(error)
      }
    }

    async function markTaskComplete(task) {
      try {
        const token = await getAccessTokenSilently();
        await axios.put(`${API_URL}/api/tasks/${task.id}`, {
          'id': task.id,
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

   async function getAllTasks() {
    const data = await axios.get(`${API_URL}/api/tasklist?owner=${user.value.sub}`)
    tasks[0] = data.data
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

      getPresets()
      getCurrentTasks()

      return {
        user, tasks, task, isHidden, canEdit, currentTasks, showAllTasks, isActive, currentIsActive, completeIsActive,
        activeButton, presets,
        getAllTasks, postTask, editTask, deleteTask, markTaskComplete, getCurrentTasks, getCompleteTasks,
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

.form-control {
  max-width: 36rem;
}

.menu-label {
  font-size: 1.4rem;
}

.dropdown-item:active {
  background-color: cyan;
}

.dropdown-item:hover {
  color: darkslateblue;
  background-color: lightcyan;
}


</style>
