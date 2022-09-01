<template>
  <div class="content bg-wrapper">
    <section class="content content--get-started p-3 mb-3" id="getStarted">
      <div class="content text-container p-3 mb-3">
        <h2 class="display-4">Track</h2>
        <ul>
          <li>Start tracking your mental health with curated exercises recommended by real medical professionals!</li>
        </ul>
      </div>
      <div class="content img-container p-3 mb-3">
        <figure>
          <img src="../assets/img/brain.jpg" class="img-fluid img-thumbnail rounded" alt="The Best Gift is You!">
          <figcaption><em>Your brain will thank you</em></figcaption>
        </figure>
      </div>
      <button class="btn btn-primary btn-lg bg-gradient p-3 mb-3" v-if="isAuthenticated" @click="router.push('/dashboard')">To Dashboard</button>
      <button class="btn btn-primary btn-lg bg-gradient p-3 mb-3" v-else @click="login">Get Started!</button>
    </section>

    <section class="content content--features p-3 mb-3" id="features">
      <div class="content text-container p-3 mb-3">
        <h2 class="display-4">Features</h2>
        <ul>
          <li>
            Create your own tasks, or choose from one of many presets created by mental health professionals
          </li>
          <li>
            Keep track of your mental health with daily, weekly, monthly, and yearly statistics
          </li>
          <li>
            Chat with mental health professionals
          </li>
          <li>
            Share your progress on social media
          </li>
        </ul>
      </div>

      <div class="content img-container p-3 mb-3">
          <img src="../assets/img/meditate.jpg" class="img-fluid img-thumbnail rounded" alt="Meditate!">
          <img src="../assets/img/naturebreak.jpg" class="img-fluid img-thumbnail rounded" alt="Nature Break!">
          <img src="../assets/img/enjoy.jpg" class="img-fluid img-thumbnail rounded" alt="Do Something You Enjoy!">
          <img src="../assets/img/talktofriend.jpg" class="img-fluid img-thumbnail rounded" alt="Talk to a Friend!">
      </div>
    </section>

    <section class="content content--about p-3 mb-3" id="missionStatement">
      <div class="content text-container p-3 mb-3">
        <h2 class="display-4">Mission</h2>
        <ul>
          <li>Dr. Liza Ignatova is a fully licensed and certified practicing pediatrician specializing in adolescent mental health and well-being.</li>
        </ul>
       </div>


      <div class="content img-container p-3 mb-3">

        <figure class="figure">
          <img src="../assets/img/drliza.jpeg" class="img-fluid img-thumbnail rounded" alt="Dr. Liza Ignatova">
          <figcaption><em>Dr. Liza Ignatova</em></figcaption>
        </figure>
      </div>
    </section>
  </div>
</template>

<script>
import { useAuth0 } from '@auth0/auth0-vue';
import router from "../router";

export default {
  name: "LandingPage",

  setup() {
    const {user, isAuthenticated, loginWithRedirect} = useAuth0();

    return {user, isAuthenticated, router,

      login: () => {
          loginWithRedirect()
        },
     }
  }
}

</script>

<style scoped>

</style>