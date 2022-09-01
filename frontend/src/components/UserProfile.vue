<template>
  <div class="dashboard bg-wrapper bg-gradient">
  <nav>
    <DashboardNavbar />
  </nav>
    <section>
      <h1>My Profile -- <span><button class="btn  btn-sm btn-secondary" :class="{active: canEdit}" @click="toggleCanEdit">Edit</button></span></h1>


      <label>Avatar</label><img v-bind:src="avatar" alt="The users current profile picture.">
      <section>
      <span><label>Details</label></span><br>
        <span><label>Email</label><input v-bind:disabled="canEdit" readonly v-model="user.email"></span>
      </section>

      <div>
        <form v-on:submit.prevent="editMetaData">
          <label>Preferred Name</label>
          <input v-model="preferredName" type="text" name="preferredName" placeholder="New Name" v-bind:readonly="!canEdit">
          <label>Display Name</label>
          <input v-model="displayName" type="text" name="displayName" placeholder="New Name" v-bind:readonly="!canEdit">

          <section>
          <span><label>Social Networks</label></span>
          <ul>
            <li v-for="network in socialNetworks" :key="network.net">
              <label>{{ network.net }}</label>
              <input v-model="network.acct" type="text" v-bind:readonly="!canEdit">
            </li>
          </ul>
          </section>

          <button class="btn btn-secondary" type="submit" value="submit" v-bind:disabled="!canEdit">Submit</button>
        </form>
      </div>
    </section>
  </div>
</template>

<script>
import {useAuth0} from "@auth0/auth0-vue";
import axios from 'axios'
import {reactive, ref} from "vue";

const MANAGEMENT_API = "https://dli-backend.herokuapp.com/api/users/management"

export default {
  name: "UserProfile",

  setup() {
    const {user, isAuthenticated, getAccessTokenSilently} = useAuth0()

    const avatar = ref('')
    const displayName = ref('')
    const preferredName = ref('')
    const socialNetworks = reactive([
        {'net': 'facebook', acct: ''},
        {'net': 'instagram', acct: ''},
        {'net': 'twitter', acct: ''},
        {'net': 'tiktok', acct: ''},
    ])
    const canEdit = ref(false)
    const toggleCanEdit = () => canEdit.value = !canEdit.value

    getMetaData()

    async function getMetaData() {
      const token = await getAccessTokenSilently();
      const response = await axios.get(`${MANAGEMENT_API}`, {
        headers: {
          Authorization: `Bearer ${token}`
        }
      });
      const data = response.data[0]
      avatar.value = user.value.picture
      displayName.value = data.user_metadata.display_name
      preferredName.value = data.user_metadata.preferred_name
      socialNetworks[0].acct = data.user_metadata.social_networks.facebook
      socialNetworks[1].acct = data.user_metadata.social_networks.instagram
      socialNetworks[2].acct = data.user_metadata.social_networks.twitter
      socialNetworks[3].acct = data.user_metadata.social_networks.tiktok
    }

    async function editMetaData() {
      const token = await getAccessTokenSilently();
      const response = await axios.patch(`${MANAGEMENT_API}`, {
        "user_metadata[display_name]": displayName.value,
        "user_metadata[user_id]": user.value.sub,
        "user_metadata[social_networks][facebook]": socialNetworks[0].acct,
        "user_metadata[social_networks][instagram]": socialNetworks[1].acct,
        "user_metadata[social_networks][twitter]": socialNetworks[2].acct,
        "user_metadata[social_networks][tiktok]": socialNetworks[3].acct,
      }, {
        headers: {
          Authorization: `Bearer ${token}`
        }
      });
      toggleCanEdit()
    }

    return {user, isAuthenticated, avatar, displayName, preferredName, socialNetworks, canEdit, editMetaData,toggleCanEdit}
  }
}




</script>

<style scoped>

</style>