import { createRouter, createWebHistory } from 'vue-router'
import LandingPage from './components/LandingPage.vue'
import PageHeader from './components/PageHeader.vue'
import PageFooter from './components/PageFooter.vue'
import UserDashboard from "./components/UserDashboard.vue";

export default createRouter({
  history: createWebHistory(),
  routes: [
    {
      path: '/',
      component: LandingPage,
    },
    {
      path: '/dashboard',
      component: UserDashboard
    }
  ]
})