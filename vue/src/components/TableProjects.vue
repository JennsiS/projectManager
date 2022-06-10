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
          <th>{{ "State" }}</th>
          <th>{{ "Progress" }}</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="column in projects" :key="column">
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
          <th>{{ column.state }}</th>
          <th>
            <progress class="progress is-primary" value="15" max="100">
              {{ column.progress }}
            </progress>
          </th>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
export default {
  data() {
    return {
      projects: [
        // Agregar data del api
        {
          id: 1,
          name: "Lesli",
          projectManager: "Dickerson",
          team: "Macdonald",
          startDate: "",
          endDate: "",
          state: "beta",
          progress: "50%",
        },
        {
          id: 2,
          name: "Lesli.cloud",
          projectManager: "Dickerson",
          team: "Macdonald",
          startDate: "10/6/22",
          endDate: "10/8/22",
          state: "beta",
          progress: "50%",
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
