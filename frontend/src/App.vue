<script setup>
import PageHeader from './components/PageHeader.vue'
import PageFooter from './components/PageFooter.vue'
import TaskList from './components/TaskList.vue';
</script>

<template>

  <div id="mainWrapper" class="wrapper">
    <header>
      <PageHeader />
    </header>

    <main>
      <router-view />
    </main>

    <footer>
      <PageFooter />
    </footer>
  </div>

</template>

<style scoped>

@import './assets/main.css';

</style>
