<template>
    <div>
        <!-- add switch checkbox to show/hide collapsable item -->
        <label class="switch switch-yes-no">
            <input v-b-toggle="repo_id" class="switch-input" type="checkbox" />
            <span class="switch-label" data-on="Hide Packages" data-off="Show Packages"></span> 
            <span class="switch-handle"></span> 
        </label>
        <!-- add collapsable item with bootstrap b-collapse connected to switch by id -->
        <b-collapse v-bind:id="repo_id" class="mt-2">
            <b-card>
                <div v-bind:key="pkg.uiid" v-for="pkg in pkgs_array">
                    <!-- add component -->
                    <PkgItem v-bind:pkg="pkg" v-on:del-pkg="$emit('del-pkg', pkg.uiid)"/>
                </div>
            </b-card>
        </b-collapse>
    </div>
</template>

<script>
import PkgItem from '../components/PkgItem'

export default {
    name: "Pkgss",
    components: {
        PkgItem
    },
    props: ["pkgs_array", "repo_id"]
}
</script>

<style scoped>

    /* Switch Yes No
    ==========================*/
    .switch-yes-no {
        padding: 0;
        margin: 15px 0 0;
        background: #FFF;
        border-radius: 0;
        background-image: none;
    }
    .switch-yes-no .switch-label {
        box-shadow: none;
        background: none;
    }
    .switch-yes-no .switch-label:after, .switch-yes-no .switch-label:before {
        width: 100%;
        height: 70%;
        top: 5px;
        left: 0;
        text-align: center;
        padding-top: 10%;
        box-shadow: inset 0 1px 4px rgba(0, 0, 0, 0.2), inset 0 0 3px rgba(0, 0, 0, 0.1);
    }
    .switch-yes-no .switch-label:after {
        color: #FFFFFF;
        background: #32CD32;
        backface-visibility: hidden;
        transform: rotateY(180deg);
    }
    .switch-yes-no .switch-label:before {
        background: #eceeef;
        backface-visibility: hidden;
    }
    .switch-yes-no .switch-handle {
        display: none;
    }
    .switch-yes-no .switch-input:checked ~ .switch-label {
        background: #FFF;
        border-color: #0088cc;
    }
    .switch-yes-no .switch-input:checked ~ .switch-label:before {
        transform: rotateY(180deg)
    }
    .switch-yes-no .switch-input:checked ~ .switch-label:after {
        transform: rotateY(0)
    }

</style>