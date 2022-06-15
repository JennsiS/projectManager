<template>
  <div>
    <table class="table table-striped is-hoverable">
      <thead>
        <tr>
          <th></th>
          <th>{{ "Name" }}</th>
          <th>{{ "Project manager" }}</th>
          <th>{{ "Team" }}</th>
          <th>{{ "Start Date" }}</th>
          <th>{{ "End Date" }}</th>
          <th>{{ "Description" }}</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="column in phases" :key="column">
          <th>
            <button class="button is-danger delete">Delete</button>
          </th>
          <th>{{ column.name }}</th>
          <th>project manager</th>
          <th>team</th>
          <th>{{ column.start_date }}</th>
          <th>{{ column.finish_date }}</th>
          <th>{{ column.description }}</th>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
import axios from "axios";

export default {
  mounted() {
    //GET actual projects from database
    axios.get("http://localhost:3000/phases.json").then((response) => {
      this.phases = response.data;
      console.log(this.phases);
    });
  },
  data() {
    return {
      phases: [],
    };
  },
  methods: {
    //TODO: Make a GET to phases and project phases to show all phases from a project
  },
};
</script>

<style scoped>
.table {
  margin-top: 5%;
}
.delete {
  width: 50%;
}
</style>
