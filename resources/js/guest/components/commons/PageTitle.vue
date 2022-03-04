<template>
    <div class="top">
        <div class="title">
            <h1>{{ name }}</h1>
        </div>
        <div class="latest">
            <h2>
                The Latest from {{ name }}
            </h2>
        </div>
    </div>
</template>

<script>
export default {
    name: "PageTitle",
    props: {
        name: String,
    },
};
</script>

<style lang="scss" scoped>
.title {
    padding: 60px 0;
    border-bottom: 2px solid var(--author-name);
    h1 {
        font-size: 105px;
    }
}
.latest {
    margin-bottom: 35px;
    h2 {
        font-size: 40px;
        font-weight: 800;
        margin-top: 40px;
    }
}
</style>
