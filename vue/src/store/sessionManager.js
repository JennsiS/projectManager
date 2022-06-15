import axios from "axios";

const BASE_URL = "http://localhost:3000/";

const state = {
  auth_token: null,
  user: {
    id: null,
    email: null,
  },
};

const getters = {
  getAuthToken(state) {
    return state.auth_token;
  },
  getUserEmail(state) {
    return state.user?.email;
  },
  getUserId(state) {
    return state.user?.id;
  },
  isLoggedIn(state) {
    const loggedOut =
      state.auth_token == null || state.auth_token == JSON.stringify(null);
    return !loggedOut;
  },
};

const actions = {
  loginUser({ commit }, payload) {
    new Promise((resolve, reject) => {
      axios
        .post(`${BASE_URL}users/sign_in`, payload)
        .then((response) => {
          commit("setUserInfo", response);
          resolve(response);
        })
        .catch((error) => {
          reject(error);
        });
    });
  },
};
