<!-- 
Author: Andrea Bernardi 

-->

<template>

  <div class="container">    

    <!-- binding class to value to change color when true/false  -->
    <div class="repo-item" v-b-toggle="this.repo.uiid" v-on:click="showPkgs" v-bind:class="{'is-clone':repo.clone}">
        <p class="line-item">
            <!-- add switch checkbox to enable/disable value -->
            <label class="switch" v-on:click.stop>
                <input class="switch-input" v-model="this.repo.clone" type="checkbox" v-on:change="markActive"/>
                <span class="switch-label" data-on="Clone" data-off="No Clone" />
                <span class="switch-handle" />
            </label>    
        </p>
        <!-- print value -->
        <p class="line-item">
            name: {{repo.name}}
        </p>
        <p class="line-item">
            link: {{repo.repository}}
        </p>
        <p class="line-item">
            branch: {{repo.branch}}
        </p>

        <form @submit="editRepo" v-bind:id="this.repo.uiid+1" class="hiddenform">
            <br>
            <input type="text" v-on:click.stop v-model="editName" name="repoName" placeholder="Name of Repository...">
            <input type="text" v-on:click.stop v-model="editRepository" name="repositoryName" placeholder="Link of Repository...">
            <input type="text" v-on:click.stop v-model="editBranch" name="repoBranch" placeholder="Branch of Repository...">
            <!-- form submit button -->
            <input class="addButton" v-on:click.stop type="submit" value="Change">
            <br><br>
        </form>

        <br>
        <p class="line-item" style="float: right">
            <!-- emit send to parent - delete repository button -->
            <button @click.stop="$emit('del-repo', repo.uiid)" class="btn btn-sm del">delete repo</button>
        </p>

        <p class="line-item" style="float: right">
            <!-- show hidden form button -->
            <button class="btn btn-sm edit" v-on:click.stop="showHidden">edit repo</button>
        </p>
    </div>
    <div class="pkg-item" v-bind:id="this.repo.uiid">

        <b-collapse v-bind:id="this.repo.uiid" class="mt-2">
            <b-card>
                <br>
                <div>
                    <!-- add component "$emit('add-pkg', newPkg)"-->
                    <AddPkg v-on:add-pkg="addPkg"/>
                </div>
                <div class="container" v-bind:key="pkg.uiid" v-for="pkg in this.repo.pkgs_array">
                    <!-- add component -->
                    <PkgItem v-bind:pkg="pkg" v-on:del-pkg="delPkg"/>
                </div>
            </b-card>
        </b-collapse>
    </div>    
  </div>

</template>

<script>
import PkgItem from '../components/PkgItem'
import AddPkg from '../components/AddPkg'

export default {
    name: "RepoItem",
    components: {
        PkgItem,
        AddPkg
    },
    data() {
        return {
            editName: '',
            editRepository: '',
            editBranch: ''
        }
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
        },
        //change branch to the specified one
        changeBranch(e){
            e.preventDefault();
            if(this.cBranch != '') {
                if(confirm("Do you really want to change branch?")){
                    this.repo.branch = this.cBranch;
                }
            }else{
                alert("!you cannot change branch name with 'null' name!")
            }
            //clear local data
            this.cBranch= '';
        },
        showHidden() {
            const id = this.repo.uiid+1;
            if(document.getElementById(id).style.display == 'block')
                document.getElementById(id).style.display= 'none';
            else
                document.getElementById(id).style.display= 'block';
        },
        showPkgs(){    
            if(document.getElementById(this.repo.uiid).style.display == 'table-cell')
                document.getElementById(this.repo.uiid).style.display= 'none';
            else
                document.getElementById(this.repo.uiid).style.display= 'table-cell';
        },
        editRepo(e) {
            e.preventDefault();
            if(this.editName != '' && this.editRepository != '' && this.editBranch != ''){
                if(confirm("Do you really want to change branch?")){
                    //using uuid to create univocal id
                    this.repo.name= this.editName;
                    this.repo.repository= this.editRepository;
                    this.repo.branch= this.editBranch;
                }
            }else{
                
                alert("!you can't edit a repository with 'null' parameter\nname: "+this.editName+"\nrepository link: "+this.editRepository+"\nbranch: "+this.editBranch+"!");
            }
            //clear local data
            this.editName= '';
            this.editRepository= '';
            this.editBranch= '';
        }
    }
}
</script>

<style scoped>

    .hiddenform {
        display: none;
        transform: scale(0.9);
    }

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
        color: rgb(253, 59, 48);
        background-color: whitesmoke;
        padding: 10px;
        border-bottom: 3px black dotted;
        border-radius: 50px;
        transition: all 0.5s ease 0s;
    }

    .repo-item:hover {
        background: rgb(194, 194, 194);
        transition: all 0.5s ease 0s;
    }

    .line-item {
        display: inline-table;
        vertical-align: middle;
        margin-right: 1%;
        margin-left: 1%;
    }

    .pkg-item {
        display: none;
        vertical-align: top;
        min-width: 50%;
        max-width: 50%;
        color: rgb(253, 59, 48);
        background-color: whitesmoke;
        padding: 10px;
        border-bottom: 3px black dotted;
        transition: all 0.5s ease 0s;
        border-radius: 50px;
    }

    .is-clone{
        color: green;
    }
    
    .edit{
        background-color: #0074D9;
        border-radius: 50px;
    }

    .del {
        float: right;
        background-color:rgb(253, 59, 48);
        border-radius: 50px;
    }

    form{
        display: inline;
    }

    input[type="text"] {
        flex: 10;
        padding: 5px;        
    }

    input[type="submit"]{
        flex: 2;
    }

</style>