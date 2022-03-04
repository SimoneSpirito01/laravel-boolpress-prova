<template>
    <div class="latest">
        <h4>The Latest</h4>
        <div class="latest-posts">
            <LatestPost v-for="post in posts" :key="post.id" :post="post" />
        </div>
    </div>
</template>

<script>
import LatestPost from "../commons/LatestPost.vue";
import dataShared from "../../share/dataShared.js"

export default {
    name: "LatestPosts",
    components: {
        LatestPost,
    },
    props: {
        posts: Array
    },
    data() {
        return {
            dataShared,
        };
    },
};
</script>

<style lang="scss" scoped>
h4 {
    font-size: 22.5px;
    padding-bottom: 15px;
    padding-left: 10px;
}
</style>
