<template>
    <div>
        <div v-bind:key="repo.uiid" v-for="repo in repos">
            <h3>
                <!-- add component -->
                <RepoItem v-bind:repo="repo" v-on:del-repo="$emit('del-repo', repo.uiid)" />
            </h3>
        </div>
    </div>
</template>

<script>
    import RepoItem from './RepoItem.vue';

    export default {
        name: "Repos",
        components: {
            RepoItem
        },
        props: ["repos"]
    }
</script>

<style scoped>

</style>