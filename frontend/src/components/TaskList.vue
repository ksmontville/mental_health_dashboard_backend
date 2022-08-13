<template>

  <button @click="">Current</button>
    <button>Complete</button>
    <button>Show All</button>
    <button @click="toggleHidden">Add</button>

      <section v-show="!isHidden" class="content addForm">
        <form ref="addTaskForm" v-on:submit.prevent="postTask">
          <input v-model="user.sub" type="hidden" ref="auth0IDInput" name="auth0ID">

          <br><label for="activity">Activity</label><br>
          <input v-model="task.title" type="text" ref="activityInput" name="activity"><br>

          <label for="description">Description</label><br>
          <textarea v-model="task.description" type="text" ref="descriptionInput" name="description"></textarea><br>

          <label for="duration">Duration (minutes)</label><br>
          <input v-model="task.duration" type="text" ref="durationInput" name="duration"><br><br>

          <input type="submit" value="submit">
          <br>

        </form>
      </section>


  <div>
      <ul class="taskList">
        <li v-for="(task) in tasks[0]" :key="task.owner">
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
    const tasks = reactive([])
    const task = {
      'id': '',
      'owner': '',
      'title': '',
      'description': '',
      'duration': '',
      'completed': '',
      'date_completed': '',
      'canEdit': false,
    }

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
        }); await getTasks()
      } catch(error){
        console.log(error)
      }
    }

      return {user, tasks, task, isHidden, canEdit, postTask, editTask, deleteTask, markTaskComplete}

  },
  methods: {
      toggleCanEdit() {
        this.task.canEdit = !this.task.canEdit
      },
      toggleHidden() {
        this.isHidden = !this.isHidden
      }
  },
}

</script>

<style scoped>

</style>
