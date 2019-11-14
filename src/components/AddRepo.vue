<template>
    <div class="container">
        <!-- form to create a new repository -->
        <form @submit="addRepo">
            <input type="text" v-model="name" name="repoName" placeholder="Add Name of New Repository...">
            <input type="text" v-model="repository" name="repositoryName" placeholder="Add repository link of New Repository...">
            <input type="text" v-model="branch" name="repoBranch" placeholder="Add Branch of New Repository...">
            <!-- form submit button -->
            <input class="addButton" type="submit" value="Add New Repo">
        </form>
    </div>
</template>

<script>
    import uuid from 'uuid';
    
    export default {
        name: "AddRepo",
        //add data
        data() {
            return {
                name: '',
                repository: '',
                branch: '',
                pkgs_array: []
            }
        },
        //add methods
        methods: {
            //create a new repository object newRepo and send it to parent with emit
            addRepo(e) {
                e.preventDefault();
                    if(this.name != '' && this.repository != '' && this.branch != ''){
                    const newRepo = {
                        //using uuid to create univocal id
                        uiid: uuid.v4(),
                        name: this.name,
                        repository: this.repository,
                        branch: this.branch,
                        clone: false,
                        pkgs_array: this.pkgs_array
                    }
                    //Send up to parent
                    this.$emit('add-repo', newRepo);
                }else{
                    
                    alert("you can't insert a new repository with 'null' parameter\nname: "+this.name+"\nrepository link: "+this.repository+"\nbranch: "+this.branch)
                }
                //clear local data
                this.name= '';
                this.repository= '';
                this.branch= '';
                this.pkgs_array= [];
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