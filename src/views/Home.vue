<template>
  <div class="home">
    <!-- add Confs component to Home -->
    <br>
    <div class="dropdown">
      <button class="dropbtn">hover me for action</button>
      <div class="dropdown-content">
        <div style="display: table">
          <a>
            <!-- <button class="addButton" @click="chooseFiles">LOAD DATA FROM FILE</button> -->
            <input id="fileUpload" name="fileUpload" hidden type="file" v-on:change="loadFile" />
            <label for="fileUpload" class="addButton">LOAD DATA FROM FILE</label>
          </a>
          <a>
          <button class="addButton" v-on:click="reset">RESET DATA</button>
          </a>
          <a>
            <button class="addButton" v-on:click="createFile">SAVE DATA TO FILE</button>
          </a>
        </div>
      </div>
    </div> 

    <br><br>
    <p style="margin-left: 10px">CONFIGURATION</p>
    <Confs v-bind:conf="conf" />
    <br><br>
    <!-- add AddRepo and Repos components to Home -->
    <p style="margin-left: 10px">REPOSITORIES</p>
    <AddRepo v-on:add-repo="addRepo"/>
    <Repos v-bind:repos="repos" v-on:del-repo="delRepo" />
  </div>
</template>

<script>
import AddRepo from '../components/AddRepo'
import Confs from '../components/Confs'
import Repos from '../components/Repos'

export default {
  name: 'home',
  components: {
    Confs,
    AddRepo,
    Repos
  },  
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
  //add to localStorage data parsed
  mounted() {
      if(localStorage.getItem('conf')) {
       this.conf = JSON.parse(localStorage.getItem('conf'));
      }
      if(localStorage.getItem('repos')) {
       this.repos = JSON.parse(localStorage.getItem('repos'));
      }
  },
  //add handler methods to data to update localStorage on data change
  watch: {
    conf: {
      handler() {
        localStorage.setItem('conf', JSON.stringify(this.conf));
      },
      deep: true,
    },
    repos: {
      handler() {
        localStorage.setItem('repos', JSON.stringify(this.repos));
      },
      deep: true,
    }
  },
  //add methods
  methods: {
    //delete repository
    delRepo(id) {
      if(confirm("Do you really want to delete this repository?"))
        this.repos = this.repos.filter(repo => repo.uiid != id);
    },
    //add repository
    addRepo(newRepo) {
      this.repos = [...this.repos, newRepo];
    },
    //reset data
    reset() {
      if(confirm("Do you really want to reset local data?")){
        localStorage.conf = '';
        localStorage.repos = '';
        this.conf.j1 = false;
        this.conf.ws_reset = false;
        this.conf.ws_init_already = false;
        this.repos = [];
      }
    },
    //load data from json file
    loadFile(ev) {
      const file = ev.target.files[0];
      const reader = new FileReader();      
      reader.onload = e => this.conf = (JSON.parse(e.target.result).conf);
      const reader2 = new FileReader();
      reader2.onload = e => this.repos = (JSON.parse(e.target.result).clone_array);

      reader.readAsText(file);
      reader2.readAsText(file);
      alert("!new data loaded!");
    },
    //json formatting
    formatJson() {
      const confData = JSON.stringify(this.conf, null, "\t")
      const reposData = JSON.stringify(this.repos, null , "\t")
      const dataParsed = '{"conf":'+confData+',"clone_array":'+reposData+'}'
      return dataParsed;
    },
    //create json file for download
    createFile() {
      const dataParsed = this.formatJson();
      const blob = new Blob([dataParsed], {type: 'text/plain'})
      const e = document.createEvent('MouseEvents'),
      a = document.createElement('a');
      a.download = "clone.json";
      a.href = window.URL.createObjectURL(blob);
      a.dataset.downloadurl = ['text/json', a.download, a.href].join(':');
      e.initEvent('click', true, false, window, 0, 0, 0, 0, 0, false, false, false, false, 0, null);
      a.dispatchEvent(e);
    }
  }
}
</script>

<style>

  /* Dropdown Button */
  .dropbtn {
    margin-left: 10px;
    color: white !important;
    text-transform: uppercase;
    text-decoration: none;
    font-size: 17px;
    background: rgb(37, 36, 36);
    padding: 9px;
    height: 100%;
    border-radius: 50px;
    display: inline-block;
    border: none;
    transition: all 0.5s ease 0s;
  }

  /* The container <div> - needed to position the dropdown content */
  .dropdown {
    position: relative;
    display: inline-block;
  }

  /* Dropdown Content (Hidden by Default) */
  .dropdown-content {
    display: none;
    padding: 3%;
    position: absolute;
    background-color: #ddd;
    width: max-content;
    border-radius: 50px;
    outline: 2px dotted green;
    -moz-outline-radius: 50px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
  }

  /* Links inside the dropdown */
  .dropdown-content a {
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: inline-table;
  }

  /* Show the dropdown menu on hover */
  .dropdown:hover .dropdown-content {display: inline-block;}

  /* Change the background color of the dropdown button when the dropdown content is shown */
  .dropdown:hover .dropbtn {background-color: #3e8e41;} 

  .upload-btn-wrapper {
    position: relative;
    overflow: hidden;
    display: inline-block;
  }

  .upload-btn-wrapper input[type=file] {
    font-size: 100px;
    position: absolute;
    left: 0;
    top: 0;
    opacity: 0;
  }

    /* Add Button 
    ==========================*/
  .addButton {
      margin-left: 10px;
      color: white !important;
      text-transform: uppercase;
      text-decoration: none;
      font-size: 17px;
      background: rgb(37, 36, 36);
      padding: 9px;
      height: 100%;
      border-radius: 50px;
      display: inline-block;
      border: none;
      transition: all 0.5s ease 0s;
  }

  .addButton:hover {
      background: green;
      letter-spacing: 1px;
      -webkit-box-shadow: 0px 5px 40px -10px rgba(0,0,0,0.57);
      -moz-box-shadow: 0px 5px 40px -10px rgba(0,0,0,0.57);
      box-shadow: 5px 40px -10px rgba(0,0,0,0.57);
      transition: all 0.5s ease 0s;
  }

    /* Switch 
    ==========================*/
    .switch {
      position: relative;
      display: block;
      width: 100px;
      height: 30px;
      padding: 3px;
      margin: 0 10px 10px 0;
      background: linear-gradient(to bottom, #eeeeee, #FFFFFF 25px);
      background-image: -webkit-linear-gradient(top, #eeeeee, #FFFFFF 25px);
      border-radius: 18px;
      box-shadow: inset 0 -1px white, inset 0 1px 1px rgba(0, 0, 0, 0.05);
      cursor: pointer;
    }
    .switch-input {
      position: absolute;
      top: 0;
      left: 0;
      opacity: 0;
    }
    .switch-label {
      position: relative;
      display: block;
      height: inherit;
      font-size: 10px;
      text-transform: uppercase;
      background: #eceeef;
      border-radius: inherit;
      box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.12), inset 0 0 2px rgba(0, 0, 0, 0.15);
    }
    .switch-label:before, .switch-label:after {
      position: absolute;
      top: 50%;
      margin-top: -.5em;
      line-height: 1;
      -webkit-transition: inherit;
      -moz-transition: inherit;
      -o-transition: inherit;
      transition: inherit;
    }
    .switch-label:before {
      content: attr(data-off);
      right: 11px;
      color: #aaaaaa;
      text-shadow: 0 1px rgba(255, 255, 255, 0.5);
    }
    .switch-label:after {
      content: attr(data-on);
      left: 11px;
      color: #FFFFFF;
      text-shadow: 0 1px rgba(0, 0, 0, 0.2);
      opacity: 0;
    }
    .switch-input:checked ~ .switch-label {
      background: green;
      box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.15), inset 0 0 3px rgba(0, 0, 0, 0.2);
    }
    .switch-input:checked ~ .switch-label:before {
      opacity: 0;
    }
    .switch-input:checked ~ .switch-label:after {
      opacity: 1;
    }
    .switch-handle {
      position: absolute;
      top: 4px;
      left: 4px;
      width: 28px;
      height: 28px;
      background: linear-gradient(to bottom, #FFFFFF 40%, #f0f0f0);
      background-image: -webkit-linear-gradient(top, #FFFFFF 40%, #f0f0f0);
      border-radius: 100%;
      box-shadow: 1px 1px 5px rgba(0, 0, 0, 0.2);
    }
    .switch-handle:before {
      content: "";
      position: absolute;
      top: 50%;
      left: 50%;
      margin: -6px 0 0 -6px;
      width: 12px;
      height: 12px;
      background: linear-gradient(to bottom, #eeeeee, #FFFFFF);
      background-image: -webkit-linear-gradient(top, #eeeeee, #FFFFFF);
      border-radius: 6px;
      box-shadow: inset 0 1px rgba(0, 0, 0, 0.02);
    }
    .switch-input:checked ~ .switch-handle {
      left: 74px;
      box-shadow: -1px 1px 5px rgba(0, 0, 0, 0.2);
    }
    /* Transition
        ========================== */
    .switch-label, .switch-handle {
      transition: All 0.3s ease;
      -webkit-transition: All 0.3s ease;
      -moz-transition: All 0.3s ease;
      -o-transition: All 0.3s ease;
    }
</style>