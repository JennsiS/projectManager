<template>
  <div>
    <table class="table table-striped">
      <thead>
        <tr>
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
          <th>{{ column.name }}</th>
          <th>{{ column.projectManager }}</th>
          <th>{{ column.team }}</th>
          <th>{{ column.startDate }}</th>
          <th>{{ column.endDate }}</th>
          <th>{{ column.state }}</th>
          <th>
            <div class="progress">
              <div
                class="progress-bar"
                role="progressbar"
                style="width: 50%"
                aria-valuenow="25"
                aria-valuemin="0"
                aria-valuemax="100"
              >
                {{ column.progress }}
              </div>
            </div>
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
        {
          name: "Lesli",
          projectManager: "Dickerson",
          team: "Macdonald",
          startDate: "",
          endDate: "",
          state: "beta",
          progress: "50%",
        },
        {
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
};
</script>

<style scoped>
.table {
  margin-top: 5%;
}

.th {
  width: 100%;
}
</style>
