#!/bin/bash
#
######################################################
# Script install all or select applications to install
######################################################

# Array of applications to be installed via apt
apts=("neofetch" "glances")

# print function for easier reading
function printElement(){
	printf "Install $1? [Y/n] "
}

for ((a=0; a<"${#apts[@]}"; a++));
        do
                printElement ${apts[a]}
                printf "\n"
        done

