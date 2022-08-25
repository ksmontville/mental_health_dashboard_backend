<script setup>
import PageHeader from './components/PageHeader.vue'
import PageFooter from './components/PageFooter.vue'
import TaskList from './components/TaskList.vue';
import Navbar from './components/Navbar.vue';
</script>

<template>
  <div id="mainWrapper" class="wrapper">
    <header>
      <PageHeader />
    </header>

    <nav>
      <Navbar />
    </nav>

    <main>
      <Suspense>
        <router-view />
        <template #fallback>
          <span>There was an error.</span>
        </template>
      </Suspense>
    </main>

    <footer>
      <PageFooter />
    </footer>
  </div>
</template>

<style scoped>

@import './assets/main.css';

</style>
