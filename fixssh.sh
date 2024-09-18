#!/bin/bash
red='\e[1;31m%s\e[0m\n'                                                                                                                                                      
green='\e[1;32m%s\e[0m\n'
yellow='\e[1;33m%s\e[0m\n'
clear

printf "$green" "\n INFO: Checking if script is runnning as ROOT \n"
if [ `id -u` != '0' ]; then
    printf $red "Root privileges are required for this script."
else
    printf $green "You are root."
fi

cd /
printf $green "\n INFO: Appending PasswordAuthentication yes to /etc/ssh/ssh_config! \n"
sleep 2
echo "PasswordAuthentication yes" >> /etc/ssh/ssh_config

printf $green "\n INFO: Appending PasswordAuthentication yes to /etc/ssh/sshd_config! \n"
sleep 2
echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config

printf $green "\n INFO: Replacing /etc/ssh/sshd_config.d/60-cloudimg-settings.conf with one that contains PasswordAuthentication yes! \n"
sleep 2
rm /etc/ssh/sshd_config.d/60-cloudimg-settings.conf
echo "PasswordAuthentication yes" > /etc/ssh/sshd_config.d/60-cloudimg-settings.conf

printf $red "\n INFO: Rebooting now! \n"
sleep 2
# reboot now