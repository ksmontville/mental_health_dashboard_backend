<template>
  <div class="container-fluid p-3 dashboard bg-wrapper bg-gradient">

    <div class="dashNav container-fluid p-2 mt-2 mb-2">
      <DashboardNavbar />
    </div>

    <section class="container-fluid dashboard text-container" v-if="isAuthenticated">
      <h3 class="display-3 p-2">Hello, {{ displayName }}!</h3>
      <h4><em>Last Login: {{ user.updated_at.slice(0, 10) }}</em></h4>
    </section>

    <section class="container-fluid p-3 mb-3">
      Some kind of summary of recent activity here
    </section>

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