<template>
  <nav>
    <div class="dashNav container-fluid d-lg-grid col-lg-6">
      <button class="btn btn-info bg-gradient" type="button" data-bs-toggle="offcanvas" data-bs-target="#dashboardNav" aria-controls="offcanvasExample">
        <strong>Go to...</strong>
      </button>
    </div>

    <div class="offcanvas offcanvas-start text-dark text-center" data-bs-scroll="true" data-bs-backdrop="false" tabindex="-1" id="dashboardNav" aria-labelledby="dashboardNav">
      <div class="offcanvas-header">
        <h3 class="display-3">Navigation</h3>
        <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
      </div>
      <div class="offcanvas-body">
      <div class="container-fluid btn-group-vertical btn-group-lg">
        <button class="btn btn-sm btn-info bg-gradient p-3 mb-3"><router-link to="/dashboard">Dashboard</router-link></button>
        <button class="btn btn-sm btn-info bg-gradient p-3 mb-3"><router-link to="/tasklist">Activities</router-link></button>
        <button class="btn btn-sm btn-info bg-gradient p-3 mb-3 text-decoration-line-through"><router-link to="">Journal</router-link></button>
        <button class="btn btn-sm btn-info bg-gradient p-3 mb-3"><router-link to="/board">Gratitude Board</router-link></button>
        <button class="btn btn-sm btn-info bg-gradient p-3 mb-3 text-decoration-line-through"><router-link to="">Sleep Tracker</router-link></button>
        <button class="btn btn-sm btn-info bg-gradient p-3 mb-3 text-decoration-line-through"><router-link to="">Statistics</router-link></button>
        <button class="btn btn-sm btn-info bg-gradient p-3 mb-3"><router-link to="/profile">Profile</router-link></button>
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