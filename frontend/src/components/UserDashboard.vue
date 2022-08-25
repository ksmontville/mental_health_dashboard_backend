<template>

  <section v-if="isAuthenticated">
    <h2>Hello, {{ displayName }}!</h2>
    <h3>Last Login: {{ user.updated_at.slice(0, 10) }}</h3>
    <router-link to="/profile">View/Edit Profile</router-link>

  </section>
    <section id="tasks">
      <TaskList />
    </section>

</template>

<script>
import {useAuth0} from "@auth0/auth0-vue";
import axios from "axios";
import {reactive, ref} from "vue";


const MANAGEMENT_API = "http://localhost:8000/api/users/management"

export default {
  name: "UserDashboard",

  async setup() {
    const {user, isAuthenticated, getAccessTokenSilently} = useAuth0();

    const displayName = ref('')

    await getDisplayName()

     async function getDisplayName() {
      const token = await getAccessTokenSilently();
      const response = await axios.get(`${MANAGEMENT_API}`, {
        headers: {
          Authorization: `Bearer ${token}`
        }
      });
      displayName.value = response.data[0].user_metadata.display_name
    }

    return {user, isAuthenticated, displayName}
  },
}


</script>

<style scoped>

</style>