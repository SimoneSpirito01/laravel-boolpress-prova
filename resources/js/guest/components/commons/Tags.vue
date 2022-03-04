<template>
    <div class="tags">
        <h1>Tag List</h1>
        <ul>
            <li v-for="tag in tags" :key="tag.id">
                <router-link
                    :to="{ name: 'tag', params: { slug: tag.slug } }"
                >
                    {{ tag.name }}
                </router-link>
            </li>
        </ul>
    </div>
</template>

<script>
export default {
    name: "Tags",
    data() {
        return {
            tags: [],
        };
    },
    created() {
        axios
            .get("/api/tags")
            .then((response) => {
                this.tags = [...response.data];
            })
            .catch(function (error) {
                console.log(error);
            });
    },
};
</script>

<style lang="scss" scoped>
ul {
    margin-top: 40px;
    padding-left: 20px;

    li {
        a {
                color: black;
                text-decoration: none;
                &:hover {
                    color: lightseagreen;
                }
            }
    }
}
</style>
