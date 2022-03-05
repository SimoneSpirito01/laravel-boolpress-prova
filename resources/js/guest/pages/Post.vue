<template>
    <div v-if="post.title" class="single-post-page">
        <div class="post">
            <div class="top">
                <div class="title">
                    <h1>{{ post.title }}</h1>
                </div>
                <div class="info">
                    <div class="left">
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
                    <div class="right">
                        <svg
                            class="icon-comment"
                            viewBox="0 0 20 20"
                            version="1.1"
                            aria-labelledby="title"
                        >
                            <path
                                d="M15.3,14.1h2.4v2.4h-2.4V14.1z M12.5,11.8H0v2.4h15.3v-2.4H12.5z M7.1,2.4h10.6V0H2.4v2.4H7.1z M17.6,18.8H20V0h-2.4V18.8zM2.4,5.9V0H0v11.8h2.4V5.9z"
                            ></path>
                        </svg>
                        <a
                            @click.prevent="scrollTo('commentSection', 60)"
                            href="#"
                            class="comment-link"
                            >Comment</a
                        >
                    </div>
                </div>
                <div class="tags">
                    <div class="tags-container">
                        <router-link
                            :to="{
                                name: 'tag',
                                params: { slug: tag.slug },
                            }"
                            v-for="tag in post.tags"
                            :key="tag.id"
                            class="tag"
                            >{{ tag.name }}</router-link
                        >
                    </div>
                </div>
            </div>
            <div class="bottom">
                <div class="image">
                    <img :src="post.image" :alt="post.name" />
                </div>
                <div v-html="post.content" class="post-content"></div>
                <div id="comments" ref="commentSection">
                    <div class="left">
                        <h4>Comments</h4>
                        <p
                            v-if="post.comments.length == 0"
                            class="comments-empty"
                        >
                            The comments section is empty, add your comment now!
                        </p>
                        <div
                            v-for="comment in post.comments"
                            :key="comment.id"
                            class="comment"
                        >
                            <div class="info">
                                <div class="name">
                                    {{ comment.name }}
                                </div>
                                <div class="date">
                                    <div class="hour">
                                        {{ comment.formattedDate.hour }}
                                    </div>
                                    <div class="slash">/</div>
                                    <div class="year">
                                        {{ comment.formattedDate.date }}
                                    </div>
                                </div>
                            </div>
                            <div class="content">
                                {{ comment.content }}
                            </div>
                        </div>
                    </div>
                    <div class="right">
                        <h4>Add your comment</h4>
                        <form @submit.prevent="newComment()">
                            <div class="comment-container">
                                <input
                                    v-model="formData.name"
                                    type="text"
                                    id="inputUsername"
                                    placeholder="Insert the username..."
                                />
                                <i class="my_caret fa-solid fa-caret-right"></i>
                            </div>
                            <div class="comment-container">
                                <textarea
                                    v-model="formData.content"
                                    id="inputComment"
                                    rows="4"
                                    placeholder="Insert the comment..."
                                >
                                </textarea>
                                <i class="my_caret fa-solid fa-caret-right"></i>
                            </div>
                            <div v-if="commentSent" class="button button-end">
                                <div class="comment-sent">Comment sent!</div>
                                <button type="submit" class="btn btn-light">
                                    Send
                                </button>
                            </div>
                            <div
                                v-else-if="formErrors.content"
                                class="button button-end"
                            >
                                <div class="comment-sent">
                                    {{ checkValidation }}
                                </div>
                                <button type="submit" class="btn btn-light">
                                    Send
                                </button>
                            </div>
                            <div v-else class="button">
                                <button type="submit" class="btn btn-light">
                                    Send
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <LatestPosts :posts="postsLatest"/>
    </div>
</template>

<script>
import AuthorName from "../components/commons/AuthorName.vue";
import LatestPosts from "../components/sections/LatestPosts.vue";
import functionsShared from "../share/functionsShared.js";

export default {
    name: "Post",
    components: {
        AuthorName,
        LatestPosts,
    },
    data() {
        return {
            post: {},
            postsLatest: [],
            formData: {
                name: "",
                content: "",
                post_id: null,
            },
            commentSent: false,
            formErrors: {},
        };
    },
    methods: {
        newComment() {
            axios
                .post("/api/comments", this.formData)
                .then((response) => {
                    this.formData.name = "";
                    this.formData.content = "";
                    this.commentSent = true;
                })
                .catch((error) => {
                    this.formErrors = error.response.data.errors;
                    this.commentSent = false;
                });
        },
        scrollTo(where, distance) {
            let element = this.$refs[where];
            let top = element.offsetTop;
            scrollTo(0, top - distance);
        },
    },
    created() {
        axios
            .get("/api/posts/" + this.$route.params.slug)
            .then((response) => {
                let self = this;
                self.post = response.data;
                self.formData.post_id = self.post.id;
                self.post.formattedDate = functionsShared.formatDate(
                    self.post.created_at
                );
                if (self.post.comments.length > 0) {
                    self.post.comments.forEach((comment) => {
                        comment.formattedDate = functionsShared.formatDate(
                            comment.created_at
                        );
                    });
                }
                axios
                    .get("/api/posts-latest")
                    .then((response) => {
                        this.postsLatest = [...response.data];
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
            })
            .catch((error) => {
                this.$router.push({ name: "not-found" });
            });
    },
    computed: {
        checkValidation() {
            let errors = this.formErrors.content;
            if (errors) {
                if (errors.includes("The content field is required.")) {
                    return "The comment cannot be empty";
                } else {
                    return "";
                }
            }
        },
    },
};
</script>

<style lang="scss" scoped>
.single-post-page {
    .post {
        padding: 35px 25px 35px 65px;
        .top {
            .title {
                h1 {
                    font-size: 45px;
                }
                margin-bottom: 22px;
            }
            .info {
                display: flex;
                justify-content: space-between;
                margin-bottom: 10px;
                .left {
                    display: flex;
                    span {
                        margin: 0 15px;
                        color: var(--green);
                    }
                    .date {
                        font-size: 15px;
                        font-weight: 300;
                        color: var(--nav-color);
                        display: flex;
                        margin-left: 20px;
                        .slash {
                            color: var(--green);
                            margin: 0 5px;
                            font-weight: 500;
                        }
                    }
                }
                .right {
                    display: flex;
                    align-items: center;
                    a {
                        display: block;
                        font-size: 14px;
                        font-family: "Nimbus Sans", sans-serif;
                        color: var(--nav-color);
                        text-decoration: none;
                        margin-left: 8px;
                    }
                    .icon-comment {
                        width: 20px;
                        path {
                            fill: var(--green);
                        }
                    }
                }
            }
            .tags {
                margin-bottom: 22px;
                h4 {
                    font-size: 18px;
                    margin-right: 17px;
                }
                .tags-container {
                    margin-top: 12px 0;
                    display: flex;
                    flex-wrap: wrap;
                    align-items: center;
                    .tag {
                        margin-right: 12px;
                        color: var(--green);
                        background: var(--nav-color);
                        border-radius: 20px;
                        padding: 2px 6px;
                        font-size: 14px;
                        color: white;
                        display: block;
                        text-decoration: none;
                        &::before {
                            content: "#";
                        }
                        &:hover {
                            background-color: var(--green);
                        }
                    }
                }
            }
        }
        .bottom {
            img {
                width: 100%;
                margin-bottom: 15px;
            }
            &::v-deep .post-content {
                font-size: 20px;
                color: var(--author-name);
                letter-spacing: -0.1px;
                overflow-wrap: break-word;
                line-height: 1.5;
                font-family: "Nimbus Sans", sans-serif;
                img {
                    width: 100%;
                    margin-bottom: 15px;
                }
                p {
                    margin-bottom: 20px;
                    a {
                        color: var(--green);
                        border-bottom: 1px solid #f1f1f1;
                        text-decoration: none;
                    }
                }
                h3 {
                    color: black;
                    font-family: "Aktiv", sans-serif;
                    margin-bottom: 15px;
                }
            }
            #comments {
                margin-top: 60px;
                margin-bottom: 120px;
                display: flex;
                .left {
                    width: 60%;
                    h4 {
                        font-size: 24px;
                        font-weight: 700;
                        color: black;
                        padding-bottom: 20px;
                    }
                    .comments-empty {
                        font-size: 20px;
                        color: var(--author-name);
                        font-family: "Nimbus Sans", sans-serif;
                    }
                    .comment {
                        margin-bottom: 20px;
                        cursor: pointer;
                        &:hover {
                            .info {
                                .name {
                                    color: var(--green);
                                }
                            }
                        }
                        .info {
                            display: flex;
                            justify-content: space-between;
                            .name {
                                color: var(--nav-color);
                                margin-bottom: 5px;
                            }
                            .date {
                                font-size: 13px;
                                font-weight: 300;
                                color: var(--nav-color);
                                > * {
                                    display: inline-block;
                                }
                                .hour {
                                    text-align: right;
                                }
                                .slash {
                                    color: var(--green);
                                    margin: 0 2px;
                                }
                            }
                        }
                        .content {
                            color: var(--author-name);
                        }
                    }
                }
                .right {
                    width: 40%;
                    padding-left: 50px;
                    h4 {
                        font-size: 24px;
                        font-weight: 700;
                        color: black;
                        padding-bottom: 10px;
                        padding-left: 20px;
                    }
                    form {
                        .comment-container {
                            position: relative;
                            padding-left: 20px;
                            .my_caret {
                                font-size: 18px;
                                position: absolute;
                                top: 15px;
                                left: -10px;
                                color: black;
                                opacity: 0;
                                transition: 0.3s;
                            }
                            input,
                            textarea {
                                width: 100%;
                                font-size: 16px;
                                color: var(--nav-color);
                                border: none;
                                border-bottom: 1px solid var(--nav-color);
                                padding: 6px 0;
                                margin-top: 10px;
                                margin-bottom: 15px;
                                resize: none;
                                font-family: "Nimbus Sans", sans-serif;

                                &:focus {
                                    outline: none;
                                    border-color: var(--green);
                                }
                                &:focus + .my_caret {
                                    opacity: 1;
                                    color: var(--green);
                                    left: 0;
                                }
                            }
                        }
                        .button {
                            display: flex;
                            justify-content: flex-end;
                            margin-top: 10px;
                            padding-left: 20px;

                            .comment-sent {
                                color: var(--green);
                            }

                            &.button-end {
                                justify-content: space-between;
                                align-items: center;
                            }

                            button {
                                font-size: 14px;
                                border: none;
                                background-color: var(--nav-color);
                                border-radius: 40px;
                                padding: 10px 20px;
                                color: white;
                                cursor: pointer;
                                box-shadow: rgba(99, 99, 99, 0.2) 0px 2px 8px
                                    0px;
                                &:hover {
                                    background-color: var(--green);
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    &::v-deep .latest {
        padding-left: 65px;
    }
}
</style>
