<script setup>
import PageHeader from './components/PageHeader.vue'
import Navbar from './components/Navbar.vue';
import PageFooter from './components/PageFooter.vue'
</script>

<template>

    <header class="container-fluid p-2 bg-gradient">
      <PageHeader />
    </header>

    <nav class="container-fluid bg-gradient">
      <Navbar />
    </nav>

    <main class="container-fluid">
      <Suspense>
        <router-view />
        <template #fallback>
          <span>There was an error.</span>
        </template>
      </Suspense>
    </main>

    <footer class="container-fluid bg-gradient">
      <PageFooter />
    </footer>

</template>

<style scoped>

@import './assets/main.css';

</style>
