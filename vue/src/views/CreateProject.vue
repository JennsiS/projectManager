<template>
  <div>
    <HeaderNav />
    <form class="box">
      <div class="field">
        <label class="label">Title</label>
        <div class="control">
          <input
            class="input"
            type="text"
            placeholder="Project title"
            id="projectTitle"
            v-model="projectTitle"
          />
        </div>
      </div>

      <div class="field">
        <label class="label">Description</label>
        <div class="control">
          <input
            class="input"
            type="text"
            placeholder="Project description"
            id="projectDescription"
            v-model="projectDescription"
          />
        </div>
      </div>

      <div class="field">
        <label class="label">Start date</label>
        <div class="control">
          <input class="input is-info" type="date" v-model="startDate" />
        </div>
      </div>

      <div class="field">
        <label class="label">End date</label>
        <div class="control">
          <input class="input is-info" type="date" v-model="endDate" />
        </div>
      </div>

      <div class="field">
        <label class="label">State</label>
        <div class="control">
          <div class="select">
            <select id="stateSelection" v-model="projectState">
              <option
                v-for="state in states"
                v-bind:value="state"
                v-bind:key="state"
              >
                {{ state }}
              </option>
            </select>
          </div>
        </div>
      </div>

      <div class="field">
        <label class="label">Project Manager</label>
        <div class="control">
          <div>
            <Multiselect v-model="valuePM" :options="users" />
          </div>
        </div>
      </div>

      <div class="field">
        <label class="label">Team</label>
        <div class="control">
          <div>
            <Multiselect
              v-model="valueTeam"
              :options="users"
              mode="tags"
              :close-on-select="false"
              :searchable="true"
              :create-option="true"
              @change="getUsersIds"
            />
          </div>
        </div>
      </div>

      <div class="field">
        <label class="label">Progress</label>
        <div class="control">
          <input
            class="input"
            type="text"
            placeholder="Project progress"
            id="projectProgress"
            v-model="projectProgress"
          />
        </div>
      </div>

      <div class="field is-grouped">
        <div class="control">
          <button class="button is-link" @click.prevent="createNewProject">
            Create
          </button>
        </div>
        <div class="control">
          <button class="button is-link is-light">
            <router-link :to="{ name: 'dashboard_path' }"> Cancel </router-link>
          </button>
        </div>
      </div>
    </form>
  </div>
</template>

<script>
import "bulma-calendar/dist/css/bulma-calendar.min.css";
import Multiselect from "@vueform/multiselect";
import HeaderNav from "@/components/HeaderNav.vue";
import axios from "axios";
//const baseURL = "http://localhost:3000";
const baseURL = "http://projects-api-20.herokuapp.com";

export default {
  components: {
    Multiselect,
    HeaderNav,
  },
  data() {
    return {
      startDate: new Date(),
      endDate: new Date(),
      states: ["Beta", "Initiated", "Pause"],
      valueTeam: null,
      valuePM: null,
      users: [],
      allUsersInfo: [],
      projectTitle: "",
      projectDescription: "",
      projectStartDate: "",
      projectFinishDate: "",
      projectState: "",
      projectProgress: "",
      success: false,
      error: false,
      newProjectId: "",
      usersTeamIds: [],
    };
  },
  mounted() {
    //GET users for adding members to the project
    axios.get(`${baseURL}/users.json`).then((response) => {
      response.data.forEach((item) => {
        this.users.push(item.email);
      });
      this.allUsersInfo = response.data;
      //console.log(this.allUsersInfo);
    });
  },
  methods: {
    createNewProject() {
      //console.log(this.valueTeam)
      const newProject = {
        title: this.projectTitle,
        description: this.projectDescription,
        start_date: this.startDate,
        finish_date: this.endDate,
        state: this.projectState,
        progress: this.projectProgress,
      };
      //console.log(newProject);

      //Making a post to projects table
      axios
        .post(`${baseURL}/projects.json`, { project: newProject })
        .then((res) => {
          this.success = true;
          console.log(res.data.id);
          this.newProjectId = res.data.id;

          this.allUsersInfo.forEach((user) => {
            if (user.email === this.valuePM) {
              this.userIdRelation = user.id;
            }
          });

          let newRelationPM = {
            user_id: this.userIdRelation,
            project_id: this.newProjectId,
            rol_project_user: "Project Manager",
          };
          console.log(newRelationPM);

          //Make a POST to users_projects table for Project manager
          axios
            .post(`${baseURL}/users_projects.json`, {
              users_project: newRelationPM,
            })
            .then((res) => {
              this.success = true;
              //this.$swal("Members added succesfully");
              console.log("Members added succesfully");
            })
            .catch((error) => {
              this.error = error.data;
              //this.$swal("Failed to add members, check fields");
              console.log("Failed to add members, check fields");
            });

          //Make a POST to users_projects table for team members
          this.allUsersInfo.forEach((user) => {
            this.valueTeam.forEach((member) => {
              if (user.email === member) {
                this.usersTeamIds.push(user.id);
              }
            });
          });

          this.usersTeamIds.forEach((userId) => {
            let newRelationMember = {
              user_id: userId,
              project_id: this.newProjectId,
              rol_project_user: "Member",
            };
            console.log(newRelationMember);
            axios
              .post(`${baseURL}/users_projects.json`, {
                users_project: newRelationMember,
              })
              .then((res) => {
                this.success = true;
                //this.$swal("Members added succesfully");
                console.log("Members added succesfully");
              })
              .catch((error) => {
                this.error = error.data;
                //this.$swal("Failed to add members, check fields");
                console.log("Failed to add members, check fields");
              });
          });

          this.$swal("Project created successfully");
          this.projectTitle = "";
          this.projectDescription = "";
          this.valueTeam = null;
          this.valuePM = null;
          this.projectProgress = "";
        })
        .catch((error) => {
          this.error = error.data;
          this.$swal("Failed to create project, check project fields");
        });
    },
  },
};
</script>

<style src="@vueform/multiselect/themes/default.css"></style>
