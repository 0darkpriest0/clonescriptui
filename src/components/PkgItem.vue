<template>
    <div>
        <!-- binding class to value to change color when true/false-->
        <div class="pkg-item" v-bind:class="{'is-build':pkg.build}">
            <!-- add switch checkbox to enable/disable value -->
            <label class="switch">
                <input class="switch-input" v-model="this.pkg.build" type="checkbox"  v-on:change="markBuild"/>
                <span class="switch-label" data-on="Build" data-off="Off" />
                <span class="switch-handle" />
            </label>
            <!-- print value -->
            {{pkg.name}}
            <!-- emit send to parent - delete package button  -->
            <button @click="$emit('del-pkg', pkg.uiid)" class="del">X</button> 
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

    .pkg-item {
        color: red;
        background: #f4f4f4;
        padding: 10px;
        border-bottom: 1px #ccc dotted;
    }

    .is-build{
        color: rgb(31, 192, 31);
    }
    
    .del {
        background: #ff0000;
        color: #fff;
        border: none;
        padding: 5px 9px;
        border-radius: 50%;
        cursor: pointer;
        float: right;
    }

</style>