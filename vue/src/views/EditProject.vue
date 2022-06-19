<script>
import "bulma-calendar/dist/css/bulma-calendar.min.css";
import HeaderNav from "@/components/HeaderNav.vue";
import axios from "axios";
//const baseURL = "http://localhost:3000";
const baseURL = "https://projects-api-20.herokuapp.com";

export default {
  components: {
    HeaderNav,
  },
  data() {
    return {
      startDate: new Date(),
      endDate: new Date(),
      states: ["Beta", "Initiated", "Pause"],
      projectTitle: "",
      projectDescription: "",
      projectStartDate: "",
      projectFinishDate: "",
      projectState: "",
      projectProgress: "",
      success: false,
      error: false,
      projectId: this.$route.params.id,
    };
  },
  mounted() {
    //GET project
    axios.get(`${baseURL}/projects/${this.projectId}.json`).then((response) => {
      console.log(response.data);
      this.projectTitle = response.data.title;
      this.projectDescription = response.data.description;
      this.startDate = response.data.start_date;
      this.endDate = response.data.finish_date;
      this.projectState = response.data.state;
      this.projectProgress = response.data.progress;
    });
  },
  methods: {
    updateProject() {
      const newProject = {
        title: this.projectTitle,
        description: this.projectDescription,
        start_date: this.startDate,
        finish_date: this.endDate,
        state: this.projectState,
        progress: this.projectProgress,
      };

      axios
        .put(`${baseURL}/projects/${this.projectId}.json`, {
          project: newProject,
        })
        .then((res) => {
          this.success = true;
          this.$swal("Updated successfully");
        })
        .catch((error) => {
          this.error = error.data;
          this.$swal("Error de actualización, verifique los campos");
        });
    },
  },
};
</script>
<template>
  <div>
    <HeaderNav />
    <h3>Edit project</h3>
    <div class="form-container">
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
                  v-on:change="getState"
                >
                  {{ state }}
                </option>
              </select>
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
            <button class="button is-link" @click.prevent="updateProject">
              Update
            </button>
          </div>
          <div class="control">
            <button class="button is-link is-light">
              <router-link :to="{ name: 'dashboard_path' }">
                Cancel
              </router-link>
            </button>
          </div>
        </div>
      </form>
    </div>
  </div>
</template>

<style src="@vueform/multiselect/themes/default.css"></style>

<style scoped>
.form-container {
  width: 50%;
  align-items: center;
  align-content: center;
  position: absolute;
  left: 25%;
  padding: 5%;
}
</style>
