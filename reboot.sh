#!/bin/bash
#colorcodes
red='\e[31;40m'
br_red='\e[91;40m'

secs=$((5))
while [ $secs -gt 0 ]; do
   echo -ne "$secs\033[0K\r"
   sleep 1
   : $((secs--))
done