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
b_red='\e[91m'
b_green='\e[92m'
b_yellow='\e[93m'
b_blue='\e[94m'
b_magenta='\e[95m'
b_cyan='\e[96m'

# This is so the ZigBee USB kernel drivers will be available to the system to be used in the zigbee2mqtt container.
printf "\n Now installing linux-modules-extra based on the output of uname -r! \n"
sleep 2
kernver="$(uname -r)"
printf "\n Current kernel version is $kernver! \n"
sleep 2
nala install linux-modules-extra-$kernver
printf "\n Module install/upgrade is complete. You should now reboot! \n"