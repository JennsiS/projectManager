//import Vue from "vue";

import { createApp } from "vue";

import App from "./App.vue";

import router from "./router";

import "bootstrap/dist/js/bootstrap.js";
import "bootstrap/dist/css/bootstrap.css";
import "timeline-vuejs/dist/timeline-vuejs.css";
//import { FontAwesomeIcon } from "@fortawesome/vue-fontawesome";

//import VueAxios from "vue-axios";
//import axios from "axios";

// import VueAxios from "vue-axios";

const app = createApp(App);
app.use(router);

//app.use("font-awesome-icon", FontAwesomeIcon);

//Vue.use(router);

//app.use(axios);
app.mount("#app");
