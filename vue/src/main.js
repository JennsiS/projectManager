import { createApp } from "vue";
import App from "./App.vue";
import router from "./router";
import "bootstrap/dist/css/bootstrap.css";
import { library } from "@fortawesome/fontawesome-svg-core";
import { faTrash } from "@fortawesome/free-solid-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/vue-fontawesome";
//import bulmaCalendar from '~bulma-calendar/dist/js/bulma-calendar.min.js';
import VueAxios from "vue-axios";
import axios from "axios";

// import VueAxios from "vue-axios";

library.add(faTrash);

const app = createApp(App);

app.use(router);

app.use(VueAxios, axios);

app.component("font-awesome-icon", FontAwesomeIcon);

app.mount("#app");

import "bootstrap/dist/js/bootstrap.js";

