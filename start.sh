#!/bin/bash

confirm() {
    clear
    echo "lets update your apt repos first!"
    sudo apt update -y
    sudo apt upgrade -y
    clear
    echo "now we will remove some bloatware and install the generic linux kernel"
    sudo apt-get remove python3-awscrt awscli -y
    sudo apt-get autoremove -y
    sudo apt-get install linux-image-amd64 -y
    sudo update-grub
    echo "well, that should be most of it. if you know of anymore things which are included with the debian image open an issue!"
    echo "rebooting, goodbye system :3 (it will be fine after reboot lol)"
    sudo reboot
}

echo "hello there!"
echo "you are currently using build 1.0 of UnAWS"
echo "this script does have a risk to make your system unbootable"
echo "keep a backup of your files before starting this script."
echo -n "are you sure you want to continue? (y/n): "
read -r prompt

if [[ "$prompt" =~ ^[Yy]$ ]]; then
    confirm
else
    echo "exiting..."
    exit 1
fi
