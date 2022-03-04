<template>
    <div v-if="homeLoaded" class="home">
        <MainPosts ref="mainPosts" :posts="postsMain"/>
        <LatestPosts ref="latestPosts" :posts="postsLatest"/>
    </div>
</template>

<script>
import MainPosts from "../components/sections/MainPosts.vue";
import LatestPosts from "../components/sections/LatestPosts.vue";
import dataShared from "../share/dataShared.js";

export default {
    name: "Home",
    components: {
        MainPosts,
        LatestPosts,
    },
    data() {
        return {
            dataShared,
            homeLoaded: false,
            postsMain: [],
            postsLatest: [],
        };
    },
    methods: {
        checkIfLoaded() {
            if (
                this.$refs.mainPosts.innerHTML != "" &&
                this.$refs.latestPosts.innerHTML != ""
            ) {
                console.log("loaded");
                return true;
            } else {
                console.log("not");
                return false;
            }
        },
    },
    created() {
        axios
            .get("/api/posts-main")
            .then((response) => {
                this.postsMain = [...response.data];
                axios
                    .get("/api/posts-latest")
                    .then((response) => {
                        this.postsLatest = [...response.data];
                        this.homeLoaded = true;

                    })
                    .catch(function (error) {
                        console.log(error);
                    });
            })
            .catch(function (error) {
                console.log(error);
            });
    },
};
</script>

<style lang="scss" scoped>
.home {
    padding: 28px 25px;
}
</style>
