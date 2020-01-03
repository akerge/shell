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

# global arrays
declare selectedToInstallApts
declare selectedToInstallSnaps

# loop over array
function loopOverApps(){
arrToLoopOver=$1[@]
echo arrToLoopOver: $arrToLoopOver
echo \$2: $2
arrToAddTo=$2
echo arrToAddTo: $arrToAddTo
# exclamation marks expands variable
for a in "${!arrToLoopOver}";
        do
                printElement $a 
                read response
		case $response in
			[nN])
				echo not adding
				break
				;;
			*)
				$2+=('$a')
				echo adding $a
				;;
		esac
		printf "\n"
        done
}

# show applications in apts array and add chosen apps to another array
loopOverApps "apts" "selectedToInstallApts"
# Checking, what has been selected
echo selectedToInstallApts array:
echo ${selectedToInstallApts[@]}
