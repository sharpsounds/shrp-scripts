#!/bin/bash
set -x

#colorcodes
noformat='\e[0;40m'
red='\e[31;40m'
magenta='\e[35;40m'
br_red='\e[91;40m'
br_magenta='\e[95;40m'
codeblock='\e[30;100m'

clear
printf "\n$magenta Installing Nala because I like it!$noformat \n"
apt install -y nala

printf "\n$magenta Configuring prerequisites for Docker!$noformat \n"
mkdir -m 0755 -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

printf "\n$magenta Updating system!$noformat \n"
nala update
nala upgrade -y
nala full-upgrade -y

printf "\n$magenta Installing some packages like!$noformat \n"
nala install -y qemu-guest-agent ncdu btop docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

printf "\n$magenta Installing $codeblock lazydocker! $noformat\n"
curl --silent --show-error https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash
mv ~/.local/bin/lazydocker /bin/lazydocker

printf "\n$magenta Installing extra kernel modules!$noformat \n"
curl --silent --show-error https://raw.githubusercontent.com/sharpsounds/shrp-scripts/main/update-kernel-modules.sh | bash

printf "\n$magenta Cleaning up!$noformat \n"
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
reboot now