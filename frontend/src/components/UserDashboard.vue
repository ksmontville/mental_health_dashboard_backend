<template>

  <section v-if="isAuthenticated">
    <h2>My Profile -- Hello, {{ user.nickname }}!</h2>
        <h3>Last Login: {{ user.updated_at.slice(0, 10) }}</h3>
  </section>

    <section id="tasks">
      <TaskList />
    </section>

</template>

<script>
import TaskList from './TaskList.vue';
import {useAuth0} from "@auth0/auth0-vue";
import axios from "axios";
import {reactive, ref} from "vue";

export default {
  name: "UserDashboard",

  components: {
    TaskList
  },

  async setup() {
    const {user, isAuthenticated} = useAuth0();

    const userEmail = user.value.email
    const userAuth0ID = user.value.sub

    // console.log(userEmail)
    // console.log(userAuth0ID)

    return {user, isAuthenticated}
  },
}


</script>

<style scoped>

</style>