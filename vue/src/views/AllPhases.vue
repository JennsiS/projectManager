<template>
  <div>
    <HeaderNav />
    <ProjectOptions :projectId="this.projectId" />
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

<script>
import TablePhases from "@/components/TablePhases.vue";
import HeaderNav from "@/components/HeaderNav.vue";
import ProjectOptions from "../components/ProjectOptions.vue";
import axios from "axios";

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
  mounted() {
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
