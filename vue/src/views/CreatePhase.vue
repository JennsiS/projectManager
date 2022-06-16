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
          <button class="button is-link is-light">Cancel</button>
        </div>
      </div>
    </form>
  </div>
</template>

<script>
import ProjectOptions from "../components/ProjectOptions.vue";
import Multiselect from "@vueform/multiselect";
import axios from "axios";

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
    };
  },
  mounted() {
    //GET users for selecting members the new phase
    axios.get("http://localhost:3000/users.json").then((response) => {
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
        .post("http://127.0.0.1:3000/phases.json", { phase: newPhase })
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
          console.log(relationPM);

          //Make a POST to users_projects table for Project manager
          axios
            .post("http://127.0.0.1:3000/projects_phases.json", relationPM )
            .then((res) => {
              this.success = true;
              this.$swal("Members added succesfully");
            })
            .catch((error) => {
              this.error = error.data;
              this.$swal("Failed to add members, check fields");
            });

          this.$swal("Phase created successfully");
        })
        .catch((error) => {
          this.error = error.data;
          this.$swal("Failed to create phase, check phase fields");
        });

      //TODO: Make a POST to project_phases table
      // axios
      //   .post("http://127.0.0.1:3000/users_projects.json", { users_project: newProject })
      //   .then((res) => {
      //     this.success = true;
      //   })
      //   .catch((error) => {
      //     this.error = error.data;
      //   });
    },

    //TODO: Make a POST to add a new phase to Phases table and projects_phases
    //TODO: Make a GER to database to phases, projects_phases, and users
  },
};
</script>

<style src="@vueform/multiselect/themes/default.css"></style>
