<template>
  <div class="container-fluid dashboard bg-wrapper bg-gradient">

    <div class="dashNav container-fluid p-2 mt-2 mb-2">
      <DashboardNavbar />
    </div>

    <section class="container-fluid p-3 mb-3">
      <h2 class="display-2 text-center">My Profile</h2>

      <div class="profile container-fluid p-3 mb-3">
        <label class="p-3">Display Picture</label>
        <img class="img-fluid img-thumbnail mb-3" v-bind:src="avatar" alt="The users current profile picture.">

        <label class="form-label p-3">Email</label>
        <input class="form-control p-3 mb-3" readonly v-model="user.email">
      </div>

      <div class="details container-fluid">
        <form class="form-control" v-bind:class="{active: canEdit}" v-on:submit.prevent="editMetaData">
          <label class="form-label p-2" for="preferredName"><strong>Preferred Name</strong></label>
          <input class="form-control p-2 mb-2" v-model="preferredName" type="text" id="preferredName" placeholder="New Name" v-bind:readonly="!canEdit">

          <label class="form-label p-2" for="displayName"><strong>Display Name</strong></label>
          <input class="form-control p-2 mb-2" v-model="displayName" type="text" id="displayName" placeholder="New Name" v-bind:readonly="!canEdit">
          <br>
          <dl>
            <dt><label class="p-2 mb-2"><strong>Social Networks</strong></label></dt>
            <dt v-for="network in socialNetworks" :key="network.net">
                <label class="form-label p-2 mb-2" for="socialNetwork">{{ network.net }}</label>
                <input class="form-control p-2 mb-2" v-model="network.acct" type="text" id="socialNetwork" v-bind:readonly="!canEdit">
            </dt>
          </dl>

          <button v-if="canEdit" class="btn btn-secondary" type="submit" value="submit">Submit</button>
          <button v-else class="btn btn-secondary" @click="toggleCanEdit">Edit</button>
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
        {'net': 'Facebook', acct: ''},
        {'net': 'Instagram', acct: ''},
        {'net': 'Twitter', acct: ''},
        {'net': 'TikTok', acct: ''},
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
      await axios.patch(`${MANAGEMENT_API}`, {
        "user_metadata[preferred_name]": preferredName.value,
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

.img-thumbnail {
  box-shadow: none;
}

</style>