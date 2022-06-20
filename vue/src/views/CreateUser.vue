<script>
import HeaderNav from "@/components/HeaderNav.vue";
import axios from "axios";
import { baseURL } from "../plugins/axios";

export default {
  components: {
    HeaderNav,
  },
  data() {
    return {
      roles: [],
      newEmail: "",
      password: "",
      newUserId: "",
      allRolesInfo: [],
      role: "",
      roleId: "",
    };
  },
  methods: {
    createNewUser() {
      let newUser = {
        email: this.newEmail,
        password: this.password,
      };
      console.log(newUser);
      axios
        .post(`${baseURL}/users.json`, { user: newUser })
        .then((res) => {
          console.log(res);
          this.success = true;
          this.newUserId = res.data.id;

          this.allRolesInfo.forEach((role) => {
            if (role.name === this.role) {
              this.roleId = role.id;
            }
          });

          let newRelationRole = {
            user_id: this.newUserId,
            role_id: this.roleId,
          };

          axios
            .post(`${baseURL}/users_roles.json`, {
              users_roles: newRelationRole,
            })
            .then((res) => {
              this.success = true;
              console.log("Relation added succesfully");
            })
            .catch((error) => {
              this.error = error.data;
              console.log("Relation to add members, check fields");
            });

          this.$swal("User created successfully");
        })
        .catch((error) => {
          this.error = error.data;
          this.$swal("Failed to create user, check user fields");
        });
    },
  },
  mounted() {
    axios.get(`${baseURL}/roles.json`).then((response) => {
      response.data.forEach((item) => {
        this.roles.push(item.name);
      });
      this.allRolesInfo = response.data;
      console.log(this.allRolesInfo);
    });
  },
};
</script>

<template>
  <div>
    <HeaderNav />
    <h3>Create User</h3>
    <div class="form-container">
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
            <input
              class="input"
              type="text"
              placeholder="Lomax email"
              v-model="newEmail"
            />
          </div>
        </div>

        <div class="field">
          <label class="label">Password</label>
          <div class="control">
            <input
              class="input"
              type="password"
              placeholder="Password"
              v-model="password"
            />
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
            <button class="button is-link" @click.prevent="createNewUser">
              Create
            </button>
          </div>
          <div class="control">
            <button class="button is-link is-light">
              <router-link :to="{ name: 'dashboard_path' }">
                Cancel
              </router-link>
            </button>
          </div>
        </div>
      </form>
    </div>
  </div>
</template>

<style src="@vueform/multiselect/themes/default.css"></style>

<style scoped>
.form-container {
  width: 50%;
  align-items: center;
  align-content: center;
  position: absolute;
  left: 25%;
  padding: 5%;
}
</style>
