<template>
    <div class="title">
        <h1>{{ name }}</h1>
    </div>
</template>

<script>
export default {
    name: "SectionTitle",
    props: {
        name: String,
    },
};
</script>

<style lang="scss" scoped>
.title {
    padding: 60px 0 30px;
    border-bottom: 2px solid var(--author-name);
    margin-bottom: 25px;
    h1 {
        font-size: 105px;
    }
}
</style>
