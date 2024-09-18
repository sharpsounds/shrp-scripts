First run 
```curl https://raw.githubusercontent.com/sharpsounds/shrp-scripts/main/fixssh.sh | sudo bash```
to fix ssh keys being the only way in

then SSH in and run
```
curl https://raw.githubusercontent.com/sharpsounds/shrp-scripts/main/ubuntu24.04-cloudinit-postinstall.sh | sudo bash
```
to install nala, docker, lazydocker and a bunch of guest tools
