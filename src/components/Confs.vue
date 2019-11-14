<template>
    <div class="conf-item">
        <!-- binding class to value to change color when true/false-->
        <div v-bind:class="{'is-active':conf.j1}">
            <!-- add switch checkbox to enable/disable value -->
            <label class="switch" >
                <input id="prova1" class="switch-input" v-model="this.conf.j1" type="checkbox" v-on:change="markj1On"/>
                <span class="switch-label" data-on="On" data-off="Off" />
                <span class="switch-handle" />
            </label>
            <!-- print value -->
            j1: {{this.conf.j1}}
        </div>
        <!-- binding class to value to change color when true/false-->
        <div v-bind:class="{'is-active':conf.ws_reset}">
            <!-- add switch checkbox to enable/disable value -->
            <label class="switch">
                <input class="switch-input" v-model="this.conf.ws_reset" type="checkbox" v-on:change="markwsrOn"/>
                <span class="switch-label" data-on="On" data-off="Off" />
                <span class="switch-handle" />
            </label>  
            <!-- print value -->
            ws_reset: {{this.conf.ws_reset}}
        </div>
        <!-- binding class to value to change color when true/false-->
        <div v-bind:class="{'is-active':conf.ws_init_already}">
            <!-- add switch checkbox to enable/disable value -->
            <label class="switch">
                <input class="switch-input" v-model="this.conf.ws_init_already" type="checkbox" v-on:change="markwsiaOn"/>
                <span class="switch-label" data-on="On" data-off="Off" />
                <span class="switch-handle" />
            </label>  
            <!-- print value -->
            ws_init_already: {{this.conf.ws_init_already}}
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
        color: red;
        background: #f4f4f4;
        padding: 10px;
        border-bottom: 3px black dotted;
    }

    .is-active{
        color: rgb(31, 192, 31);
    }

</style>