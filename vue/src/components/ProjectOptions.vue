<script>
export default {
  props: { projectId: String },
};
</script>

<template>
  <div class="tabs">
    <ul>
      <li>
        <router-link :to="{ name: 'RoadMap', params: { id: projectId } }">
          Roadmap
        </router-link>
      </li>
      <li>
        <router-link
          :to="{ name: 'ImportantDates', params: { id: projectId } }"
        >
          Calendar
        </router-link>
      </li>
      <li>
        <router-link :to="{ name: 'Phases', params: { id: projectId } }">
          Phases
        </router-link>
      </li>
    </ul>
  </div>
</template>

<style scoped>
li a {
  text-decoration: none;
}
</style>
