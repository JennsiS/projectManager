<template>
  <div>
    <ProjectOptions :projectId="this.projectId" />
    <form class="box">
      <div class="field">
        <label class="label">Name</label>
        <div class="control">
          <input
            class="input"
            type="text"
            placeholder="Phase name"
            v-model="phaseName"
          />
        </div>
      </div>

      <div class="field">
        <label class="label">Description</label>
        <div class="control">
          <input
            class="input"
            type="text"
            placeholder="Phase description"
            v-model="phaseDescription"
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
            />
          </div>
        </div>
      </div>

      <div class="field is-grouped">
        <div class="control">
          <button class="button is-link" @click.prevent="createNewPhase">
            Create
          </button>
        </div>
        <div class="control">
          <button class="button is-link is-light">
            <router-link :to="{ path: `/Phases/${this.projectId}` }">
              Cancel
            </router-link>
          </button>
        </div>
      </div>
    </form>
  </div>
</template>

<script>
import ProjectOptions from "../components/ProjectOptions.vue";
import Multiselect from "@vueform/multiselect";
import axios from "axios";
//const baseURL = "http://localhost:3000";
const baseURL = "https://projects-api-20.herokuapp.com";

export default {
  components: {
    ProjectOptions,
    Multiselect,
  },
  data() {
    return {
      startDate: new Date(),
      endDate: new Date(),
      phaseName: "",
      phaseDescription: "",
      valueTeam: null,
      valuePM: null,
      users: [],
      allUsersInfo: [],
      projectId: this.$route.params.id,
      newPhaseId: "",
      userIdPM: "",
      usersTeamIds: [],
    };
  },
  mounted() {
    //GET users for selecting members the new phase
    axios.get(`${baseURL}/users.json`).then((response) => {
      response.data.forEach((item) => {
        this.users.push(item.email);
      });
      this.allUsersInfo = response.data;
      //console.log(this.allUsersInfo);
    });
  },
  methods: {
    createNewPhase() {
      const newPhase = {
        start_date: this.startDate,
        finish_date: this.endDate,
        name: this.phaseDescription,
        description: this.phaseDescription,
      };
      console.log(newPhase);

      //Making a post to phases table
      axios
        .post(`${baseURL}/phases.json`, { phase: newPhase })
        .then((res) => {
          this.success = true;

          //Get the id of the new phase created
          this.newPhaseId = res.data.id;

          this.allUsersInfo.forEach((user) => {
            if (user.email === this.valuePM) {
              this.userIdPM = user.id;
            }
          });

          let relationPM = {
            user_id: this.userIdPM,
            phase_id: this.newPhaseId,
            project_id: Number(this.projectId),
            role_user: "Project Manager",
          };
          //console.log(relationPM);

          //Make a POST to users_projects table for Project manager
          axios
            .post(`${baseURL}/projects_phases.json`, relationPM)
            .then((res) => {
              this.success = true;
              //this.$swal("Members added succesfully");
            })
            .catch((error) => {
              this.error = error.data;
              //this.$swal("Failed to add members, check fields");
            });

          //Make a POST to users_projects table for members

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
              phase_id: this.newPhaseId,
              project_id: Number(this.projectId),
              role_user: "Member",
            };
            console.log(newRelationMember);
            axios
              .post(`${baseURL}/projects_phases.json`, newRelationMember)
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

          this.$swal("Phase created successfully");
          this.phaseName = "";
          this.phaseDescription = "";
          this.valuePM = null;
          this.valueTeam = null;
          this.startDate = new Date();
          this.endDate = new Date();
        })
        .catch((error) => {
          this.error = error.data;
          this.$swal("Failed to create phase, check phase fields");
        });
    },
  },
};
</script>

<style src="@vueform/multiselect/themes/default.css"></style>
