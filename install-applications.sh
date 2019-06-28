#!/bin/bash

echo "This script will update and install following"
echo "neofetch\nsnap"
echo "\nsnap will install:\n slack\n spotify\n atom"
echo "Press Ctrl-C to cancel or do nothing for 12s to continue."
read -t 12 -p " Continuing with install..."
sudo apt update && sudo apt upgrade
sudo apt install neofetch snapd
sudo snap install slack --classic
sudo snap install spotify
sudo snap install atom --classic
echo "\nDone!\n"
