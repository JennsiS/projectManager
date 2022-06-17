<template>
  <div>
    <HeaderNav />
    <form class="box">
      <!-- <div class="field">
        <label class="label">Name</label>
        <div class="control">
          <input class="input" type="text" placeholder="Name" />
        </div>
      </div> -->

      <div class="field">
        <label class="label">Email</label>
        <div class="control">
          <input class="input" type="text" placeholder="Lomax email" />
        </div>
      </div>

      <div class="field">
        <label class="label">Password</label>
        <div class="control">
          <input class="input" type="text" placeholder="Password" />
        </div>
      </div>

      <div class="field">
        <label class="label">Role</label>
        <div class="control">
          <div class="select">
            <select id="roleSelection" @change="getState">
              <option
                v-for="role in roles"
                v-bind:value="role"
                v-bind:key="role"
              >
                {{ role }}
              </option>
            </select>
          </div>
        </div>
      </div>

      <div class="field is-grouped">
        <div class="control">
          <button class="button is-link">Create</button>
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
import HeaderNav from "@/components/HeaderNav.vue";
import axios from "axios";
const baseURL = "http://localhost:3000";

export default {
  components: {
    HeaderNav,
  },
  data() {
    return {
      roles: [],
    };
  },
  methods: {
    //TODO: Make a POST to database to users table
    //TODO: Make a POST to users_roles table
  },
  mounted() {
    axios.get(`${baseURL}/roles.json`).then((response) => {
      response.data.forEach((item) => {
        this.roles.push(item.name);
      });
      console.log(this.roles);
    });
  },
};
</script>

<style src="@vueform/multiselect/themes/default.css"></style>
