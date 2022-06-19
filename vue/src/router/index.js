import { createRouter, createWebHistory } from "vue-router";

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: "/",
      name: "dashboard_path",
      component: () => import("../views/DashboardProjects.vue"),
    },
    {
      path: "/login",
      name: "login",
      // route level code-splitting
      // this generates a separate chunk (About.[hash].js) for this route
      // which is lazy-loaded when the route is visited.
      component: () => import("../views/LoginView.vue"),
    },
    {
      path: "/CreateProject",
      name: "CreateProject",
      // route level code-splitting
      // this generates a separate chunk (About.[hash].js) for this route
      // which is lazy-loaded when the route is visited.
      component: () => import("../views/CreateProject.vue"),
    },
    {
      path: "/EditProject/:id?",
      name: "EditProject",
      component: () => import("../views/EditProject.vue"),
    },
    {
      path: "/CreatePhase/:id?",
      name: "CreatePhase",
      // route level code-splitting
      // this generates a separate chunk (About.[hash].js) for this route
      // which is lazy-loaded when the route is visited.
      component: () => import("../views/CreatePhase.vue"),
    },
    {
      path: "/ImportantDates/:id?",
      name: "ImportantDates",
      // route level code-splitting
      // this generates a separate chunk (About.[hash].js) for this route
      // which is lazy-loaded when the route is visited.
      component: () => import("../views/ImportantDates.vue"),
    },
    {
      // path: "/Phases/:id",
      path: "/Phases/:id?",
      name: "Phases",
      // route level code-splitting
      // this generates a separate chunk (About.[hash].js) for this route
      // which is lazy-loaded when the route is visited.
      component: () => import("../views/AllPhases.vue"),
    },
    {
      //path: "/RoadMap",
      path: "/RoadMap/:id?",
      name: "RoadMap",
      // route level code-splitting
      // this generates a separate chunk (About.[hash].js) for this route
      // which is lazy-loaded when the route is visited.
      component: () => import("../views/RoadMap.vue"),
    },
    {
      path: "/CreateUser",
      name: "CreateUser",
      // route level code-splitting
      // this generates a separate chunk (About.[hash].js) for this route
      // which is lazy-loaded when the route is visited.
      component: () => import("../views/CreateUser.vue"),
    },
  ],
});

export default router;
