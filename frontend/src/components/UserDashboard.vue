<template>
  <h2>My Profile -- Hello, {{ user.nickname}}!</h2>
      <h3>Last Active: {{ lastActivity }} </h3>

  <section id="tasks">
    <TaskList />
  </section>

</template>

<script>
import TaskList from './TaskList.vue';
import {useAuth0} from "@auth0/auth0-vue";

export default {
  name: "UserDashboard",

  components: {
    TaskList
  },

  setup() {

    const lastActivityDate = new Date().toLocaleDateString()
    const lastActivityTime = new Date().toLocaleTimeString()
    const lastActivity = `${lastActivityDate}, ${lastActivityTime}`

    const {user, isAuthenticated} = useAuth0();
    return {user, isAuthenticated, lastActivity}
  },
}

</script>

<style scoped>

</style>