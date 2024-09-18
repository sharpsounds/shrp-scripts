#!/bin/bash

clear
printf "\n hello world. \n"
printf "\n Installing Nala because I like it! \n"
apt install -y nala

printf "\n Configuring prerequisites for Docker! \n"
mkdir -m 0755 -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev\null

printf "\n Updating system! \n"
nala update
nala upgrade -y

printf "\n Installing some packages like!"
nala install -y qemu-guest-agent ncdu btop docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

printf "\n Installing lazydocker! \n"
curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash
mv ~/.local/bin/lazydocker /bin/lazydocker

printf "\n Installing extra kernel modules! \n"
curl https://raw.githubusercontent.com/sharpsounds/shrp-scripts/main/update-kernel-modules.sh | bash

# reboot now