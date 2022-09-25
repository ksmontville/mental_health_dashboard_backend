<template>
  <div class="container-fluid p-3 dashboard bg-wrapper bg-gradient">

      <div class="dashNav container-fluid p-2 mt-2 mb-2">
        <DashboardNavbar />
      </div>

    <div class="userDashboard text-center container-fluid">

      <section class="container-fluid dashboard text-container" v-if="isAuthenticated">
        <h3 class="display-3 p-2">Hello, {{ preferredName }}!</h3>
        <h4><em>Last Login: {{ user.updated_at.slice(0, 10) }}</em></h4>
      </section>

      <section class="container-fluid p-3 mb-3">
        <p>Here's what you've been up to...</p>
      </section>

    </div>

  </div>
</template>

<script>
import {useAuth0} from "@auth0/auth0-vue";
import axios from "axios";
import {ref} from "vue";


const MANAGEMENT_API = "https://dli-backend.herokuapp.com/api/users/management"

export default {
  name: "UserDashboard",

  async setup() {
    const {user, isAuthenticated, getAccessTokenSilently} = useAuth0();

    const preferredName = ref('')

    await getMetaData()

    async function getMetaData() {
      const token = await getAccessTokenSilently();
      const response = await axios.get(`${MANAGEMENT_API}`, {
        headers: {
          Authorization: `Bearer ${token}`
        }
      });
      const data = response.data[0]
      preferredName.value = data.user_metadata.preferred_name
    }

    return {user, isAuthenticated, preferredName}
  },
}

</script>

<style scoped>

</style>