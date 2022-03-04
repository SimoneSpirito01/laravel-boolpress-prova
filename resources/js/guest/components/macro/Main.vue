<template>
    <main>
        <div class="container">
            <router-view :key="$route.fullPath"></router-view>
        </div>
    </main>
</template>

<script>
export default {
    name: "Main",
};
</script>

<style lang="scss" scoped>
main {
    width: 86%;
    margin-left: 14%;
    padding-left: 25px;
    overflow-y: auto;
    @media (max-width: 1200px) {
        margin-left: 15%;
    }
    @media (max-width: 992px) {
        margin-left: 16%;
    }
}
</style>
