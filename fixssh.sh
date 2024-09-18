#!/bin/bash

#colorcodes
noformat='\e[0m'
red='\e[31m'
green='\e[32m'
yellow='\e[33m'
blue='\e[34m'
magenta='\e[35m'
cyan='\e[36m'
grey='\e[90m'
br_red='\e[91m'
br_green='\e[92m'
br_yellow='\e[93m'
br_blue='\e[94m'
br_magenta='\e[95m'
br_cyan='\e[96m'
bg_off='\e[40m'
bg_red='\e[41m'
bg_green='\e[42m'
bg_yellow='\e[43m'
bg_blue='\e[44m'
bg_magenta='\e[45m'
bg_cyan='\e[46m'
bg_grey='\e[100m'
bg_br_red='\e[101m'
bg_br_green='\e[102m'
bg_br_yellow='\e[103m'
bg_br_blue='\e[104m'
bg_br_magenta='\e[105m'
bg_br_cyan='\e[106m'

clear

printf "\n$br_yellow INFO:$yellow Checking if script is runnning as ROOT \n"
if [ `id -u` != '0' ]; then
    printf "$br_red RESULT:$red Root privileges are required for this script.\n"
    exit
else
    printf "$br_green RESULT:$green You are root.\n"
fi

cd /

printf "\n$br_yellow INFO:$yellow Appending$bg_grey PasswordAuthentication yes$bg_off to /etc/ssh/ssh_config!"
sleep 2
echo "PasswordAuthentication yes" >> /etc/ssh/ssh_config
printf "\n$br_green ...done!\n"


printf "\n$br_yellow INFO:$yellow Appending $bg_grey PasswordAuthentication yes$bg_off to /etc/ssh/sshd_config!"
sleep 2
echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config
printf "\n$br_green ...done!\n"

printf "\n$br_yellow INFO:$yellow Replacing /etc/ssh/sshd_config.d/60-cloudimg-settings.conf with one that contains $bg_grey PasswordAuthentication yes$bg_off!"
sleep 2
rm /etc/ssh/sshd_config.d/60-cloudimg-settings.conf
echo "PasswordAuthentication yes" > /etc/ssh/sshd_config.d/60-cloudimg-settings.conf
printf "\n$br_green ...done!\n"

printf "\n$br_red WARNING:$red Rebooting now! \n"
sleep 2
# reboot now