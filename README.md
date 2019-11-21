# clonescriptui 
```
User interface generate json file used by init_script.bash
```
## User interface setup
```
npm install
```
### Compiles and hot-reloads for development
```
npm run serve
```
### Build and launch with electron
```
npm run electronstart
```
### Build and package with electron-package
```
npm run pkgbuild
```
### Build and package with electron-package --asar
```
npm run pkgbuildasar
```
### Launch electron packaged app
```
workdir 'clonescriptui-linux-x64'
if don't have permission use:
    chmod +x clonescriptui
launch:
    ./clonescriptui
```
## After launch

### Modify a clone.json
```
After launch the user interface click on "LOAD DATA FILE" button
```
### About view
```
Inside the user interface you can find "About" button in the page header
There are some tips to use well the inferface
```
### Customize configuration
* See: [Configuration Reference](https://cli.vuejs.org/config/)

# Generated file struct
```
configuraton object
conf:
    j1: true/false                          -- catkin build parameter j1
    ws_reset: true/false                    -- specify if you want to reset the workspace
    ws_init_already: true/false             -- specify if the workspace was already initialized

array of repository object
clone_array:
    "uiid": "repoexampleid"                 -- id generated for user interface by uuid v4
    "name": "repoexamplename"               -- name of the repository    
    "repository": "repoexample@link"        -- online link of the repository
    "branch": "branchexamplename"           -- branch of the repository
    "clone": true/false                     -- specify if you want to clone this repository or not

    array of package object
    "pkgs_array": [
        {       
            "uiid": "pkgexampleid"          -- id generated for user interface by uuid v4       
            "name": "pkgexamplename"        -- name of the package
            "build": true/false             -- specify if you want to build this package or not
        }
    ]
```

# init_script.bash

## Configuration File: clone.json \Folder: init_script_dir
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