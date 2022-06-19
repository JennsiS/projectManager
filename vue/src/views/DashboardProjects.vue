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
    <button class="button is-success">
      <router-link :to="{ name: 'CreateProject' }"> Add project </router-link>
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
</style>
