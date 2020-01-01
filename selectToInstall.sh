#!/bin/bash
#
######################################################
# Script install all or select applications to install
######################################################

# Array of applications to be installed via apt
apts=(neofetch glances)

# print function for easier reading
function printElement(){
	printf "Install $1? [Y/n] "
}

# global array
declare selectedToInstall
#selectedToInstall=()

# loop over array
for a in ${apts[*]}
        do
                printElement $a 
                read response
		case $response in
			[nN])
				echo not adding
				break
				;;
			*)
				selectedToInstall+="$a"
				echo adding $a
				;;
		esac
		printf "\n"
        done

# Checking, what has been selected
echo selectedToInstall array:
echo ${selectedToInstall[@]}
