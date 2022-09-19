import { createApp } from 'vue'
import { createAuth0 } from '@auth0/auth0-vue'
import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap/dist/js/bootstrap.js'
import './assets/main.css'
import Vue3TouchEvents from 'vue3-touch-events'
import VueKonva from 'vue-konva'
import App from './App.vue'
import router from './router'
import PageHeader from './components/PageHeader.vue'
import Navbar from './components/Navbar.vue'
import LandingPage from './components/LandingPage.vue'
import UserDashboard from './components/UserDashboard.vue'
import TaskList from './components/TaskList.vue'
import UserProfile from './components/UserProfile.vue'
import PageFooter from './components/PageFooter.vue'
import DashboardNavbar from './components/DashboardNavbar.vue'
import GratitudeBoard from './components/GratitudeBoard.vue'
const app = createApp(App)
app
    .use(router)
    .use(
        createAuth0({
        domain: "django-rest-api.us.auth0.com",
        client_id: "VMN7Hcn9n66tAfMrzRMM48bx1o9q3aes",
        redirect_uri: window.location.origin,
        audience: "https://django-rest-api",
        })
    )
    .use(Vue3TouchEvents)
    .use(VueKonva)
    .component('PageHeader', PageHeader)
    .component('Navbar', Navbar)
    .component('LandingPage', LandingPage)
    .component('UserDashboard', UserDashboard)
    .component('DashboardNavbar', DashboardNavbar)
    .component('TaskList', TaskList)
    .component('UserProfile', UserProfile)
    .component('GratitudeBoard', GratitudeBoard)
    .component('PageFooter', PageFooter)
    .mount('#app')

