<template>

  <section v-if="!isAuthenticated" class="content get-started" id="getStarted">
    <h2>Get started today</h2>
    <p>Start tracking your mental health with curated exercises recommended by real medical professionals!</p>
  </section>

  <section v-if="!isAuthenticated" class="content features" id="features">
    <h2>Features about app</h2>
    <ul>
      <li>
        Keep track of your mental health with daily, weekly, monthly, and yearly statistics
      </li>
      <li>
        Send messages directly to your provider
      </li>
      <li>
        Share your progress on social media
      </li>
    </ul>
  </section>

  <section v-if="!isAuthenticated" class="content about" id="missionStatement">
    <h2>Mission Statement</h2>
    <p>Dr. Liza Ignatova is a fully licenced and certified practicing pediatrician specializing in adolescent mental health and well-being.</p>
  </section>

  <Transition>
  <section v-if="isAuthenticated" class="content dashboard" id="dashboard">
      <user-dashboard />
  </section>
  </Transition>


</template>

<script>
import { useAuth0 } from '@auth0/auth0-vue';
import UserDashboard from './UserDashboard.vue';

export default {
  name: "LandingPage",

  components: {
    'user-dashboard': UserDashboard
  },

  setup() {
    const {user, isAuthenticated} = useAuth0();
    return {user, isAuthenticated}
  },
}

</script>

<style scoped>

</style>