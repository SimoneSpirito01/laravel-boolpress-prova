<template>
    <div class="container">
        <Header />
        <Main />
    </div>
</template>

<script>
import Header from "./components/macro/Header.vue";
import Main from "./components/macro/Main.vue";

export default {
    name: "App",
    components: {
        Header,
        Main,
    },
};
</script>

<style lang="scss" scoped>
.container {
    display: flex;
    width: 85%;
    max-width: 1600px;
    @media (max-width: 1500px) {
        width: 90%;
    }
    @media (max-width: 1200px) {
        width: 95%;
    }
    @media (max-width: 900px) {
        width: 100%;
    }
}
</style>
