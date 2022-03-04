<template>
    <div class="posts">
        <h1>Post list</h1>
        <ul>
            <li v-for="(post, i) in visiblePosts" :key="i">
                <div class="title">
                    <strong>Title: </strong>
                    <router-link
                        :to="{ name: 'post', params: { slug: post.slug } }"
                    >
                        {{ post.title }}
                    </router-link>
                </div>
                <div v-if="post.category != null" class="category">
                    <strong>Category: </strong>
                    <router-link
                        :to="{ name: 'category', params: { slug: post.category.slug } }"
                    >
                        {{ post.category.name }}
                    </router-link>
                </div>
                <div v-if="post.tags.length > 0" class="tags">
                    <strong>Tags: </strong>
                    <ul>
                        <li v-for="(tag, i) in post.tags" :key="i" class="tag">
                            <router-link
                                :to="{
                                    name: 'tag',
                                    params: { slug: tag.slug },
                                }"
                            >
                                {{ tag.name }}
                            </router-link>
                        </li>
                    </ul>
                </div>
            </li>
        </ul>
    </div>
</template>

<script>
export default {
    name: "Posts",
    data() {
        return {
            visiblePosts: [],
        };
    },
    created() {
        axios
            .get("/api/posts")
            .then((response) => {
                this.visiblePosts = [...response.data];
            })
            .catch(function (error) {
                console.log(error);
            });
    },
};
</script>

<style lang="scss" scoped>
h1 {
    margin-bottom: 20px;
}

ul {
    padding-left: 20px;

    li {
        margin: 15px 0;

        .title, .category, .tags {
            a {
                color: black;
                text-decoration: none;
                &:hover {
                    color: lightseagreen;
                }
            }
        }

        > div {
            margin: 4px 0;

            .tag {
                margin: 6px 0;
            }
        }
    }
}
</style>
