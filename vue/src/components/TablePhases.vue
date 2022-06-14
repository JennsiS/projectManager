<template>
  <div>
    <table class="table table-striped is-hoverable">
      <thead>
        <tr>
          <th></th>
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
            <button
              class="button is-primary"
              v-on:click="getProjectPage(column.id)"
            >
              View
            </button>
          </th>
          <th>
            <button class="button is-danger delete">Delete</button>
          </th>
          <th>{{ column.name }}</th>
          <th>{{ column.projectManager }}</th>
          <th>{{ column.team }}</th>
          <th>{{ column.startDate }}</th>
          <th>{{ column.endDate }}</th>
          <th>{{ column.description }}</th>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
export default {
  data() {
    return {
      phases: [
        // Agregar data del api
        {
          id: 1,
          name: "MVP",
          projectManager: "Dickerson",
          team: "Macdonald",
          startDate: "",
          endDate: "",
          description: "",
        },
        {
          id: 2,
          name: "Test",
          projectManager: "Dickerson",
          team: "Macdonald",
          startDate: "10/6/22",
          endDate: "10/8/22",
          description: "",
        },
      ],
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
