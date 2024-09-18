#!/bin/bash

clear
printf "\n hello world. \n"
printf "\n Installing Nala because I like it! \n"
sudo apt install -y nala

printf "\n Configuring prerequisites for Docker! \n"
sudo mkdir -m 0755 -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev\null

printf "\n Updating system! \n"
sudo nala update
sudo nala upgrade -y

printf "\n Installing packages: \n - qemu-guest-agent \n - nfs-commonncdu \n - btop \n - docker-ce \n - docker-ce-cli \n - containerd.io \n - docker-buildx-plugin \n - docker-compose-plugin \n"
sudo nala install -y qemu-guest-agent nfs-common ncdu btop docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

printf "\n Installing lazydocker! \n"
sudo curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash
sudo mv ~/.local/bin/lazydocker /bin/lazydocker

printf "\n Installing extra kernel modules! \n"
sudo curl https://raw.githubusercontent.com/sharpsounds/shrp-scripts/main/update-kernel-modules.sh | bash

sudo reboot now