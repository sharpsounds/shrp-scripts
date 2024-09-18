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

clear
printf "\n Installing Nala because I like it! \n"
sleep 2
apt install -y nala

printf "\n Configuring prerequisites for Docker! \n"
sleep 2
mkdir -m 0755 -p /etc/apt/keyrings
sleep 2
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev\null

printf "\n Updating system! \n"
sleep 2
nala update
nala upgrade -y

printf "\n Installing some packages like!"
sleep 2
nala install -y qemu-guest-agent ncdu btop docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

printf "\n Installing lazydocker! \n"
sleep 2
curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash
mv ~/.local/bin/lazydocker /bin/lazydocker

printf "\n Installing extra kernel modules! \n"
sleep 2
curl https://raw.githubusercontent.com/sharpsounds/shrp-scripts/main/update-kernel-modules.sh | bash

# reboot now