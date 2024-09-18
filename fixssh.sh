#!/bin/bash
noformat='\e[0m'
red='\e[31m'
green='\e[32m'
yellow='\e[33m'
blue='\e[34m'
magenta='\e[35m'
cyan='\e[36m'
grey='\e[90m'
b_red='\e[91m'
b_green='\e[92m'
b_yellow='\e[93m'
b_blue='\e[94m'
b_magenta='\e[95m'
b_cyan='\e[96m'


clear

printf "\n $b_yellow INFO: $_yellow Checking if script is runnning as ROOT \n"
if [ `id -u` != '0' ]; then
    printf $b_red "Root privileges are required for this script."
else
    printf $b_green "You are root."
fi

cd /
printf "\n $b_green INFO: $green Appending PasswordAuthentication yes to /etc/ssh/ssh_config! \n"
sleep 2
echo "PasswordAuthentication yes" >> /etc/ssh/ssh_config

printf "\n $b_green INFO: $green Appending PasswordAuthentication yes to /etc/ssh/sshd_config! \n"
sleep 2
echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config

printf "\n $b_green INFO: $green Replacing /etc/ssh/sshd_config.d/60-cloudimg-settings.conf with one that contains PasswordAuthentication yes! \n"
sleep 2
rm /etc/ssh/sshd_config.d/60-cloudimg-settings.conf
echo "PasswordAuthentication yes" > /etc/ssh/sshd_config.d/60-cloudimg-settings.conf

printf "\n $b_red INFO: $red Rebooting now! \n"
sleep 2
# reboot now