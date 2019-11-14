<template>
    <div>
        <form @submit="addPkg">
            <input type="text" v-model="name" name="pkgName" placeholder="Name of New Package...">
            <input class="addButton" type="submit" value="Add New Pkg" >
        </form>
    </div>
</template>

<script>
    import uuid from 'uuid';
    
    export default {
        name: "AddPkg",
        //add data
        data() {
            return {
                name: ''
            }
        },
        //add methods
        methods: {
            //create a new package object newPkg and send it to parent with emit
            addPkg(e) {
                e.preventDefault();
                if(this.name != ''){
                    const newPkg = {
                        //using uuid to create univocal id
                        uiid: uuid.v4(),
                        name: this.name,
                        build: false
                    }
                    //Send up to parent
                    this.$emit('add-pkg', newPkg);
                }else{
                    alert("you cannot insert a new package with 'null' name")
                }
                //clear local data
                this.name= '';
            }
        }
    }
</script>

<style scoped>
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