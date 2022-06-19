<script>
import axios from "axios";
import { baseURL } from "../plugins/axios";

export default {
  props: { projectId: String },
  mounted() {
    //location.reload();
    //GET actual projects from database
    axios
      .get(`${baseURL}/all_project_phases/${this.projectId}.json`)
      .then((response) => {
        this.phases = response.data;
        //console.log(this.phases);
      });
  },
  data() {
    return {
      phases: [],
    };
  },
  methods: {
    //TODO: Make a GET to phases and project phases to show all phases from a project
    getTeamMembers(projectId, phaseId) {
      axios
        .get(`${baseURL}/get_team/${projectId}/${phaseId}.json`)
        .then((response) => {
          //return response.data;
          console.log(response.data);
        });
    },

    deletePhase(phaseId, phaseName) {
      axios
        .delete(`${baseURL}/phases/` + phaseId + ".json")
        .then(
          () => location.reload(),
          this.$swal(`Phase "` + phaseName + `" removed successfully`)
        );
    },
  },
};
</script>

<template>
  <div>
    <table class="table table-striped is-hoverable">
      <thead>
        <tr>
          <th></th>
          <th>{{ "Name" }}</th>
          <!-- <th>{{ "Project manager" }}</th>
          <th>{{ "Team" }}</th> -->
          <th>{{ "Start Date" }}</th>
          <th>{{ "End Date" }}</th>
          <th>{{ "Description" }}</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="column in phases" :key="column">
          <th>
            <button
              class="button is-danger delete"
              v-on:click="deletePhase(column.id, column.name)"
            >
              Delete
            </button>
          </th>
          <th>{{ column.name }}</th>
          <!-- <th></th> -->
          <!-- <th>{{ getTeamMembers(projectId, column.id) }}</th> -->
          <!-- <th>project manager</th>
          <th>team</th> -->
          <th>{{ column.start_date }}</th>
          <th>{{ column.finish_date }}</th>
          <th>{{ column.description }}</th>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<style scoped>
.table {
  margin-top: 5%;
}
.delete {
  width: 50%;
}
</style>
