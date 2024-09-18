#!/bin/bash
# this is so that the ZigBee USB kernel drivers will be available to the system to be used in the zigbee2mqtt container
printf Now installing linux-modules-extra based on the output of uname -r!
kernver="$(uname -r)"
printf Current kernel version is $kernver!
sudo nala install linux-modules-extra-$kernver
printf Module install/upgrade is complete. You should now reboot!