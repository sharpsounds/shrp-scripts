#!/bin/bash
#colorcodes
red='\e[31;40m'
br_red='\e[91;40m'

secs=$1
while [ $secs -gt 0 ]; do
  printf "\rsleep: $secs\033[0K"
  sleep 1
  : $((secs--))
done
printf "count \n"