<template>
  <div class="container-fluid">
    <router-link to="/"><h1 class="display-1">MasterMind</h1></router-link>
    <figure class="text-center">
      <blockquote class="blockquote" style="color: lightcyan">
        <small>Change what you can, manage what you can't.</small>
      </blockquote>
      <figcaption class="blockquote-footer">
        <cite style="color:lightyellow">Raymond McCauley</cite>
      </figcaption>
    </figure>
  </div>
</template>

<script>

export default {
  name: "PageHeader",

    setup() {
  },
}

</script>

<style scoped>

  a {
    color: white;
    text-decoration: none;
  }

</style>