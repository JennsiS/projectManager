<template>
  <div>
    <HeaderNav />
    <form class="box">

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
              @change="getUsersIds"
            />
          </div>
        </div>
      </div>

      <div class="field is-grouped">
        <div class="control">
          <button class="button is-link" @click.prevent="createNewProjectUser">
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
import Multiselect from "@vueform/multiselect";
import HeaderNav from "@/components/HeaderNav.vue";
import axios from "axios";

export default {
  components: {
    Multiselect,
    HeaderNav,
  },
  data() {
    return {
      users: [],
      allUsersInfo: [],
      success: false,
      error: false,
      userIdRelation: "",
      projectId: Number(this.$route.params.id),
      valuePM: null,
      valueTeam: null,
    };
  },
  mounted() {
    //GET users for adding members to the project
    axios.get("http://localhost:3000/users.json").then((response) => {
      response.data.forEach((item) => {
        this.users.push(item.email);
      });
      this.allUsersInfo = response.data;
      //console.log(this.allUsersInfo);
    });
  },
  methods: {
    getUsersIds(){
        console.log(this.valueTeam)
    },
    createNewProjectUser() {
      //Get user_id from all user info
      this.allUsersInfo.forEach((user) => {
        if (user.email === this.valuePM) {
          this.userIdRelation = user.id;
        }
      });

      let newRelation = {
        user_id: this.userIdRelation,
        project_id: this.projectId,
        rol_project_user: "Project Manager",
      }
      console.log(newRelation)

      //Make a POST to users_projects table for Project manager
      axios
        .post("http://127.0.0.1:3000/users_projects.json", { users_project: newRelation })
        .then((res) => {
          this.success = true;
          this.$swal("Members added succesfully");
        })
        .catch((error) => {
          this.error = error.data;
          this.$swal("Failed to add members, check fields");
        });


    // this.allUsersInfo.forEach((user) => {
    //     this.valueTeam.forEach((member)=>{
    //         if (user.email ===  member){
    //             this.usersIds = user.id;
    //         }
    //     })
    //   });

    },
  },
};
</script>

<style src="@vueform/multiselect/themes/default.css"></style>
