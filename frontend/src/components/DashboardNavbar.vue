<template>
  <nav>
    <div class="d-grid col-6 pt-3 pb-3">
      <button class="btn btn-info bg-gradient" type="button" data-bs-toggle="offcanvas" data-bs-target="#dashboardNav" aria-controls="offcanvasExample">
        <strong>Go to...</strong>
      </button>
    </div>

    <div class="offcanvas offcanvas-start text-dark text-center" data-bs-scroll="true" data-bs-backdrop="false" tabindex="-1" id="dashboardNav" aria-labelledby="dashboardNav">
      <div class="offcanvas-header">
        <h2 class="display-2">Navigation</h2>
        <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
      </div>
      <div class="offcanvas-body">
      <div class="btn-group-vertical btn-group-lg">
        <button class="btn btn-sm btn-info bg-gradient p-2 mb-2"><router-link to="/dashboard">Dashboard</router-link></button>
        <button class="btn btn-sm btn-info bg-gradient p-2 mb-2"><router-link to="/tasklist">Activities</router-link></button>
        <button class="btn btn-sm btn-info bg-gradient p-2 mb-2"><router-link to="">Gratitude Board</router-link></button>
        <button class="btn btn-sm btn-info bg-gradient p-2 mb-2"><router-link to="">Sleep Tracker</router-link></button>
        <button class="btn btn-sm btn-info bg-gradient p-2 mb-2"><router-link to="">Journal</router-link></button>
        <button class="btn btn-sm btn-info bg-gradient p-2 mb-2"><router-link to="">Statistics</router-link></button>
        <button class="btn btn-sm btn-info bg-gradient p-2 mb-2"><router-link to="/profile">Profile</router-link></button>
      </div>
      </div>
    </div>
  </nav>
</template>

<script>
export default {
  name: "DashboardNavbar"
}
</script>

<style scoped>

</style>