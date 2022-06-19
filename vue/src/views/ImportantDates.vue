<script>
//Using https://github.com/richardtallent/vue-simple-calendar-sample/blob/main/src/App.vue as a template

import {
  CalendarView,
  CalendarViewHeader,
  CalendarMath,
} from "vue-simple-calendar";
import "../../node_modules/vue-simple-calendar/dist/style.css";
import ProjectOptions from "../components/ProjectOptions.vue";
import HeaderNav from "../components/HeaderNav.vue";
import axios from "axios";
import { baseURL } from "../plugins/axios";

export default {
  name: "App",
  components: {
    CalendarView,
    CalendarViewHeader,
    ProjectOptions,
    HeaderNav,
  },
  data() {
    return {
      importantDates: [],
      showDate: this.thisMonth(1),
      message: "",
      startingDayOfWeek: 0,
      disablePast: false,
      disableFuture: false,
      displayPeriodUom: "month",
      displayPeriodCount: 1,
      displayWeekNumbers: false,
      showTimes: true,
      selectionStart: null,
      selectionEnd: null,
      newItemTitle: "",
      newItemStartDate: "",
      newItemEndDate: "",
      newItemDescription: "",
      useDefaultTheme: true,
      useHolidayTheme: true,
      useTodayIcons: false,
      items: [],
      projectId: this.$route.params.id,
    };
  },
  computed: {
    userLocale() {
      return CalendarMath.getDefaultBrowserLocale;
    },
    dayNames() {
      return CalendarMath.getFormattedWeekdayNames(this.userLocale, "long", 0);
    },
    themeClasses() {
      return {
        "theme-default": this.useDefaultTheme,
        "holiday-us-traditional": this.useHolidayTheme,
        "holiday-us-official": this.useHolidayTheme,
      };
    },
  },
  mounted() {
    this.newItemStartDate = CalendarMath.isoYearMonthDay(CalendarMath.today());
    this.newItemEndDate = CalendarMath.isoYearMonthDay(CalendarMath.today());
    // GET important dates based on the project id
    axios
      .get(`${baseURL}/get_important_dates/${this.projectId}.json`)
      .then((response) => {
        //console.log(response.data);
        response.data.forEach((item) => {
          let newDate = {
            id: item.id,
            startDate: item.date,
            title: item.name + ":\n" + item.description,
            description: item.description,
          };
          this.items.push(newDate);
        });
        console.log(this.items);
      });
  },
  methods: {
    thisMonth(d, h, m) {
      const t = new Date();
      return new Date(t.getFullYear(), t.getMonth(), d, h || 0, m || 0);
    },
    onClickDay(d) {
      this.selectionStart = null;
      this.selectionEnd = null;
      this.message = `You clicked: ${d.toLocaleDateString()}`;
    },
    onClickItem(e) {
      this.message = `You clicked: ${e.title}`;
    },
    setShowDate(d) {
      this.message = `Changing calendar view to ${d.toLocaleDateString()}`;
      this.showDate = d;
    },
    setSelection(dateRange) {
      this.selectionEnd = dateRange[1];
      this.selectionStart = dateRange[0];
    },
    finishSelection(dateRange) {
      this.setSelection(dateRange);
      this.message = `You selected: ${this.selectionStart.toLocaleDateString()} -${this.selectionEnd.toLocaleDateString()}`;
    },
    onDrop(item, date) {
      this.message = `You dropped ${item.id} on ${date.toLocaleDateString()}`;
      // Determine the delta between the old start date and the date chosen,
      // and apply that delta to both the start and end date to move the item.
      const eLength = CalendarMath.dayDiff(item.startDate, date);
      item.originalItem.startDate = CalendarMath.addDays(
        item.startDate,
        eLength
      );
      item.originalItem.endDate = CalendarMath.addDays(item.endDate, eLength);
    },
    clickTestAddItem() {
      this.items.push({
        startDate: this.newItemStartDate,
        endDate: this.newItemEndDate,
        title: this.newItemTitle,
        id: "e" + Math.random().toString(36).substr(2, 10),
        description: this.newItemDescription,
      });
      //this.message = "You added a calendar item!";
      let newDate = {
        date: this.newItemStartDate,
        description: this.newItemDescription,
        name: this.newItemTitle,
        project_id: this.projectId,
      };
      axios
        .post(`${baseURL}/important_dates.json`, {
          important_date: newDate,
        })
        .then((res) => {
          this.success = true;
          this.$swal("Date added successfully");
        })
        .catch((error) => {
          this.error = error.data;
          this.$swal("Failed to add date, check date fields");
        });
    },
  },
  // TODO: Make a POST to database in table important_dates
};
</script>

<template>
  <div>
    <HeaderNav />
    <ProjectOptions :projectId="this.projectId" />
    <h3>Important Dates</h3>
    <div id="calendar">
      <div class="calendar-controls">
        <div v-if="message" class="notification is-success">{{ message }}</div>

        <div class="box">
          <h4 class="title is-5">Play with the options!</h4>

          <div class="field">
            <label class="label">Period UOM</label>
            <div class="control">
              <div class="select">
                <select v-model="displayPeriodUom">
                  <option>month</option>
                  <option>week</option>
                  <option>year</option>
                </select>
              </div>
            </div>
          </div>

          <div class="field">
            <label class="label">Starting day of the week</label>
            <div class="control">
              <div class="select">
                <select v-model="startingDayOfWeek">
                  <option
                    v-for="(d, index) in dayNames"
                    :key="index"
                    :value="index"
                  >
                    {{ d }}
                  </option>
                </select>
              </div>
            </div>
          </div>

          <div class="field">
            <label class="checkbox">
              <input v-model="displayWeekNumbers" type="checkbox" />
              Show week number
            </label>
          </div>

          <div class="field">
            <label class="checkbox">
              <input v-model="showTimes" type="checkbox" />
              Show times
            </label>
          </div>
        </div>

        <div class="box">
          <div class="field">
            <label class="label">Title</label>
            <div class="control">
              <input v-model="newItemTitle" class="input" type="text" />
            </div>
          </div>

          <div class="field">
            <label class="label">Start date</label>
            <div class="control">
              <input v-model="newItemStartDate" class="input" type="date" />
            </div>
          </div>

          <div class="field">
            <label class="label">End date</label>
            <div class="control">
              <input v-model="newItemEndDate" class="input" type="date" />
            </div>
          </div>

          <button class="button is-info" @click="clickTestAddItem">
            Add Item
          </button>
        </div>
      </div>
      <div class="calendar-parent">
        <calendar-view
          :items="items"
          :show-date="showDate"
          :time-format-options="{ hour: 'numeric', minute: '2-digit' }"
          :enable-drag-drop="true"
          :disable-past="disablePast"
          :disable-future="disableFuture"
          :show-times="showTimes"
          :date-classes="myDateClasses"
          :display-period-uom="displayPeriodUom"
          :display-period-count="displayPeriodCount"
          :starting-day-of-week="startingDayOfWeek"
          :class="themeClasses"
          :period-changed-callback="periodChanged"
          :current-period-label="useTodayIcons ? 'icons' : ''"
          :displayWeekNumbers="displayWeekNumbers"
          :enable-date-selection="true"
          :selection-start="selectionStart"
          :selection-end="selectionEnd"
          @date-selection-start="setSelection"
          @date-selection="setSelection"
          @date-selection-finish="finishSelection"
          @drop-on-date="onDrop"
          @click-date="onClickDay"
          @click-item="onClickItem"
        >
          <template #header="{ headerProps }">
            <calendar-view-header
              slot="header"
              :header-props="headerProps"
              @input="setShowDate"
            />
          </template>
        </calendar-view>
      </div>
    </div>
  </div>
</template>

<style>
#calendar {
  display: flex;
  flex-direction: row;
  font-family: Calibri, sans-serif;
  width: 95vw;
  min-width: 30rem;
  max-width: 100rem;
  min-height: 40rem;
  margin-left: auto;
  margin-right: auto;
}
.calendar-controls {
  margin-right: 1rem;
  min-width: 14rem;
  max-width: 14rem;
}
.calendar-parent {
  display: flex;
  flex-direction: column;
  flex-grow: 1;
  overflow-x: hidden;
  overflow-y: hidden;
  max-height: 80vh;
  background-color: white;
}
/* For long calendars, ensure each week gets sufficient height. The body of the calendar will scroll if needed */
.cv-wrapper.period-month.periodCount-2 .cv-week,
.cv-wrapper.period-month.periodCount-3 .cv-week,
.cv-wrapper.period-year .cv-week {
  min-height: 6rem;
}
/* These styles are optional, to illustrate the flexbility of styling the calendar purely with CSS. */
/* Add some styling for items tagged with the "birthday" class */
.theme-default .cv-item.birthday {
  background-color: #e0f0e0;
  border-color: #d7e7d7;
}
.theme-default .cv-item.birthday::before {
  content: "\1F382"; /* Birthday cake */
  margin-right: 0.5em;
}
/* The following classes style the classes computed in myDateClasses and passed to the component's dateClasses prop. */
.theme-default .cv-day.ides {
  background-color: #ffe0e0;
}
.ides .cv-day-number::before {
  content: "\271D";
}
.cv-day.do-you-remember.the-21st .cv-day-number::after {
  content: "\1F30D\1F32C\1F525";
}
</style>
