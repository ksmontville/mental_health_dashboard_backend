<template>
  <nav class="navbar navbar-expand-lg navbar-bg-light bg-gradient">
    <div class="container-fluid" id="navbar">
      <router-link to="/dashboard" v-if="isAuthenticated" class="navbar-brand">Dashboard</router-link>
      <router-link to="/dashboard" v-else v-on:click="login" class="navbar-brand">Log In | Register</router-link>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarToggler"
              aria-controls="navbarToggler" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarToggler">
        <div class="navbar-nav">
          <router-link to="/" class="nav-link" aria-current="page">Home</router-link>
          <router-link to="#" class="nav-link">About</router-link>
          <router-link to="#" class="nav-link">Media</router-link>
          <router-link to="#" class="nav-link">Resources</router-link>
          <router-link to="/" v-if="isAuthenticated" class="nav-link" @click="logout">Log Out</router-link>
          <router-link to="/dashboard" v-else class="nav-link" @click="login">Register / Log In</router-link>
        </div>
      </div>
    </div>
  </nav>
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

</style>