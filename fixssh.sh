#!/bin/bash
#colorcodes
noformat='\e[0;40m'
red='\e[31;40m'
green='\e[32;40m'
yellow='\e[33;40m'
br_red='\e[91;40m'
br_green='\e[92;40m'
br_yellow='\e[93;40m'
br_blue='\e[94;40m'
codeblock='\e[30;100m'

clear

printf "\n$br_yellow INFO:$yellow Checking if script is runnning as ROOT $noformat\n"
if [ `id -u` != '0' ]; then
    printf "$br_red RESULT:$red ROOT privileges not found. ROOT privileges are required for this script.\n"
    exit
else
    printf "$br_green RESULT:$green You are ROOT. $noformat\n"
fi
set -v
cd /
set +v
printf "\n$br_yellow INFO:$yellow Appending $codeblock PasswordAuthentication yes $yellow to$br_blue /etc/ssh/ssh_config $noformat"
sleep 0.5
set -v
echo "PasswordAuthentication yes" >> /etc/ssh/ssh_config
set +v
printf "$br_green ...done!\n"

printf "\n$br_yellow INFO:$yellow Appending $codeblock PasswordAuthentication yes $yellow to$br_blue /etc/ssh/sshd_config $noformat"
sleep 0.5
set -v
echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config
set +v
printf "$br_green ...done! $noformat\n"

printf "\n$br_yellow INFO:$yellow Replacing$br_blue /etc/ssh/sshd_config.d/60-cloudimg-settings.conf$yellow with one that contains $codeblock PasswordAuthentication yes  $noformat"
sleep 0.5
set -v
rm /etc/ssh/sshd_config.d/60-cloudimg-settings.conf
echo "PasswordAuthentication yes" > /etc/ssh/sshd_config.d/60-cloudimg-settings.conf
set +v
printf "$br_green ...done! $noformat\n"

printf "\n$br_red WARNING:$red Rebooting in 5 seconds!\n"
sleep 1
printf " ....4\n"
sleep 1
printf " ...3\n"
sleep 1
printf " ..2\n"
sleep 1
printf " .1\n"
sleep 1
reboot now