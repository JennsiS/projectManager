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
    getProjectPage(projectId) {
      //alert(projectId);
      //alert(this.projects[projectId].name);
      // let project = this.projects.filter(allProjects => allProjects.id === 1);
      //alert(project.id);
      let name = this.projects[projectId - 1].name;
      alert("Cambiando a proyecto " + name);
    },
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
