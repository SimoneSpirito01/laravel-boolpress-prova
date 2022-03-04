import Vue from "vue";
import VueRouter from "vue-router";

Vue.use(VueRouter);

import Home from "./pages/Home";
import About from "./pages/About";
import Post from "./pages/Post";
import CategoriesList from "./pages/CategoriesList";
import Category from "./pages/Category";
import TagsList from "./pages/TagsList";
import Tag from "./pages/Tag";
import Author from "./pages/Author";
import PageNotFound from "./pages/PageNotFound";

const router = new VueRouter({
    mode: "history",
    routes: [
        {
            path: "/",
            name: "home",
            component: Home,
        },
        {
            path: "/about-us",
            name: "about",
            component: About,
        },
        {
            path: "/posts/:slug",
            name: "post",
            component: Post,
        },
        {
            path: "/categories",
            name: "categories",
            component: CategoriesList,
        },
        {
            path: "/categories/:slug",
            name: "category",
            component: Category,
        },
        {
            path: "/tags",
            name: "tags",
            component: TagsList,
        },
        {
            path: "/tags/:slug",
            name: "tag",
            component: Tag,
        },
        {
            path: "/authors/:slug",
            name: "author",
            component: Author,
        },
        // error 404
        {
            path: '/404',
            alias: '*',
            name: "not-found",
            component: PageNotFound,
        },
    ],
});

export default router;
