<template>
  <div>
    <ProjectOptions />
    <form class="box">
      <div class="field">
        <label class="label">Name</label>
        <div class="control">
          <input class="input" type="text" placeholder="Project title" />
        </div>
      </div>

      <div class="field">
        <label class="label">Description</label>
        <div class="control">
          <input class="input" type="text" placeholder="Project description" />
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

      <div class="field is-grouped">
        <div class="control">
          <button class="button is-link">Submit</button>
        </div>
        <div class="control">
          <button class="button is-link is-light">Cancel</button>
        </div>
      </div>
    </form>
  </div>
</template>

<script>
import "bulma-calendar/dist/css/bulma-calendar.min.css";
import bulmaCalendar from "bulma-calendar/dist/js/bulma-calendar.min.js";
import ProjectOptions from "../components/ProjectOptions.vue";

export default {
  components: {
    ProjectOptions,
  },
  data() {
    return {
      startDate: new Date(),
      endDate: new Date(),
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
  },
};
</script>

<style scoped></style>
