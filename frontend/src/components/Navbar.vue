<template>
  <nav class="navbar navbar-expand-lg navbar-bg-light bg-gradient">
    <div class="container-fluid p-2" id="navbar">
      <router-link to="/dashboard" v-if="isAuthenticated" class="navbar-brand">Logged in as: {{ user.nickname }}</router-link>
      <router-link to="/dashboard" v-else v-on:click="login" class="navbar-brand">Log In | Register</router-link>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarToggler"
              aria-controls="navbarToggler" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarToggler">
        <div class="navbar-nav">
          <router-link to="/" class="nav-link">Home</router-link>
          <router-link to="/about" class="nav-link">About</router-link>
          <router-link to="#" class="nav-link text-decoration-line-through">Media</router-link>
          <router-link to="#" class="nav-link text-decoration-line-through">Resources</router-link>
          <router-link to="/dashboard" v-if="isAuthenticated" class="nav-link" aria-current="page">Dashboard</router-link>
          <router-link to="/" v-if="isAuthenticated" class="nav-link" @click="logout">Log Out</router-link>
          <router-link to="/dashboard" v-else class="nav-link" @click="login">Register / Log In</router-link>
        </div>
      </div>
    </div>
  </nav>
  <div class="section-break mb-5">

  </div>
</template>

<script>
import {useAuth0} from "@auth0/auth0-vue";
import {ref} from "vue";

export default {
  name: "PageHeader",

  setup() {
    const { loginWithRedirect, logout, user, isAuthenticated } = useAuth0();
    const navVisible = ref(false)


      return {
        user, isAuthenticated, navVisible,

        toggleNav: () => {
          navVisible.value = !navVisible.value
        },

        login: () => {
          loginWithRedirect()
        },
        logout: () => {
          logout( {returnTo: window.location.origin})
        },
      }
  },
}
</script>

<style scoped>

.navbar-toggler {
  color: darkslateblue !important;
  background-color: lavenderblush !important;
}

 .section-break {
    padding: 1.2vw;
    background: lavender;
    border-top: 2.4vw solid lightyellow;
    box-shadow: 1.2vw 2.4vw;
    opacity: 0.75;
  }

</style>