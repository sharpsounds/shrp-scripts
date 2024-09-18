#!/bin/bash

#colorcodes
noformat='\e[0;40m'
black='\e[30;40m'
red='\e[31;40m'
green='\e[32;40m'
yellow='\e[33;40m'
blue='\e[34;40m'
magenta='\e[35;40m'
cyan='\e[36;40m'
grey='\e[90;40m'
br_red='\e[91;40m'
br_green='\e[92;40m'
br_yellow='\e[93;40m'
br_blue='\e[94;40m'
br_magenta='\e[95;40m'
br_cyan='\e[96;40m'
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

code='\e[30;100m'

clear

printf "\n$br_yellow INFO:$yellow Checking if script is runnning as ROOT \n"
if [ `id -u` != '0' ]; then
    printf "$br_red RESULT:$red ROOT privileges not found. ROOT privileges are required for this script.\n"
    exit
else
    printf "$br_green RESULT:$green You are ROOT.\n"
fi

cd /

printf "\n$br_yellow INFO:$yellow Appending $code PasswordAuthentication yes $yellow to /etc/ssh/ssh_config!"
sleep 2
echo "PasswordAuthentication yes" >> /etc/ssh/ssh_config
printf "$br_green ...done!\n"


printf "\n$br_yellow INFO:$yellow Appending $code PasswordAuthentication yes $yellow to /etc/ssh/sshd_config!"
sleep 2
echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config
printf "$br_green ...done!\n"

printf "\n$br_yellow INFO:$yellow Replacing /etc/ssh/sshd_config.d/60-cloudimg-settings.conf with one that contains $code PasswordAuthentication yes $yellow !"
sleep 2
rm /etc/ssh/sshd_config.d/60-cloudimg-settings.conf
echo "PasswordAuthentication yes" > /etc/ssh/sshd_config.d/60-cloudimg-settings.conf
printf "$br_green ...done!\n"

printf "\n$br_red WARNING:$red Rebooting now! \n"
sleep 2
# reboot now