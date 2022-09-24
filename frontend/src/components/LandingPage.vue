<template>
  <div class="container-fluid content bg-wrapper">
    <section class="container-sm rounded-4 d-flex flex-column justify-content-center content content--intro mt-3 mb-3">
        <h1 class="transparent__text display-1 text-center p-4 mb-4">Your mental health matters.</h1>
    </section>

    <section class="container-fluid content content--call p-3 mb-3">
      <span>
        <img src="/icon/chevron-double-right.svg" class="p-3 mb-3" alt="Chevron Double Right">
        <button class="btn btn-primary btn-lg bg-gradient p-3 mb-4" v-if="isAuthenticated" @click="router.push('/dashboard')">To Dashboard</button>
        <button class="btn btn-primary btn-lg bg-gradient p-3 mb-4" v-else @click="login">Get Started!</button>
        <img src="/icon/chevron-double-left.svg" class="p-3 mb-3" alt="Chevron Double Left">
      </span>
    </section>


    <section class="container-sm content content--features p-3 mb-3" id="features">
      <div class="transparent rounded-4 content text-container p-3 mb-3">

        <h2 class="display-2 p-2 mb-4">Get started with MasterMind.</h2>

        <h3 class="display-3">Track</h3>
        <p class="lead p-3 mb-3">Start tracking your mental health with curated exercises recommended by real medical professionals!</p>
        <h3 class="display-3">Engage</h3>
        <p class="lead p-3 mb-3">A robust set of features for taking control of your mental health.</p>
        <ul>
          <li>
            <p><img src="/icon/caret-right.svg" alt="Carat Right Icon">
                Create your own mindfulness activities, or choose from one of many presets created by mental health professionals</p>
          </li>
          <li>
            <p><img src="/icon/caret-right.svg" alt="Carat Right Icon">
                Write journal entries to catalogue your daily thoughts and feelings</p>
          </li>
          <li>
            <p><img src="/icon/caret-right.svg" alt="Carat Right Icon">
                Develop your own gratitude board to begin visualizing what is important to you</p>
          </li>
          <li>
            <p><img src="/icon/caret-right.svg" alt="Carat Right Icon">
                Align your sleep schedule</p>
          </li>
          <li>
            <p><img src="/icon/caret-right.svg" alt="Carat Right Icon">
            Record your progress with descriptive statistics and informative data visuals</p>
          </li>
        </ul>

          <h3 class="display-3">Share</h3>
          <p class="lead p-3 mb-3">Connect with other by sharing your progress on social media!</p>
          <div class="container-fluid content img-container p-3 mb-3">
            <img src="/icon/icons8-facebook-64.png" class="img-fluid no-shadow p-2 m-2" alt="Facebook Icon">
            <img src="/icon/icons8-twitter-64.png" class="img-fluid no-shadow p-2 m-2" alt="Twitter Icon">
            <img src="/icon/icons8-instagram-64.png" class="img-fluid no-shadow p-2 m-2" alt="Instagram Icon">
          </div>
        </div>
    </section>
  </div>
</template>

<script>
import { useAuth0 } from '@auth0/auth0-vue';
import router from "../router";

export default {
  name: "LandingPage",

  setup() {
    const {user, isAuthenticated, loginWithRedirect} = useAuth0();

    return {user, isAuthenticated, router,

      login: () => {
          loginWithRedirect()
        },
     }
  }
}

</script>

<style scoped>
  figcaption {
    color: lightyellow;
  }

  .no-shadow {
    box-shadow: none;
  }

  .section-break {
    padding: 1.2vw;
    background: lavender;
    border-top: 2.4vw solid lightyellow;
    box-shadow: 1.2vw 2.4vw;
    opacity: 0.75;
  }

  .carousel-inner, .carousel-control-next, .carousel-control-prev {
    border-radius: 16px;
  }

  .carousel-caption {
    color: darkslateblue;
  }
</style>