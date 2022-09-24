import { createRouter, createWebHistory } from 'vue-router'
import LandingPage from './components/LandingPage.vue'
import UserDashboard from './components/UserDashboard.vue'
import UserProfile from './components/UserProfile.vue'
import TaskList from './components/TaskList.vue'
import GratitudeBoard from './components/GratitudeBoard.vue'
import AboutPage from './components/AboutPage.vue'

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
    },
    {
      path: '/tasklist',
      component: TaskList
    },
    {
      path: '/profile',
      component: UserProfile,
    },
    {
      path: '/board',
      component: GratitudeBoard
    },
    {
      path: '/about',
      component: AboutPage
    },
  ]
})