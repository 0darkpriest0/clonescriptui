# clonescriptui 
```
Generate json file used by init_script.bash
```
## User interface setup
```
npm install
```
### Compiles and hot-reloads for development
```
npm run serve
```
### Modify a clone.json
```
clone.json file you want to modify must be in clonescriptui/public folder
In public folder there is already a clone.json file example
After launch the user interface click on "LOAD DATA FILE" button
```
### About view
```
Inside the user interfate you can find About button in the page header
There are some tips to use well the inferface
```
### Customize configuration
```
See [Configuration Reference](https://cli.vuejs.org/config/).
```

# Generated file struct
```
configuraton object
conf:
    j1: true/false                          -- catkin build parameter j1
    ws_reset: true/false                    -- specify if you want to reset the workspace
    ws_init_already: true/false             -- specify if the workspace was already initialized

array of repository object
clone_array:
    "uiid": "exampleid"                     -- id generated for user interface by uuid v4
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
```

# init_script.bash

## Configuration File: clone.json
## Folder: init_script_dir
```
init_script.bash generate or modify a catkin workspace named ros_catkin_ws in the same folder
It clone all the repository specified and build only the packages specified in clone.json
```
## Example
```
Inside init_script_dir folder there is already a clone.json file example
```
### Script setup
```
clone.json and init_script.bash must be in the same folder.
```
### Script launch
```
Workdir: init_script.bash folder
Run command: ./init_script
```