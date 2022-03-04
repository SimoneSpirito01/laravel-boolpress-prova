<template>
    <div v-if="tag.name">
        <SectionTitle :name="title" />
        <LatestPost
            v-for="post in tag.posts"
            :key="post.id"
            :post="post"
        />
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
            tag: {},
        };
    },
    created() {
        axios
            .get("/api/tags/" + this.$route.params.slug)
            .then((response) => {
                this.tag = response.data;
            })
            .catch((error) => {
                this.$router.push({ name: "not-found" });
            });
    },
    computed: {
        title() {
            if(this.tag.name) {
                return this.tag.name[0].toUpperCase() + this.tag.name.slice(1);
            } else {
                return ''
            }
        }
    }
};
</script>

<style lang="scss" scoped>

div::v-deep a:first-of-type .latest-post {
    border: 1px solid transparent;
}

</style>
