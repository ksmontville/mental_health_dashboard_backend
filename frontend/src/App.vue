<script setup>
import PageHeader from './components/PageHeader.vue'
import Navbar from './components/Navbar.vue';
import PageFooter from './components/PageFooter.vue'
</script>

<template>

<!--    <header class="container-fluid bg-gradient">-->
<!--      <PageHeader />-->
<!--    </header>-->

    <nav class="container-fluid">
      <Suspense>
          <Navbar />
          <template #fallback>
            <h4>Loading Nav...</h4>
          </template>
      </Suspense>
    </nav>

    <main class="container-fluid">
      <Suspense>
        <router-view />
          <template #fallback>
            <h4>Loading... </h4>
          </template>
      </Suspense>
    </main>

    <footer class="container-fluid">
      <PageFooter />
    </footer>

</template>

<style scoped>

@import './assets/main.css';

</style>
