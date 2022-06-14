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
            <select id="stateSelection" @change="getState">
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
          <button class="button is-link" v-on:click="createNewProject()">
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
  methods: {
    getState() {
      var e = document.getElementById("stateSelection");
      var valor = e.value;
      alert(valor);
    },
    //TODO: Make a GET to database in users table and save it to a dictionary
    getUsers() {},

    //?TODO: Make a Get to projects table to assign next id to the project_id

    //TODO: Make a POST to database in projects table
    createNewProject() {
      let newProject = {
        title: document.getElementById("projectTitle").value,
        description: document.getElementById("projectDescription").value,
        start_date: this.startDate,
        finish_date: this.endDate,
        state: document.getElementById("stateSelection").value,
      };
      alert(document.getElementById("projectDescription").value);
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
