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
            <select
              id="stateSelection"
              v-model="projectState"
            >
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
    };
  },
  mounted() {
    //GET users for adding members to the project
    axios.get("http://localhost:3000/users.json").then((response) => {
      response.data.forEach((item) => {
        this.users.push(item.email);
      });
      this.allUsersInfo = response.data;
      console.log(this.allUsersInfo);
    });
  },
  methods: {
    createNewProject() {
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
        .post("http://127.0.0.1:3000/projects.json", { project: newProject })
        .then((res) => {
          this.success = true;
          this.$swal("Project created successfully");
        })
        .catch((error) => {
          this.error = error.data;
          this.$swal("Failed to create project, check project fields");
        });

      //TODO: Make a POST to users_projects table
      // axios
      //   .post("http://127.0.0.1:3000/users_projects.json", { users_project: newProject })
      //   .then((res) => {
      //     this.success = true;
      //   })
      //   .catch((error) => {
      //     this.error = error.data;
      //   });
    },

    // Make a POST to database in users_projects table
    createNewProjectUser() {
      let newRelation = {
        user_id: "",
        project_id: "",
        rol_project_user: "",
      };
    },
  },
};
</script>

<style src="@vueform/multiselect/themes/default.css"></style>
