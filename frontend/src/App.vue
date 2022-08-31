<script setup>
import PageHeader from './components/PageHeader.vue'
import Navbar from './components/Navbar.vue';
import PageFooter from './components/PageFooter.vue'
</script>

<template>
    <header class="p-2 bg-gradient">
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

    <footer class="p-2 bg-gradient">
      <PageFooter />
    </footer>
</template>

<style scoped>

@import './assets/main.css';

</style>
