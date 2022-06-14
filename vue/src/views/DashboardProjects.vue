<template>
  <div>
    <HeaderNav />
    <button class="button is-success is-outlined add-button">
      <router-link :to="{ name: 'CreateProject' }"> Add </router-link>
    </button>
    <TableProjects />
  </div>
</template>

<script>
import TableProjects from "@/components/TableProjects.vue";
import HeaderNav from "@/components/HeaderNav.vue";
import axios from 'axios';

export default {
  mounted() {
    axios.get("https://localhost:3000/projects.json").then((response) => {
      console.log(response);
    });
    //fetch('https://localhost:3000/projects.json').then((response) => response.json()).then((json) => console.log(json));
    //axios.get('https://pokeapi.co/api/v2/pokemon/ditto')
  },
  components: {
    TableProjects,
    HeaderNav,
  },
};
</script>

<style scoped>
.add-button {
  margin-top: 3%;
  text-decoration: none;
}
</style>
