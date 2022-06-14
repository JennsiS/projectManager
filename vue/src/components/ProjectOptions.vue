<template>
  <div class="tabs">
    <ul>
      <li><router-link :to="{ name: 'RoadMap' }"> Roadmap </router-link></li>
      <li>
        <router-link :to="{ name: 'ImportantDates' }"> Calendar </router-link>
      </li>
      <li><router-link :to="{ name: 'Phases' }"> Phases </router-link></li>
    </ul>
  </div>
</template>

<style scoped>
li a {
  text-decoration: none;
}
</style>
