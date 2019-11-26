<template>
    <div class="container">
        <!-- binding class to value to change color when true/false-->
        <div class="pkg-item" v-bind:class="{'is-build':pkg.build}">
            <!-- add switch checkbox to enable/disable value -->
            <label class="switch">
                <input class="switch-input" v-model="this.pkg.build" type="checkbox"  v-on:change="markBuild"/>
                <span class="switch-label" data-on="Build" data-off="No Build" />
                <span class="switch-handle" />
            </label>
            <!-- print value -->
            {{pkg.name}}
            <!-- emit send to parent - delete package button  -->
            <button @click="$emit('del-pkg', pkg.uiid)" class="btn btn-sm del">delete pkg</button> 
        </div>
    </div>
</template>

<script>
export default {
    name: "PkgItem",
    props: ["pkg"],
    //add methods
    methods: {
        //mark package build enable/disable
        markBuild() {
            this.pkg.build = !this.pkg.build;
        }
    }
}
</script>

<style scoped>

    .container {
        display: table;
        margin: 10px;
        width: 97%;
        border-radius: 50px;
    }

    .pkg-item {
        color: rgb(253, 59, 48);
        background: #f4f4f4;
        padding: 10px;
        border-bottom: 1px #ccc dotted;
    }

    .is-build{
        color: green;
    }
    
    .del {
        float: right;
        background-color: rgb(253, 59, 48);
        border-radius: 50px;
    }

</style>