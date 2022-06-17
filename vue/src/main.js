import { createApp } from "vue";
import App from "./App.vue";
import router from "./router";
import store from "./store";

import "bootstrap/dist/js/bootstrap.js";
import "bootstrap/dist/css/bootstrap.css";
import "timeline-vuejs/dist/timeline-vuejs.css";
import VueSweetalert2 from "vue-sweetalert2";
import "sweetalert2/dist/sweetalert2.min.css";
import axios from 'axios';

import { library } from '@fortawesome/fontawesome-svg-core'
import { fas } from '@fortawesome/free-solid-svg-icons'
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome'

library.add(fas);

// let localAuthToken = localStorage.auth_token;
// let cookieExists = localAuthToken !== "undefined" && localAuthToken !== null;
// if (cookieExists) {
//   const auth_token = localStorage.getItem("auth_token");
//   const authTokenExists = auth_token !== "undefined" && auth_token !== null;
//   if (authTokenExists) {
//     store.dispatch("loginUserWithToken", { auth_token });
//   }
// }

const app = createApp(App);
app.use(router);
app.use(VueSweetalert2);
app.use(store);

app.component("font-awesome-icon", FontAwesomeIcon);

//Vue.use(router);

//app.use(axios);
app.mount("#app");
