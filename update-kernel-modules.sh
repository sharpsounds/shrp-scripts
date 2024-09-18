#!/bin/bash

#colorcodes
red='\e[31;40m'
green='\e[32;40m'
yellow='\e[33;40m'
br_red='\e[91;40m'
br_green='\e[92;40m'
br_yellow='\e[93;40m'
codeblock='\e[30;100m'

# This is so the ZigBee USB kernel drivers will be available to the system to be used in the zigbee2mqtt container.

printf "\n$br_yellow INFO:$yellow Checking if script is runnning as ROOT \n"
if [ `id -u` != '0' ]; then
    printf "$br_red RESULT:$red ROOT privileges not found. ROOT privileges are required for this script.\n"
    exit
else
    printf "$br_green RESULT:$green You are ROOT.\n"
fi

printf "\n$br_yellow INFO:$yellow Now installing linux-modules-extra based on the output of $codeblock uname -r \n"
sleep 2
kernver="$(uname -r)"
printf "\n$yellow Current kernel version is$codeblock $kernver \n"
sleep 2
nala install -y linux-modules-extra-$kernver
printf "\n$br_green Module install/upgrade is complete.$br_red You should now reboot! \n"