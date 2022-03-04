<template>
    <div class="main-posts">
        <router-link
            class="left"
            :to="{ name: 'post', params: { slug: posts[0].slug } }"
        >
            <h1 class="title">{{ posts[0].title }}</h1>
            <AuthorName :author="posts[0].author" />
            <div class="image">
                <img
                    :src="`/storage/${posts[0].image}`"
                    :alt="posts[0].title"
                />
            </div>
        </router-link>
        <div class="right">
            <MainPost v-for="i in 4" :key="i" :post="posts[i]" />
        </div>
    </div>
</template>

<script>
import MainPost from "../commons/MainPost.vue";
import AuthorName from "../commons/AuthorName.vue";
import dataShared from "../../share/dataShared";

export default {
    name: "MainPosts",
    components: {
        MainPost,
        AuthorName,
    },
    props: {
        posts: Array,
    },
    data() {
        return {
            dataShared,
        };
    },
};
</script>

<style lang="scss" scoped>
.main-posts {
    display: flex;
    margin-bottom: 100px;
    align-items: flex-start;
    .left {
        width: 65%;
        margin-right: 45px;
        text-decoration: none;
        color: initial;
        background-color: white;
        transition: 0.3s;
        padding: 12px 10px;
        @media (max-width: 1200px) {
                margin-right: 30px;
            }
        
        &:hover {
            background-color: #f1f1f1;
            -webkit-box-shadow: 1px 1px #3e3e3e, 2px 2px #3e3e3e,
                3px 3px #3e3e3e, 4px 4px #3e3e3e, 5px 5px #3e3e3e,
                6px 6px #3e3e3e, 7px 7px #3e3e3e, 8px 8px #3e3e3e;
            box-shadow: 1px 1px #3e3e3e, 2px 2px #3e3e3e, 3px 3px #3e3e3e,
                4px 4px #3e3e3e, 5px 5px #3e3e3e, 6px 6px #3e3e3e,
                7px 7px #3e3e3e, 8px 8px #3e3e3e;
            -webkit-transform: translateX(-8px) translateY(-8px);
            transform: translateX(-8px) translateY(-8px);
        }
        .title {
            font-size: 45px;
            font-weight: 700;
            margin-bottom: 15px;

            @media (max-width: 1400px) {
                font-size: 41px;
            }
            @media (max-width: 1200px) {
                font-size: 37px;
            }
            @media (max-width: 992px) {
                font-size: 32px;
            }
            @media (max-width: 900px) {
                font-size: 28px;
            }
        }
        .image {
            width: 100%;
            img {
                width: 100%;
                display: block;
            }
        }
    }
    .right {
        width: 35%;
    }
}
</style>
