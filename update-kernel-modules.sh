#!/bin/bash

#colorcodes
red='\e[31m'
green='\e[32m'
yellow='\e[33m'
br_red='\e[91m'
br_green='\e[92m'
br_yellow='\e[93m'
codeblock='\e[30;100m'

# This is so the ZigBee USB kernel drivers will be available to the system to be used in the zigbee2mqtt container.

printf "\n$br_yellow INFO:$yellow Checking if script is runnning as ROOT \n"
if [ `id -u` != '0' ]; then
    printf "$br_red RESULT:$red ROOT privileges not found. ROOT privileges are required for this script.\n"
    exit
else
    printf "$br_green RESULT:$green You are ROOT.\n"
fi

printf "\n$br_yellow INFO:$yellow Now installing linux-modules-extra based on the output of$codeblock uname -r \n"
sleep 2
kernver="$(uname -r)"
printf "\n$yellow Current kernel version is$codeblock $kernver \n"
sleep 2
nala install linux-modules-extra-$kernver
printf "\n$br_green Module install/upgrade is complete.$br_red You should now reboot! \n"