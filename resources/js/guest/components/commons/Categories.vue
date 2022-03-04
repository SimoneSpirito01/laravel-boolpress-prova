<template>
    <div class="categories">
        <h1>Category List</h1>
        <ul>
            <li v-for="category in categories" :key="category.id">
                <router-link
                    :to="{ name: 'category', params: { slug: category.slug } }"
                >
                    {{ category.name }}
                </router-link>
            </li>
        </ul>
    </div>
</template>

<script>
export default {
    name: "Categories",
    data() {
        return {
            categories: [],
        };
    },
    created() {
        axios
            .get("/api/categories")
            .then((response) => {
                this.categories = [...response.data];
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
