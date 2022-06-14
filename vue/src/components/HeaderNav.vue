<template>
  <nav class="navbar" role="navigation" aria-label="main navigation">
    <div class="navbar-brand">
      <img
        src="data:image/png;base64,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"
        class="logo"
      />

      <a
        role="button"
        class="navbar-burger"
        aria-label="menu"
        aria-expanded="false"
        data-target="navbarBasicExample"
      >
        <span aria-hidden="true"></span>
        <span aria-hidden="true"></span>
        <span aria-hidden="true"></span>
      </a>
    </div>

    <div id="navbarBasicExample" class="navbar-menu">
      <div class="navbar-start">
        <router-link :to="{ name: 'dashboard_path' }">
          All projects
        </router-link>
      </div>

      <div class="navbar-end">
        <div class="navbar-item">
          <div class="buttons">
            <a class="button is-primary">
              <router-link :to="{ name: 'CreateUser' }">
                Create User
              </router-link>
            </a>
            <a class="button is-light"> Log Out </a>
          </div>
        </div>
      </div>
    </div>
  </nav>
</template>

<style scoped>
.logo {
  display: block;
  width: 50%;
  height: 50%;
  border-radius: 15%;
}

div a {
  text-decoration: none;
  color: black;
}
</style>
