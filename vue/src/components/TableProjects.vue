<template>
  <div>
    <table class="table table-striped is-hoverable">
      <thead>
        <tr>
          <th></th>
          <th></th>
          <th></th>
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
              v-on:click="deleteProject(column.id, column.title)"
            >
              Delete
            </button>
          </th>
          <th>
            <button class="button is-warning">
              <router-link
                :to="{ name: 'EditProject', params: { id: column.id } }"
              >
                <font-awesome-icon icon="fa-solid fa-pen-to-square" />
              </router-link>
            </button>
          </th>
          <th>{{ column.title }}</th>
          <!-- <th></th> -->
          <th>{{ getProjectManager(2) }}</th>
          <th>{{ column.team }}</th>
          <th>{{ column.start_date }}</th>
          <th>{{ column.finish_date }}</th>
          <th>{{ column.state }}</th>
          <!-- <th>
            <progress
              class="progress is-primary"
              value= "100"
              max="100"
            >
              {{ column.progress }}
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
const baseURL = "http://localhost:3000";
export default {
  setup() {
    //let projects = [];
  },
  mounted() {
    //GET actual projects from database
    axios.get(`${baseURL}/projects.json`).then((response) => {
      this.projects = response.data;
      response.data.forEach((item) => {
        this.projectsIds.push(item.id);
      });
      //console.log(this.projectsIds);
    });

    // GET relations between projects and users from database
    axios.get(`${baseURL}/users_projects.json`).then((response) => {
      this.team = response.data;
      console.log(this.team);
    });

    // console.log(this.projectsIds)
    // this.projectsIds.forEach((projectId)=>{
    //   console.log(projectId)
    //   // axios.get(`http://localhost:3000/get_project_manager/${projectId}.json`)
    //   // .then((response) => {
    //   //   //this.team = response.data;
    //   //   this.relationData.push({project: projectId, user: response.data})

    //   // })

    // })
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
    getProjectManager(projectId) {
      axios
        .get(`${baseURL}/get_project_manager/${projectId}.json`)
        .then((response) => {
          //this.team = response.data;
          console.log(response.data);
          return response.data;
        });
    },
    deleteProject(projectId, projectTitle) {
      axios
        .delete(`${baseURL}/projects/` + projectId + ".json")
        .then(
          () => location.reload(),
          this.$swal(`Project "` + projectTitle + `" removed successfully`)
        );
    },

    getTeamMembers(projectId) {
      axios.get(`${baseURL}/get_team/${projectId}.json`).then((response) => {
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
