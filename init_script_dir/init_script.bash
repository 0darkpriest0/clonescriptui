#!/bin/bash -       
#title           :init_script
#description     :This script will clone clone.json's repositories and build with catkin build only the packages in whitelist
#author		     :Andrea Bernardi   
#usage		     :./init_script.bash
#notes           :Install jq on drone to use this script --> sudo apt install jq
#                :need clone.json file
#                :work in pwd/ros_catkin_ws/src
#bash_version    :sure to work on 4.3.8 or more

rm init_logfile
touch init_logfile

declare -a opt_array
declare -a gitpath_array
declare -a pkgsbuild_array
declare -a pkgs_array_lenght

#set name on ros directory name
rosdir='ros_catkin_ws_test'

j1=`jq '.conf.j1 ' clone.json`
ws_reset=`jq '.conf.ws_reset' clone.json`
ws_init_already=`jq '.conf.ws_init_already' clone.json`
echo init configuration >> init_logfile
echo j1-- $j1 >> init_logfile
echo ws_reset-- $ws_reset >> init_logfile
echo ws_init_already-- $ws_init_already >> init_logfile

if [ $j1 == true ]
then
    opt_array[0]="-j1"
else
    opt_array[0]=""
fi

if [ $ws_reset == true ]
then
    cd $rosdir
    catkin clean -y
    cd ..
    rm -rf $rosdir
    rm -rf .catkin_tools
    mkdir -p $rosdir/src
    cd $rosdir/src
    catkin_init_workspace
    cd ../..
    echo workspace reset >> init_logfile

else
    catkin clean -y
    echo no workspace reset >> init_logfile
fi

if [ $ws_init_already == false ] && [ $ws_reset == false ]
then
    mkdir -p $rosdir/src
    cd $rosdir/src
    catkin_init_workspace
    cd ../..
    echo workspace init >> init_logfile
else
    echo workspace init already >> init_logfile
fi

value=$(jq '.clone_array[].pkgs_array | length' clone.json);

for word in $value
do
    str+=$word";"
done
IFS=';' read -ra pkgs_array_lenght <<< "$str"

echo finish configuration >> init_logfile
echo init clone >> init_logfile
echo git clone >> init_logfile

for k in $(jq '.clone_array | keys | .[]' clone.json); 
do
    value=$(jq -r ".clone_array[$k]" clone.json);
    clone=$(jq '.clone' <<< "$value");
    name=$(jq -r '.name' <<< "$value");
    repo=$(jq -r '.repository' <<< "$value");
    branch=$(jq -r '.branch' <<< "$value");

    if [ $clone == true ]
    then
        gitpath_array+=($repo)
        echo "  -master - "$name >> init_logfile
    
        cd $rosdir/src
        git clone $repo
        cd ../..
        
        if [ $branch != "master" ]
        then
            echo "      -update from master to "$branch" - "$name >> init_logfile
        
            cd $rosdir/src/$name
            git fetch --all
            git checkout $branch
            cd ../../..
        else
            echo ""
        fi
        
    else
        gitpath_array+=""
    fi

    for ((i=0; i<${pkgs_array_lenght[$k]}; i++));
    do
        build=$(jq -r ".clone_array[$k].pkgs_array[$i].build" clone.json);
        
        if [ $build == true ]
        then
            pkg_name=$(jq -r ".clone_array[$k].pkgs_array[$i].name" clone.json);
            pkgsbuild_array+=" "$pkg_name;
        else
            pkgsbuild_array+="";
        fi
    done
done

echo finish clone >> init_logfile
echo pkg to build: >> init_logfile

for values in ${pkgsbuild_array[@]};
do
    echo "  -"$values >> init_logfile

done

echo start build >> init_logfile
cd $rosdir
catkin config --whitelist ${pkgsbuild_array[@]}
catkin build ${opt_array[0]}
cd ..
echo finish build >> init_logfile