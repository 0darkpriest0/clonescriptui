# clonescriptui 
```
Generate json file used by init_script.bash
```
## Project setup
```
npm install
```
### Compiles and hot-reloads for development
```
npm run serve
```
### Compiles and minifies for production
```
npm run build
```
### Lints and fixes files
```
npm run lint
```
### Customize configuration
See [Configuration Reference](https://cli.vuejs.org/config/).

# Generated file struct
```
configuraton object
conf:
    j1: true/false                  -- catkin build parameter j1
    ws_reset: true/false            -- specify if you want to reset the workspace
    ws_init_already: true/false     -- specify if the workspace was already initialized

array of repository object
clone_array:
    "uiid": "exampleid"                       -- id generated for user interface by uuid v4
    "name": "repoexamplename"               -- name of the repository    
    "repository": "repoexamplelink@git"     -- online link of the repository
    "branch": "branchexamplename"           -- branch of the repository
    "clone": true/false                     -- specify if you want to clone this repository or not

    array of package object
    "pkgs_array": [
        {       
            "uiid": "exampleid"             -- id generated for user interface by uuid v4       
            "name": "pkgexamplename"        -- name of the package
            "build": true/false             -- specify if you want to build this package or not
        }
    ]
