<template>
    <div v-if="author.username">
        <PageAuthorTitle :name="author.username"/>
        <LatestPost v-for="post in author.posts" :key="post.id" :post="post" :author="author"/>
    </div>
</template>

<script>
import PageAuthorTitle from '../components/commons/PageTitle.vue'
import LatestPost from '../components/commons/LatestPost.vue'

export default {
    name: "Author",
    components: {
        PageAuthorTitle,
        LatestPost
    },
    data() {
        return {
            author: {},
        };
    },
    created() {
        axios
            .get("/api/authors/" + this.$route.params.slug)
            .then((response) => {
                this.author = response.data;
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
