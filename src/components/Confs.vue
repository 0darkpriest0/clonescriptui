<!-- 
Author: Andrea Bernardi 

-->

<template>
    <div class="conf-item">
        <!-- binding class to value to change color when true/false-->
        <div class="item">
            <!-- add switch checkbox to enable/disable value -->
            <label class="switch" >
                <input id="prova1" class="switch-input" v-model="this.conf.j1" type="checkbox" v-on:change="markj1On"/>
                <span class="switch-label" data-on="On" data-off="Off" />
                <span class="switch-handle" />
            </label>
            <!-- print value -->
            <h3 v-bind:class="{'is-active':conf.j1}">j1: {{this.conf.j1}}</h3>
        </div>
        <!-- binding class to value to change color when true/false-->
        <div class="item">
            <!-- add switch checkbox to enable/disable value -->
            <label class="switch">
                <input class="switch-input" v-model="this.conf.ws_reset" type="checkbox" v-on:change="markwsrOn"/>
                <span class="switch-label" data-on="On" data-off="Off" />
                <span class="switch-handle" />
            </label>  
            <!-- print value -->
            <h3 v-bind:class="{'is-active':conf.ws_reset}">ws_reset: {{this.conf.ws_reset}}</h3>
        </div>
        <!-- binding class to value to change color when true/false-->
        <div class="item">
            <!-- add switch checkbox to enable/disable value -->
            <label class="switch">
                <input class="switch-input" v-model="this.conf.ws_init_already" type="checkbox" v-on:change="markwsiaOn"/>
                <span class="switch-label" data-on="On" data-off="Off" />
                <span class="switch-handle" />
            </label>  
            <!-- print value -->
            <h3 v-bind:class="{'is-active':conf.ws_init_already}">ws_init_already: {{this.conf.ws_init_already}}</h3>
        </div>
    </div>
</template>

<script>
    export default {
        name: "Confs",
        props: ["conf"],
        //add methods
        methods: {
            //mark conf.j1 enable/disable
            markj1On() {
                this.conf.j1 = !this.conf.j1;
            },
            //mark conf.ws_reset enable/disable
            markwsrOn() {
                this.conf.ws_reset = !this.conf.ws_reset;
            },
            //mark conf.ws_init_already enable/disable
            markwsiaOn() {
                this.conf.ws_init_already = !this.conf.ws_init_already;     
            }        
        }
    }
</script>

<style scoped>

    .conf-item {
        display: table;
        width: 97%;
        color: rgb(253, 59, 48);
        background: #f4f4f4;
        padding: 10px;
        margin: 10px;
        border-bottom: 3px black dotted;
        border-radius: 50px;
    }

    .item {
        display: table-cell;
        width: 30%;
        vertical-align: middle;
        padding-left: 1%;
    }

    .is-active {
        color: green;
    }

</style>