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
  data() {
    return {
      projectId: this.$route.params.id,
    };
  },
  mounted() {},
};
</script>

<template>
  <div>
    <HeaderNav />
    <ProjectOptions :projectId="this.projectId" />
    <h3>Phases</h3>
    <button class="button is-success is-outlined add-button">
      <router-link
        :to="{ name: 'CreatePhase', params: { id: this.projectId } }"
      >
        Add
      </router-link>
    </button>
    <TablePhases :projectId="this.projectId" />
  </div>
</template>

<style scoped>
.add-button {
  margin-top: 5%;
  text-decoration: none;
}
button a {
  text-decoration: none;
}
</style>
