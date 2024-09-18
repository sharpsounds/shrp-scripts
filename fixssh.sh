#!/bin/bash
cd /
clear
printf "\n Appending PasswordAuthentication yes to /etc/ssh/ssh_config! \n"
sleep 2
echo "PasswordAuthentication yes" >> /etc/ssh/ssh_config

printf "\n Appending PasswordAuthentication yes to /etc/ssh/sshd_config! \n"
sleep 2
echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config

printf "\n Replacing /etc/ssh/sshd_config.d/60-cloudimg-settings.conf with one that contains PasswordAuthentication yes! \n"
sleep 2
rm /etc/ssh/sshd_config.d/60-cloudimg-settings.conf
echo "PasswordAuthentication yes" > /etc/ssh/sshd_config.d/60-cloudimg-settings.conf

printf "\n Rebooting! \n"
sleep 2
# reboot now