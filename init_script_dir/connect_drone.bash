#!/bin/bash -       
#title           :connect_drone
#description     :This script will connect local with drone via ssh connection and launch init_script.bash
#author		     :Andrea Bernardi   
#usage		     :./connect_drone.bash
#notes           :required sshpass (sudo apt install sshpass) if you don't want to insert pass every time
#                :working machine and drone must be on the same network
#                :need init_script.bash
#                :need clone.json file
#                :work in pwd/ros_catkin_ws/src
#bash_version    :sure to work on 4.3.8 or more

rm connect_logfile
touch connect_logfile

read -p 'Username (ex: pi): ' uservar
read -p 'Drone Name (ex: drone04): ' dronevar
read -p 'Network (ex: local): ' netvar
read -sp 'Password (ex: pass): ' passvar
echo 
echo ssh $uservar@$dronevar.$netvar >> connect_logfile

#sshpass -p $passvar scp connect_drone.bash $uservar@$dronevar.$netvar:/home/pi/
#echo connect_drone.bash copied to drone >> connect_logfile
#echo connect_drone.bash copied to drone
sshpass -p $passvar ssh $uservar@$dronevar.$netvar 'mkdir /home/pi/test'
echo mkdir /home/pi/test >> connect_logfile
echo mkdir /home/pi/test

sshpass -p $passvar scp init_script.bash $uservar@$dronevar.$netvar:/home/pi/test/
echo init_script.bash copied to drone >> connect_logfile
echo init_script.bash copied to drone 

sshpass -p $passvar scp clone.json $uservar@$dronevar.$netvar:/home/pi/test/
echo clone.bash copied to drone >> connect_logfile
echo clone.bash copied to drone

sshpass -p $passvar ssh $uservar@$dronevar.$netvar 'chmod +x /home/pi/test/init_script.bash'
echo chmod +x /home/pi/test/init_script.bash >> connect_logfile
echo chmod +x /home/pi/init_script.bash 

sshpass -p $passvar ssh $uservar@$dronevar.$netvar 'pwd'
sshpass -p $passvar ssh $uservar@$dronevar.$netvar './test/init_script.bash'
echo ./home/pi/init_script.bash >> connect_logfile
echo ./home/pi/test/init_script.bash