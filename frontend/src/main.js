import { createApp } from 'vue'
import { createAuth0 } from '@auth0/auth0-vue'
import { Store } from "vuex";
import createPersistedState from "vuex-persistedstate";
import * as Cookies from "js-cookie";
import App from './App.vue'
import router from './router'
import PageHeader from './components/PageHeader.vue'
import PageFooter from './components/PageFooter.vue'
import UserDashboard from './components/UserDashboard.vue';
import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap/dist/js/bootstrap.js'
import './assets/main.css'

const store = new Store({
  // ...
  plugins: [
    createPersistedState({
      getState: (key) => Cookies.getJSON(key),
      setState: (key, state) =>
        Cookies.set(key, state, { expires: 3, secure: true }),
    }),
  ],
});

const app = createApp(App)
app.use(router)
app.use(store)
app.use(
  createAuth0({
    domain: "django-rest-api.us.auth0.com",
    client_id: "VMN7Hcn9n66tAfMrzRMM48bx1o9q3aes",
    redirect_uri: window.location.origin,
    audience: "https://django-rest-api",
  })
);
app.component('PageHeader', PageHeader)
app.component('PageFooter', PageFooter)
app.component('UserDashboard', UserDashboard)
app.mount('#app')

