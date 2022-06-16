<template>
  <div>
    <table class="table table-striped is-hoverable">
      <thead>
        <tr>
          <th></th>
          <th></th>
          <!-- <th></th> -->
          <th>{{ "Name" }}</th>
          <th>{{ "Project manager" }}</th>
          <th>{{ "Team" }}</th>
          <th>{{ "Start Date" }}</th>
          <th>{{ "End Date" }}</th>
          <th>{{ "State" }}</th>
          <!-- <th>{{ "Progress" }}</th> -->
        </tr>
      </thead>
      <tbody>
        <tr v-for="(column, index) in projects" :key="index">
          <th>
            <button class="button is-primary">
              <router-link :to="{ name: 'RoadMap', params: { id: column.id } }">
                View
              </router-link>
            </button>
          </th>
          <th>
            <button
              class="button is-danger delete"
              v-on:click="deleteProject(column.id)"
            >
              Delete
            </button>
          </th>
          <th>{{ column.title }}</th>
          <!-- <th></th> -->
          <th>{{ getTeamMembers(column.id) }}</th>
          <th>{{ column.team }}</th>
          <th>{{ column.start_date }}</th>
          <th>{{ column.finish_date }}</th>
          <th>{{ column.state }}</th>
          <!-- <th>
            <progress class="progress is-primary" value="15" max="100">
              {{ column.project.progress }}
              15%
            </progress>
          </th> -->
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
import axios from "axios";
export default {
  setup() {
    //let projects = [];
  },
  mounted() {
    //GET actual projects from database
    axios.get("http://localhost:3000/projects.json").then((response) => {
      this.projects = response.data;
      response.data.forEach((item) => {
        this.projectsIds.push(item.id);
      });
      //console.log(this.projectsIds);
    });

    // GET relations between projects and users from database
    axios.get("http://localhost:3000/users_projects.json").then((response) => {
      this.team = response.data;
      //console.log(this.team);
    });

    // GET users
    // axios.get("http://localhost:3000/users_projects.json").then((response) => {
    //   this.team = response.data.list;
    // });
  },
  data() {
    return {
      projects: [],
      users: [],
      team: [],
      projectsIds: [],
      relationData: [],
    };
  },
  methods: {
    deleteProject(projectId) {
      axios
        .delete("http://localhost:3000/projects/" + projectId + ".json")
        .then(
          () =>
            this.$swal(
              "Project with id: " + projectId + " removed successfully"
            ),
          this.$forceUpdate()
        );
    },

    getTeamMembers(projectId) {
      axios
        .get(`http://localhost:3000/get_team/${projectId}.json`)
        .then((response) => {
          response.data.forEach((user) => {
            this.relationData.push({
              user_id: user.user_id,
              project_id: projectId,
            });
            //console.log(user.user_id)
          });

          //console.log(response.data[0].user_id);
          //console.log(response.data)
          //this.team.push(response.data);
        });
      console.log(this.relationData);
      //console.log(this.team);
      //return this.team;
    },
    getProjectManager() {},
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

button a {
  text-decoration: none;
  color: black;
}
</style>
