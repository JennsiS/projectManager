<template>
  <div>
    <HeaderNav />
    <ProjectOptions />
    <button class="button is-success is-outlined add-button" v-on:click="">
      <router-link :to="{ name: 'CreatePhase' }"> Add </router-link>
    </button>
    <TablePhases />
  </div>
</template>

<script>
import TablePhases from "@/components/TablePhases.vue";
import HeaderNav from "@/components/HeaderNav.vue";
import ProjectOptions from "../components/ProjectOptions.vue";

export default {
  components: {
    TablePhases,
    HeaderNav,
    ProjectOptions,
  },
};
</script>

<style scoped>
.add-button {
  margin-top: 5%;
  text-decoration: none;
}
button a {
  text-decoration: none;
}
</style>
