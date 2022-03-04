<template>
    <div v-if="category.name">
        <SectionTitle :name="category.name" />
        <div class="latest-posts">
            <LatestPost
                v-for="post in category.posts"
                :key="post.id"
                :post="post"
            />
        </div>
    </div>
</template>

<script>
import SectionTitle from "../components/commons/SectionTitle.vue";
import LatestPost from "../components/commons/LatestPost.vue";

export default {
    name: "Tag",
    components: {
        SectionTitle,
        LatestPost,
    },
    data() {
        return {
            category: {},
        };
    },
    created() {
        axios
            .get("/api/categories/" + this.$route.params.slug)
            .then((response) => {
                this.category = response.data;
            })
            .catch((error) => {
                this.$router.push({ name: "not-found" });
            });
    },
};
</script>

<style lang="scss" scoped>
div::v-deep a:first-of-type .latest-post {
    border: 1px solid transparent;
}
</style>
