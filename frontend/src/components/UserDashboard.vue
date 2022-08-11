<template>

  <section class="content dashboard">

    <button @click="">Current</button>
    <button>Complete</button>
    <button>Show All</button>
    <br>
    <button @click="toggleHidden">Add</button>

    <Transition>
      <section v-show="!isHidden" class="content addForm">
        <form v-on:submit.prevent="postTask">

          <label for="activity">Activity</label>
          <input v-model="task.title" type="text" id="activity" name="activity">

          <label for="description">Description</label>
          <textarea v-model="task.description" type="text" id="description" name="description"></textarea>

          <label for="duration">Duration</label>
          <input v-model="task.duration" type="text" id="duration" name="duration">

          <input type="submit" value="submit">
          <br>

        </form>
      </section>
    </Transition>

    <div>
      <ul class="taskList">
        <li v-for="task in tasks[0]" :key="task.id">
          <div class="list">
          <br><label for="activity">Activity</label><br>
          <input class="taskList__input" v-model="task.title" type="text" id="activity" name="activity" v-bind:readonly="!canEdit"><br>

          <label for="description">Description</label><br>
          <textarea class="task-list__input" v-model="task.description" type="text" id="description" name="description" readonly></textarea><br>

          <label for="duration">Duration</label><br>
          <input class="task-list__input" v-model="task.duration" type="text" id="duration" name="duration" readonly><br>

          <h6>Created: {{ task.created.slice(0, 10) }}</h6>
          <h6>Complete: <input type="checkbox" @click="markComplete(task)" v-model="task.completed" id="isComplete" name="isComplete"></h6>

          <button v-if="!canEdit" @click="canEdit = !canEdit" id="editButton">{{ editSubmitButtonText }}</button>
          <button v-else @click="editTask(task)" id="submitButton">Submit</button>
          <button @click="deleteTask(task)">Remove</button><br>

        </div>
        </li>
      </ul>
    </div>

  </section>

</template>

<script>
import {useAuth0} from "@auth0/auth0-vue";
import axios from 'axios'
import {ref, reactive, computed} from "vue";

const API_URL = 'http://localhost:8000'


export default {
  name: "UserDashboard",

  setup() {
    const {getAccessTokenSilently} = useAuth0();
    const tasks = reactive([])
    const task = {
      'id': '',
      'title': '',
      'description': '',
      'duration': '',
      'completed': '',
    }

    const editSubmitButtonText = computed(() => {
      return canEdit.value ? 'Submit' : 'Edit'
    })


    let isHidden = ref(true)
    let canEdit = ref(false)

    getTasks()

    async function getTasks() {
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
          'title': task.title,
          'description': task.description,
          'duration': task.duration,
        }, {
          headers: {
            Authorization: `Bearer ${token}`,
          }
        });
        tasks.push(response.data)
        task.title = ""
        task.description = ""
        task.duration = ""
        await getTasks()
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
        }); await getTasks()
      } catch(errors) {
        console.log(errors)
      }
    }

    async function editTask(task) {
      try {
        const token = await getAccessTokenSilently();
        await axios.put(`${API_URL}/api/tasks/${task.id}`, {
          'title': task.title,
          'duration': task.duration,
          'completed': task.completed,
        }, {
          headers: {
            Authorization: `Bearer ${token}`
          }
        }); canEdit.value = !canEdit.value
      } catch(errors) {
        console.log(errors)
      }
    }

    async function markComplete(task) {
      try {
        const token = await getAccessTokenSilently();
        await axios.put(`${API_URL}/api/tasks/${task.id}`, {
          'title': task.title,
          'duration': task.duration,
          'completed': !task.completed,
        }, {
          headers: {
            Authorization: `Bearer ${token}`
          }
        });
      } catch(error){
        console.log(error)
      }
    }

    function toggleHidden() {
      isHidden.value = !isHidden.value
      console.log(isHidden)
    }

      return {tasks, task, isHidden, canEdit, editSubmitButtonText, postTask, editTask, deleteTask, markComplete, toggleHidden}

  },
  methods: {

  },
}

</script>

<style scoped>

</style>