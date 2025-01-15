#!/bin/bash

#colorcodes
noformat='\e[0;40m'
red='\e[31;40m'
magenta='\e[35;40m'
br_red='\e[91;40m'
br_magenta='\e[95;40m'
codeblock='\e[30;100m'

timedatectl

clear
printf "\n$magenta Setting Timezone$noformat \n"
set -x
sudo timedatectl set-timezone Australia/Brisbane
set +x

timedatectl

clear
printf "\n$magenta Installing Nala because I like it!$noformat \n"
set -x
apt install -y nala
set +x

printf "\n$magenta Configuring prerequisites for Docker!$noformat \n"
set -x
mkdir -m 0755 -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
set +x

printf "\n$magenta Updating system!$noformat \n"
set -x
nala update
nala upgrade -y
nala full-upgrade -y
set +x

printf "\n$magenta Installing some packages like!$noformat \n"
set -x
nala install -y ncdu btop lnav qemu-guest-agent docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
set +x

printf "\n$magenta Installing $codeblock lazydocker! $noformat\n"
set -x
curl --silent --show-error https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash
mv ~/.local/bin/lazydocker /bin/lazydocker
set +x

printf "\n$magenta Installing extra kernel modules!$noformat \n"
curl --silent --show-error https://raw.githubusercontent.com/sharpsounds/shrp-scripts/main/update-kernel-modules.sh | bash

printf "\n$magenta Setting Docker download concurrency to 20 $noformat\n"
set -x
echo $'{\n    "max-concurrent-uploads": 3,\n    "max-concurrent-downloads": 20\n}' >> /etc/docker/daemon.json
sudo service docker restart
set +x

printf "\n$magenta Cleaning up!$noformat \n"
set -x
nala clean
nala autoremove
nala autopurge
set +x

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
