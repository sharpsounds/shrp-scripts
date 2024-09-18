#!/bin/bash
echo now installing linux-modules-extra based on the output of uname -r!
kernver="$(uname -r)"
sudo nala install linux-modules-extra-$kernver