<script>
import TablePhases from "@/components/TablePhases.vue";
import HeaderNav from "@/components/HeaderNav.vue";
import ProjectOptions from "../components/ProjectOptions.vue";
import axios from "axios";
import { baseURL } from "../plugins/axios";

export default {
  components: {
    TablePhases,
    HeaderNav,
    ProjectOptions,
  },
  data() {
    return {
      projectId: this.$route.params.id,
      projectName: "",
    };
  },
  mounted() {
    //GET project name
    axios.get(`${baseURL}/projects/${this.projectId}.json`).then((response) => {
      this.projectName = response.data.title;
    });
  },
};
</script>

<template>
  <div>
    <HeaderNav />
    <h2>{{ this.projectName }}</h2>
    <ProjectOptions :projectId="this.projectId" />
    <h4>Phases</h4>
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
  margin-top: 3%;
  text-decoration: none;
  color: black;
}
button a {
  text-decoration: none;
}

h2 {
  color: gray;
}
</style>
