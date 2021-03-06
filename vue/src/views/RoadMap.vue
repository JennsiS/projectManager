<script>
import ProjectOptions from "../components/ProjectOptions.vue";
import HeaderNav from "@/components/HeaderNav.vue";
import axios from "axios";
import { baseURL } from "../plugins/axios";

export default {
  mounted() {
    //Using get phases by project id route
    axios
      .get(`${baseURL}/all_project_phases/${this.projectId}.json`)
      .then((response) => {
        console.log(response.data);
        response.data.forEach((item) => {
          this.phases.push(item);
        });
      });

    //GET project name
    axios.get(`${baseURL}/projects/${this.projectId}.json`).then((response) => {
      this.projectName = response.data.title;
    });
  },

  methods: {},
  components: {
    ProjectOptions,
    HeaderNav,
  },
  data() {
    return {
      projectId: this.$route.params.id,
      phases: [],
      phases_ids: [],
      projectName: "",
    };
  },
};
</script>

<template>
  <div>
    <HeaderNav />
    <h2>{{ this.projectName }}</h2>
    <ProjectOptions :projectId="this.projectId" />
    <h4>Roadmap</h4>
    <div class="timeline">
      <header class="timeline-header">
        <span class="tag is-medium is-primary">Start</span>
      </header>

      <div class="timeline-item" v-for="element in phases" :key="element">
        <div class="timeline-marker is-primary"></div>
        <div class="timeline-content">
          <p class="heading">{{ element.name }}</p>
          <p>{{ element.start_date }}</p>
        </div>
      </div>
      <!-- 
      <div class="timeline-item">
        <div class="timeline-marker is-warning is-image is-32x32">
          <img src="https://bulma.io/images/placeholders/32x32.png" />
        </div>
        <div class="timeline-content">
          <p class="heading">February 2016</p>
          <p>Timeline content - Can include any HTML element</p>
        </div>
      </div>
      <header class="timeline-header">
        <span class="tag is-primary">2017</span>
      </header>
      <div class="timeline-item">
        <div class="timeline-marker is-danger is-icon">
          <i class="fa fa-plus"></i>
        </div>
        <div class="timeline-content">
          <p class="heading">March 2017</p>
          <p>Timeline content - Can include any HTML element</p>
        </div>
      </div> -->
      <header class="timeline-header">
        <span class="tag is-medium is-primary">End</span>
      </header>
    </div>
  </div>
</template>

<style lang="sass">
// Colors
$black:        hsl(0, 0%, 4%) !default
$black-bis:    hsl(0, 0%, 7%) !default
$black-ter:    hsl(0, 0%, 14%) !default

$grey-darker:  hsl(0, 0%, 21%) !default
$grey-dark:    hsl(0, 0%, 29%) !default
$grey:         hsl(0, 0%, 48%) !default
$grey-light:   hsl(0, 0%, 71%) !default
$grey-lighter: hsl(0, 0%, 86%) !default

$white-ter:    hsl(0, 0%, 96%) !default
$white-bis:    hsl(0, 0%, 98%) !default
$white:        hsl(0, 0%, 100%) !default

$orange:       hsl(14,  100%, 53%) !default
$yellow:       hsl(48,  100%, 67%) !default
$green:        hsl(141, 71%,  48%) !default
$turquoise:    hsl(171, 100%, 41%) !default
$blue:         hsl(217, 71%,  53%) !default
$purple:       hsl(271, 100%, 71%) !default
$red:          hsl(348, 100%, 61%) !default

// Typography
$family-sans-serif: BlinkMacSystemFont, -apple-system, "Segoe UI", "Roboto", "Oxygen", "Ubuntu", "Cantarell", "Fira Sans", "Droid Sans", "Helvetica Neue", "Helvetica", "Arial", sans-serif !default
$family-monospace: monospace !default
$render-mode: optimizeLegibility !default

$size-1: 3rem !default
$size-2: 2.5rem !default
$size-3: 2rem !default
$size-4: 1.5rem !default
$size-5: 1.25rem !default
$size-6: 1rem !default
$size-7: 0.75rem !default

$weight-light: 300 !default
$weight-normal: 400 !default
$weight-semibold: 500 !default
$weight-bold: 700 !default

// Body
$body-background: #fff !default
$body-size: 16px !default

// Responsiveness
// 960, 1152, and 1344 have been chosen because they are divisible by both 12 and 16
$tablet: 769px !default
// 960px container + 40px
$desktop: 1000px !default
// 1152px container + 40
$widescreen: 1192px !default
// 1344px container + 40
$fullhd: 1384px !default

// Miscellaneous
$easing: ease-out !default
$radius-small: 2px !default
$radius: 3px !default
$radius-large: 5px !default
$speed: 86ms !default

////////////////////////////////////////////////
////////////////////////////////////////////////
// 2. Primary colors

$primary: $turquoise !default

$info: $blue !default
$success: $green !default
$warning: $yellow !default
$danger: $red !default

$light: $white-ter !default
$dark: $grey-darker !default

////////////////////////////////////////////////
////////////////////////////////////////////////
// 3. Applied variables

// Invert colors
$orange-invert: findColorInvert($orange) !default
$yellow-invert: findColorInvert($yellow) !default
$green-invert: findColorInvert($green) !default
$turquoise-invert: findColorInvert($turquoise) !default
$blue-invert: findColorInvert($blue) !default
$purple-invert: findColorInvert($purple) !default
$red-invert: findColorInvert($red) !default

$primary-invert: $turquoise-invert !default
$info-invert: $blue-invert !default
$success-invert: $green-invert !default
$warning-invert: $yellow-invert !default
$danger-invert: $red-invert !default
$light-invert: $dark !default
$dark-invert: $light !default

// General colors
$background: $white-ter !default

$border: $grey-lighter !default
$border-hover: $grey-light !default

// Text colors
$text: $grey-dark !default
$text-invert: findColorInvert($text) !default
$text-light: $grey !default
$text-strong: $grey-darker !default

// Code colors
$code: $red !default
$code-background: $background !default

$pre: $text !default
$pre-background: $background !default

// Link colors
$link: $primary !default
$link-invert: $primary-invert !default
$link-visited: $purple !default

$link-hover: $grey-darker !default
$link-hover-border: $grey-light !default

$link-focus: $grey-darker !default
$link-focus-border: $primary !default

$link-active: $grey-darker !default
$link-active-border: $grey-dark !default

// Typography
$family-primary: $family-sans-serif !default
$family-code: $family-monospace !default

$size-small: $size-7 !default
$size-normal: $size-6 !default
$size-medium: $size-5 !default
$size-large: $size-4 !default

////////////////////////////////////////////////
////////////////////////////////////////////////
// 4. Lists and maps

$colors: ("white": ($white, $black), "black": ($black, $white), "light": ($light, $light-invert), "dark": ($dark, $dark-invert), "primary": ($primary, $primary-invert), "info": ($info, $info-invert), "success": ($success, $success-invert), "warning": ($warning, $warning-invert), "danger": ($danger, $danger-invert)) !default

$sizes: $size-1 $size-2 $size-3 $size-4 $size-5 $size-6 $size-7 !default


$timeline-tag-background-color: $white !default
$timeline-tag-border: .1em solid $grey-light !default
$timeline-line: .1rem solid $grey-light !default
$timeline-content-padding: 1em 0 0 2em !default
$timeline-icon-size: $size-5 !default

.timeline
  .timeline-header
    width: 6em
    text-align: center
  .timeline-item
    display: flex
    display: -ms-flexbox
    display: -webkit-flex
    position: relative
    border-left: $timeline-line
    margin-left: 3em
    padding-bottom: 2em
    &::before
      background: $timeline-tag-background-color
      border: $timeline-tag-border
      border-radius: 100%
      content: ""
      display: block
      height: .8rem
      left: -.45em
      position: absolute
      top: 1.2rem
      width: .8rem

    .timeline-tag
      position: absolute
      width: .8em
      left: -.4em
      height: .8em
      top: 1.2em
      .image
        width: 32px
        height: 32px
        left: -12px
        background: $timeline-tag-background-color
        border: $timeline-tag-border
        border-radius: 100%
        display: block
        overflow: hidden
    .timeline-content
      padding: 1em 0 0 .5em
      padding: $timeline-content-padding
      .heading
        font-weight: $weight-semibold

    @each $name, $pair in $colors
      $color: nth($pair, 1)
      $color-invert: nth($pair, 2)
      &.is-#{$name}
        border-left-color: $color
        &::before
          border-color: $color !important
        .timeline-tag
          .image
            border-color: $color !important
h2
  color: gray

h4
  text-align: center
</style>
