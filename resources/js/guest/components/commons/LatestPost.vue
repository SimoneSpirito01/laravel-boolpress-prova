<template>
    <router-link :to="{ name: 'post', params: { slug: post.slug } }">
        <article class="latest-post">
            <div class="left">
                <h2 class="title">
                    {{ post.title }}
                </h2>
                <AuthorName :author="post.author" />
                <div class="date">
                    <div class="hour">
                        {{ post.formattedDate.hour }}
                    </div>
                    <div class="slash">/</div>
                    <div class="year">
                        {{ post.formattedDate.date }}
                    </div>
                </div>
            </div>
            <div class="center">
                <div class="content" v-html="shortContent"></div>
            </div>
            <div class="right">
                <div class="image">
                    <img :src="`/storage/${post.image}`" :alt="post.title" />
                </div>
            </div>
        </article>
    </router-link>
</template>

<script>
import AuthorName from "../commons/AuthorName.vue";
import functionsShared from "../../share/functionsShared.js";

export default {
    name: "LatestPost",
    components: {
        AuthorName,
    },
    props: {
        post: Object,
    },
    computed: {
        shortContent() {
            if (this.post.content.length < 200) {
                return this.post.content;
            } else {
                return this.post.content.slice(0, 200) + "...";
            }
        },
    },
    created() {
        this.post.formattedDate = functionsShared.formatDate(
            this.post.created_at
        );
    },
};
</script>

<style lang="scss" scoped>
a {
    display: inline-block;
    text-decoration: none;
    color: initial;
    padding: 0 10px;
    background-color: white;
    transition: 0.3s;
    &:hover {
        background-color: #f1f1f1;
        -webkit-box-shadow: 1px 1px #3e3e3e, 2px 2px #3e3e3e, 3px 3px #3e3e3e,
            4px 4px #3e3e3e, 5px 5px #3e3e3e, 6px 6px #3e3e3e, 7px 7px #3e3e3e,
            8px 8px #3e3e3e;
        box-shadow: 1px 1px #3e3e3e, 2px 2px #3e3e3e, 3px 3px #3e3e3e,
            4px 4px #3e3e3e, 5px 5px #3e3e3e, 6px 6px #3e3e3e, 7px 7px #3e3e3e,
            8px 8px #3e3e3e;
        -webkit-transform: translateX(-8px) translateY(-8px);
        transform: translateX(-8px) translateY(-8px);
    }
    &:hover + a .latest-post,
    &:hover .latest-post {
        border-top: 2px solid transparent;
    }
    .latest-post {
        display: flex;
        padding: 30px 0;
        border-top: 2px solid #f1f1f1;
        transition: 0.3s;
        > * {
            width: calc((100% - 60px) / 3);
        }
        .left {
            font-size: 16px;
            .title {
                font-size: 35px;
                margin-bottom: 10px;
            }
            .date {
                color: var(--nav-color);
                display: flex;
                .slash {
                    color: var(--green);
                    margin: 0 5px;
                }
            }
            @media (max-width: 1400px) {
                .title {
                    font-size: 30px;
                }
            }
            @media (max-width: 1200px) {
                .title {
                    font-size: 29px;
                }
            }
            @media (max-width: 1100px) {
                .title {
                    font-size: 24px;
                }
            }
            @media (max-width: 992px) {
                font-size: 14px;
                .title {
                    font-size: 22px;
                }
            }
        }
        .center {
            margin: 0 30px;
            .content {
                max-height: 300px;
                color: var(--nav-color) !important;
                &::v-deep p {
                    font-size: 20px;
                    @media (max-width: 1400px) {
                        font-size: 19px;
                    }
                    @media (max-width: 1200px) {
                        font-size: 17px;
                    }
                    @media (max-width: 1100px) {
                        font-size: 16px;
                    }
                    @media (max-width: 992px) {
                        font-size: 15px;
                    }
                }
                &::v-deep a {
                    color: var(--nav-color);
                    text-decoration: none;
                    pointer-events: none;
                }
            }
        }
        .right {
            .image {
                img {
                    width: 100%;
                }
            }
        }
    }
}
.latest-posts:hover .latest-post:not(:hover) {
    opacity: 0.8;
}
</style>
