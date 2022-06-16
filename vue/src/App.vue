<!-- <template>
  <RouterView />
</template>

<script setup>
import { RouterView } from "vue-router";
</script>

<style>
@import "@/assets/application.scss";
@import url("https://fonts.googleapis.com/css2?family=Nunito&display=swap");

#app {
  max-width: 1280px;
  margin: 0 auto;
  padding: 2rem;
  font-family: "Nunito", sans-serif;
}

header {
  line-height: 1.5;
  max-height: 100vh;
}

a,
.green {
  text-decoration: none;
  color: hsla(160, 100%, 37%, 1);
  transition: 0.4s;
}

@media (hover: hover) {
  a:hover {
    background-color: hsla(160, 100%, 37%, 0.2);
  }
}
</style> -->
<template>
  <!-- <SessionManager /> -->
  <RouterView />
</template>

<script>
//import SessionManager from "./components/SessionManager.vue";
import { RouterView } from "vue-router";
export default {
  components: {
    //SessionManager,
    RouterView,
  },
};
</script>

<style>
@import "@/assets/application.scss";
@import url("https://fonts.googleapis.com/css2?family=Nunito&display=swap");

#app {
  max-width: 1280px;
  margin: 0 auto;
  padding: 2rem;
  font-family: "Nunito", sans-serif;
}

header {
  line-height: 1.5;
  max-height: 100vh;
}

a,
.green {
  text-decoration: none;
  color: hsla(160, 100%, 37%, 1);
  transition: 0.4s;
}

@media (hover: hover) {
  a:hover {
    background-color: hsla(160, 100%, 37%, 0.2);
  }
}
</style>
