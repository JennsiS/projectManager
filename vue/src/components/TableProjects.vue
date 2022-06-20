<script>
import axios from "axios";
import { baseURL } from "../plugins/axios";

export default {
  mounted() {
    //GET actual projects from database
    axios.get(`${baseURL}/projects.json`).then((response) => {
      this.projects = response.data;
      response.data.forEach((item) => {
        this.projectsIds.push(item.id);
      });
      this.projectsIds.forEach((projectId) => {
        //console.log(projectId)
        this.getTeamMembers(projectId);
        //console.log(this.relationData);
      });
    });

    // GET relations between projects and users from database
    axios.get(`${baseURL}/users_projects.json`).then((response) => {
      this.team = response.data;
      //console.log(this.team);
    });

    //GET users for adding members to the project
    axios.get(`${baseURL}/users.json`).then((response) => {
      response.data.forEach((item) => {
        this.users.push(item.email);
      });
      this.allUsersInfo = response.data;
      //console.log(this.allUsersInfo);
    });

    this.projectsIds.forEach((projectId) => {
      //console.log(projectId)
      this.getTeamMembers(projectId);
      //console.log(this.relationData);
    });
    //console.log(this.relationPM);

    //console.log(this.projectsIds);
  },
  data() {
    return {
      projects: [],
      users: [],
      team: [],
      projectsIds: [],
      relationData: [],
      allUsersInfo: [],
      relationPM: [],
    };
  },
  methods: {
    getProjectManager(projectId) {
      axios
        .get(`${baseURL}/get_project_manager/${projectId}.json`)
        .then((response) => {
          response.data.forEach((userId) => {
            this.allUsersInfo.forEach((user) => {
              if (user.id === userId) {
                console.log(user.email);
                this.relationPM.push({
                  user_id: userId,
                  email: user.email,
                  project: projectId,
                });
              }
            });
          });
          //this.team = response.data;
          //console.log(response.data);
          //return response.data;
        });
      //console.log(this.relationPM)
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
      axios
        .get(`${baseURL}/team_members/${projectId}.json`)
        .then((response) => {
          response.data.forEach((user) => {
            this.allUsersInfo.forEach((userInfo) => {
              if (userInfo.id === user.user_id) {
                this.relationData.push({
                  user_id: user.user_id,
                  project_id: projectId,
                  email: userInfo.email,
                });
              }
            });
            //console.log(response.data);

            //console.log(user.user_id)
          });
          //console.log(this.relationData);
          //console.log(this.relationData.find(obj => obj.project_id == projectId))
          console.log(
            this.relationData.filter(
              (projects) => projects.project_id === projectId
            )
          );
        });

      //console.log(this.relationData);
      //console.log(this.team);
      //return this.team;
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
          <th></th>
          <th></th>
          <th>{{ "Name" }}</th>
          <th>{{ "Team" }}</th>
          <!-- <th>{{ "Team" }}</th> -->
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
          <th></th>
          <!-- <th>{{ getTeamMembers(column.id) }}</th> -->
          <!-- <th>{{ column.team }}</th> -->
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
