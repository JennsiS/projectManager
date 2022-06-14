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
        <div id="app">
          <!-- Selected date: {{ niceDate }} -->
          <button ref="trigger" type="button">Change</button>
        </div>
      </div>

      <div class="field">
        <label class="label">Finish date</label>
        <div id="app">
          <!-- Selected date: {{ niceDate }} -->
          <button ref="trigger2" type="button">Change</button>
        </div>
      </div>

      <div class="field">
        <label class="label">State</label>
        <div class="control">
          <div class="select">
            <select
              id="stateSelection"
              @change="getState"
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
            />
          </div>
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
import bulmaCalendar from "bulma-calendar/dist/js/bulma-calendar.min.js";
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
      users: ["Luis", "Eddy", "Erick"],
      projectTitle: "",
      projectDescription: "",
      projectStartDate: "",
      projectFinishDate: "",
      projectState: "",
    };
  },
  mounted() {
    const calendarStart = new bulmaCalendar(this.$refs.trigger, {
      startDate: this.startDate,
    });
    calendarStart.on(
      "date:selected",
      (e) => (this.startDate = e.start || null)
    );

    const calendarEnd = new bulmaCalendar(this.$refs.trigger2, {
      startDate: this.endDate,
    });
    calendarEnd.on("date:selected", (e) => (this.endDate = e.start || null));
  },
  computed: {
    niceDate() {
      if (this.date) {
        return this.date.toLocaleDateString();
      } else {
        return this.date;
      }
    },
  },
  setup() {
    let success = false;
    let error = false;
  },
  methods: {
    getState() {
      var e = document.getElementById("stateSelection");
      var valor = e.value;
      alert(valor);
    },
    //TODO: Make a GET to database in users table and save it to a dictionary
    getUsers() {},

    //TODO: Make a POST to database in projects table
    createNewProject() {
      const newProject = {
        title: this.projectTitle,
        description: this.projectDescription,
        start_date: this.startDate,
        finish_date: this.endDate,
        state: this.projectState,
      };
      console.log(newProject);
      axios
        .post("http://127.0.0.1:3000/projects.json", { project: newProject })
        .then((res) => {
          success = true;
        })
        .catch((error) => {
          error = error.data;
        });
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
