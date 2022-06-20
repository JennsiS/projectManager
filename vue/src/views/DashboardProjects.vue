<script>
import TableProjects from "@/components/TableProjects.vue";
import HeaderNav from "@/components/HeaderNav.vue";

export default {
  components: {
    TableProjects,
    HeaderNav,
  },
};
</script>

<template>
  <div>
    <HeaderNav />
    <h2>All projects</h2>
    <button class="button is-success">
      <router-link :to="{ name: 'CreateProject' }"> New project </router-link>
    </button>
    <TableProjects />
  </div>
</template>

<style scoped>
.button a {
  margin-top: 3%;
  text-decoration: none;
  color: black;
}

h2 {
  padding: 3%;
  text-align: center;
  color: black;
}
</style>
