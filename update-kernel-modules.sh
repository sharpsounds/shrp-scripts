#!/bin/bash
# This is so the ZigBee USB kernel drivers will be available to the system to be used in the zigbee2mqtt container.
printf "\n Now installing linux-modules-extra based on the output of uname -r! \n"
kernver="$(uname -r)"
printf "\n Current kernel version is $kernver! \n"
nala install linux-modules-extra-$kernver
printf "\n Module install/upgrade is complete. You should now reboot! \n"