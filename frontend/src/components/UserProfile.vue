<template>
  <section>
    <h1>User Profile</h1>
    <h2>Hello, {{ user.name }}!</h2>
    <form v-on:submit.prevent="editDisplayName">
      <label for="displayName">Edit Display Name</label>
      <input v-model="displayName" type="text" name="displayName" placeholder="New Name">
      <input type="submit" value="submit">
    </form>
  </section>
</template>

<script>
import {useAuth0} from "@auth0/auth0-vue";
import axios from 'axios'
import {ref} from "vue";

const MANAGEMENT_API = "http://localhost:8000/api/users/management"

export default {
  name: "UserProfile",

  setup() {
    const {user, isAuthenticated, getAccessTokenSilently} = useAuth0()

    const displayName = ref("")

    getDisplayName()

    console.log(user.value.sub)

    async function getDisplayName() {
      const token = await getAccessTokenSilently();
      const response = await axios.get(`${MANAGEMENT_API}`, {
        headers: {
          Authorization: `Bearer ${token}`
        }
      });
      console.log(response.data[0].user_metadata.display_name)
      displayName.value = response.data[0].user_metadata.display_name
    }

    async function editDisplayName() {
      const token = await getAccessTokenSilently();
      const response = await axios.patch(`${MANAGEMENT_API}`, {
        "user_metadata[auth0_id]": user.value.sub,
        "user_metadata[display_name]": displayName.value,
      }, {
        headers: {
          Authorization: `Bearer ${token}`
        }
      }); console.log(response.data, user.value.sub, user.value.email)
    }

    return {user, isAuthenticated, displayName, editDisplayName}
  }
}




</script>

<style scoped>

</style>