<template>
    <header>
        <div class="container">
            <nav>
                <ul>
                    <li>
                        <Logo />
                    </li>
                    <li>
                        <router-link :to="{ name: 'home' }">Home</router-link>
                    </li>
                    <li v-for="category in categories" :key="category.id">
                        <router-link
                            :to="{
                                name: 'category',
                                params: { slug: category.slug },
                            }"
                        >
                            {{ category.name }}
                        </router-link>
                    </li>
                    <li><a href="/admin/home">Reserved area</a></li>
                </ul>
            </nav>
        </div>
    </header>
</template>

<script>
import Logo from "../commons/Logo.vue";

export default {
    name: "Header",
    components: {
        Logo,
    },
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
header {
    width: 14%;
    position: fixed;
    top: 0;
    left: 0;
    ul {
        list-style: none;
        padding: 42px 30px;

        li {
            margin-bottom: 12px;
            a {
                font-size: 28px;
                font-weight: 200;
                color: var(--nav-color);
                text-decoration: none;
                &:hover {
                    color: var(--green);
                }
            }
        }

        @media (max-width: 1400px) {
            padding: 42px 25px;
            li {
                a {
                    font-size: 27px;
                }
            }
        }
        @media (max-width: 1200px) {
            padding: 42px 22px;
            li {
                a {
                    font-size: 26px;
                }
            }
        }
        @media (max-width: 992px) {
            li {
                a {
                    font-size: 24px;
                }
            }
        }
        @media (max-width: 900px) {
            li {
                a {
                    font-size: 22px;
                }
            }
        }
    }
}
</style>
