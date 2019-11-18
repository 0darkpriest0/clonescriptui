<template>
    <div>
        <label class="text-reader">
            <input type="file" @change="loadTextFromFile">
        </label>
        <br><br>
        {{this.conf}}
        <br>
        <br>
        {{this.repos}}
        <br><br>
    </div>
</template>

<script>

    export default {
        name: "FileUpload",
        //data structure containing configuration object and repos object
        data() {
            return {
                conf:
                {
                    j1: false,
                    ws_reset: false,
                    ws_init_already: false
                },
                repos: []
            }
        },
        methods: {
            loadTextFromFile(ev) {
                const file = ev.target.files[0];
                const reader = new FileReader();      
                reader.onload = e => this.conf = (JSON.parse(e.target.result).conf)
                reader.onload = e => this.repos = (JSON.parse(e.target.result).clone_array)

                reader.readAsText(file);
            }
        }
    }
</script>
