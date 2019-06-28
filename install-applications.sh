#!/bin/bash

printf "This script will update apt and install the following:\n"
printf "\napt\n===\n neofetch\n snap\n git\n"
printf "\nsnap\n====\n slack\n spotify\n atom\n"
printf "\n\n"
read -t 12 -p "\nPress Ctrl-C to cancel or do nothing for 12s to continue...\n"
sudo apt update && sudo apt upgrade
sudo apt install neofetch snapd
sudo snap install slack --classic
sudo snap install spotify
sudo snap install atom --classic
printf "\nDone!\n"
