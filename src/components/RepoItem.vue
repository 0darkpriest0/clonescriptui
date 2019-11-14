<template>

  <div class="container">            
    <!-- binding class to value to change color when true/false-->
    <div class="repo-item" v-bind:class="{'is-clone':repo.clone}">
        <!-- add switch checkbox to enable/disable value -->
        <label class="switch">
            <input class="switch-input" v-model="this.repo.clone" type="checkbox" v-on:change="markActive"/>
            <span class="switch-label" data-on="Clone" data-off="No Clone" />
            <span class="switch-handle" />
        </label>    
        <!-- print value -->
        {{repo.name}}
        <div>
            <!-- add component -->
            <AddPkg v-on:add-pkg="addPkg"/>
        </div>
        <br>
        <!-- emit send to parent - delete repository button -->
        <button @click="$emit('del-repo', repo.uiid)" class="del">delete repo</button>
    </div>
    <div class="pkg-item">
        <!-- add component -->
        <Pkgss v-bind:repo_id="repo.uiid" v-bind:pkgs_array="repo.pkgs_array" v-on:del-pkg="delPkg" />
    </div>    
  </div>

</template>

<script>
import AddPkg from '../components/AddPkg'
import Pkgss from '../components/Pkgss'

export default {
    name: "RepoItem",
    components: {
        AddPkg,
        Pkgss
    },
    props: ["repo"],
    //add methods
    methods: {
        //mark repository clone enable/disable
        markActive() {
            this.repo.clone = !this.repo.clone;
        },
        //add new package to repository
        addPkg(newPkg) {
            this.repo.pkgs_array = [...this.repo.pkgs_array, newPkg];
        },
        //delete specific package from repository
        delPkg(id) {
            this.repo.pkgs_array = this.repo.pkgs_array.filter(pkg => pkg.uiid != id);
        }
    }
}
</script>

<style scoped>

    .container {
        display: table;
        margin: 10px;
        width: 97%;
    }

    .repo-item {
        display: table-cell;
        vertical-align: top;
        min-width: 50%;
        max-width: 50%;
        color: red;
        background-color: whitesmoke;
        padding: 10px;
        border-bottom: 3px #ccc dotted;
    }

    .pkg-item {
        display: table-cell;
        max-width: 50%;
        color: red;
        background-color: whitesmoke;
        padding: 10px;
        border-bottom: 3px #ccc dotted;
    }

    .is-clone{
        color: green;
    }
    
    .del {
        height: 100%;
        width: auto;
        background: #ff0000;
        color: #fff;
        border: none;
        padding: 5px 9px;
        border-radius: 50%;
        cursor: pointer;
        float: left;
    }

</style>