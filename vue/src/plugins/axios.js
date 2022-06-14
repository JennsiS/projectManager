import axios from "axios";

const cancelToken = axios.CancelToken;

let token = document.querySelector('meta[name="csrf-token"]').content;

export default {
  install(vue, options) {
    vue.prototype.$axios = axios.create({
      headers: {
        "X-CSRF-Token": token,
        "Cache-Control": "no-cache"
      }
    });

    vue.prototype.$axiosCancel = cancelToken;

    vue.prototype.$axios.interceptors.response.use(
      response => {
        return response;
      },
      error => {
        console.log(error);
        // location.href = "/not-found";
      }
    );
  }
};
