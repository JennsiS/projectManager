<template>
  <HeaderNav />
  <button class="button is-success is-outlined add-button" v-on:click="">
    <router-link :to="{ name: 'CreateProject' }"> Add </router-link>
  </button>
  <TableProjects />
</template>

<script setup>
import TableProjects from "@/components/TableProjects.vue";
import HeaderNav from "@/components/HeaderNav.vue";
</script>

<style scoped>
.add-button {
  margin-top: 3%;
  text-decoration: none;
}
</style>
