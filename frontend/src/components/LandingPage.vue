<template>

  <section v-if="!isAuthenticated" class="content get-started" id="getStarted">
    <p>Get started today</p>
  </section>

  <section v-if="!isAuthenticated" class="content features" id="features">
    <p>Features about app</p>
  </section>

  <section v-if="!isAuthenticated" class="content about" id="about">
    <p>About Liza</p>
  </section>

  <Transition>
  <section v-if="isAuthenticated" class="content dashboard" id="dashboard">
      <h2>My Profile -- Hello, {{ user.nickname}}!</h2>
      <h3>Last Active: {{ lastActivity }} </h3>
      <user-dashboard />

  </section>
  </Transition>


</template>

<script>
import { useAuth0 } from '@auth0/auth0-vue';
import UserDashboard from './UserDashboard.vue';
import axios from "axios";

export default {
  name: "LandingPage",

  components: {
    'user-dashboard': UserDashboard
  },

  setup() {
    const lastActivityDate = new Date().toLocaleDateString()
    const lastActivityTime = new Date().toLocaleTimeString()
    const lastActivity = `${lastActivityDate}, ${lastActivityTime}`

    const API_URL = 'http://localhost:8000';
    const { getAccessTokenSilently } = useAuth0();
    const {user, isAuthenticated} = useAuth0();

    return {user, isAuthenticated, lastActivity}
  },

  // data() {
  // },

  methods: {
  },
}

</script>

<style scoped>

</style>