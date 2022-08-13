<template>
  <h1 class="page-header">Cool Mental Health Image</h1>
  <nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
      <a class="navbar-brand" href="#">#mentalHealth</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarToggler" aria-controls="navbarToggler" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarToggler">
        <div class="navbar-nav">
        <a class="nav-link active" aria-current="page" href="/">Home</a>
        <a class="nav-link" href="#">About</a>
        <a class="nav-link" href="#">Media</a>
        <a class="nav-link" href="#">Resources</a>
        <a v-if:="isAuthenticated" v-on:click="logout" class="nav-link" href="#">Log Out</a>
          <a v-else v-on:click="login" class="nav-link" href="#">Register / Log In</a>
        </div>
      </div>
    </div>
  </nav>
</template>

<script>
import {useAuth0} from "@auth0/auth0-vue";

export default {
  name: "PageHeader",

    setup() {
      const { loginWithRedirect, user, isAuthenticated } = useAuth0();
      const { logout } = useAuth0();
        return {
          login: () => {
            loginWithRedirect()
          },
          user,
          isAuthenticated,

          logout: () => {
            logout( {returnTo: window.location.origin})
        },
      }
  },
}

</script>

<style scoped>

</style>