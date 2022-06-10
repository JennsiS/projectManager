<template>
  <div>
    <img src="../assets/lomax.png" class="logo-lomax" />
    <div class="form-container">
      <form class="box">
        <div class="field">
          <label class="label">Email</label>
          <div class="control">
            <input
              class="input"
              type="email"
              placeholder="e.g. alex@example.com"
            />
          </div>
        </div>

        <div class="field">
          <label class="label">Password</label>
          <div class="control">
            <input class="input" type="password" placeholder="********" />
          </div>
        </div>
        <button class="button is-primary">Sign in</button>
      </form>
    </div>
  </div>
</template>

<style scoped>
.box {
  width: 40%;
  height: 50%;
}
.form-container {
  position: relative;
  left: 30%;
  top: 50%;
}
.logo-lomax {
  width: 15%;
  height: 15%;
  margin-left: 40%;
}
</style>
>
