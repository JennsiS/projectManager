<template>
  <HeaderNav />
  <button class="button is-success is-outlined add-button" v-on:click="">
    Add
  </button>
  <TableProjects />
</template>

<script setup>
import TableProjects from "@/components/TableProjects.vue";
import HeaderNav from "@/components/HeaderNav.vue";
</script>

<style scoped>
.add-button {
  margin-top: 5%;
}
</style>
