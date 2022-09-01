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
        <button class="btn btn-sm btn-info bg-gradient mb-3 mt-3"><router-link to="/dashboard">My Dashboard</router-link></button>
        <button class="btn btn-sm btn-info bg-gradient mb-3 mt-3"><router-link to="/tasklist">My Activities</router-link></button>
        <button class="btn btn-sm btn-info bg-gradient mb-3 mt-3"><router-link to="">My Journal</router-link></button>
        <button class="btn btn-sm btn-info bg-gradient mb-3 mt-3"><router-link to="">My Statistics</router-link></button>
        <button class="btn btn-sm btn-info bg-gradient mb-3 mt-3"><router-link to="/profile">My Profile</router-link></button>
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