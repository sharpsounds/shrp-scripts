#!/bin/bash

#colorcodes
noformat='\e[0;40m'
black='\e[30;40m'
red='\e[31;40m'
green='\e[32;40m'
yellow='\e[33;40m'
blue='\e[34;40m'
magenta='\e[35;40m'
cyan='\e[36;40m'
grey='\e[90;40m'
br_red='\e[91;40m'
br_green='\e[92;40m'
br_yellow='\e[93;40m'
br_blue='\e[94;40m'
br_magenta='\e[95;40m'
br_cyan='\e[96;40m'
bg_off='\e[40m'
bg_red='\e[41m'
bg_green='\e[42m'
bg_yellow='\e[43m'
bg_blue='\e[44m'
bg_magenta='\e[45m'
bg_cyan='\e[46m'
bg_grey='\e[100m'
bg_br_red='\e[101m'
bg_br_green='\e[102m'
bg_br_yellow='\e[103m'
bg_br_blue='\e[104m'
bg_br_magenta='\e[105m'
bg_br_cyan='\e[106m'

codeblock='\e[30;100m'

clear
printf "\n$magenta Installing Nala because I like it!$noformat \n"
sleep 1
apt install -y nala

printf "\n$magenta Configuring prerequisites for Docker!$noformat \n"
sleep 1
mkdir -m 0755 -p /etc/apt/keyrings
sleep 1
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev\null

printf "\n$magenta Updating system!$noformat \n"
sleep 1
nala update
nala upgrade -y
nala full-upgrade -y

printf "\n$magenta Installing some packages like!$noformat \n"
sleep 1
nala install -y qemu-guest-agent ncdu btop docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

printf "\n$magenta Installing$codeblock lazydocker!$noformat \n"
sleep 1
curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash
mv ~/.local/bin/lazydocker /bin/lazydocker

printf "\n$magenta Installing extra kernel modules!$noformat \n"
sleep 1
curl https://raw.githubusercontent.com/sharpsounds/shrp-scripts/main/update-kernel-modules.sh | bash

printf "\n$magenta Cleaning up!$noformat \n"\
nala clean
nala autoremove
nala autopurge

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
# reboot now