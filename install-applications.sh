#!/bin/bash

apps="neofetch snapd texlive texstudio python3 python3-pip vim" 
snaps=("spotify" "atom --classic" "slack --classic")
dash="======"

printf "This script will update and upgrade apt and install the following:\n\n"
printf "apt:\n$dash\n"
printf "$apps\n\n"
printf "snaps:\n$dash\n"

state="echo"
snapit="sudo snap install "
function floop() {
  for ((i=0; i<${#snaps[@]}; i++));
    do
      eval "$1 ${snaps[i]}"
    done
}

floop "$state"

printf "\nContinue? [Y/n]"
read RESPONSE
case $RESPONSE in
  [nN])
    exit
    ;;
  *) 
    printf "\n\nUpdating and upgrading...\n\n"
    sudo apt update && sudo apt upgrade
    sudo apt install $apps 
    floop "$snapit"
    printf "\nDone!\n"
    ;;
esac
#TODO
# implement exit codes and print message regarding if successful or not
# check if snapd exists
#
# Varia
## speedreading
#   https://github.com/xypiie/spread0r flashes text
#   https://poppler.freedesktop.org/ pdf to txt converter, requires
#   cmake
