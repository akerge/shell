#!/bin/bash
#
######################################################
# Script install all or select applications to install
######################################################

# Array of applications to be installed via apt
apts=("neofetch" "glances" "vim")
snaps=("spotify" "slack --classic") 

# print function for easier reading
function printElement(){
	printf "Install $1? [Y/n] "
}

function printArray(){
	local -n ref="$1"
	for k in "${ref[@]}";
		do 
		echo " $k"
		done
	
}
# global arrays
declare installApts
declare installSnaps

function loopOverApps(){
# loop over array
# ===============
# use `local -n` instead as per
# https://stackoverflow.com/a/29379084
# $1 array to loop over
# $2 array to add to if user wants to install that app
	echo " this is \$1: $1"
	local -n ref="$1"
	for a in "${ref[@]}";
        	do
         		printElement $a 
               		read response
			case $response in
				[nN])
					echo " not adding $a"
					;;
				*)
					echo " adding $a"
					arrToAddTo+=" $a"
					;;
			esac
			printf "\n"
        	done
	if [ $1 == "apts" ]; then
		installApts=( "${arrToAddTo[@]}" )
		echo " arrToAddTo: ${arrToAddTo[@]}"
	elif [ $1 == "snaps" ]; then
		installSnaps=( "${arrToAddTo[@]}" )
	else
		echo " THIS SHOULD NOT HAPPEN"
	fi
	unset localArray
	unset arrToAddTo
	unset arrToLoopOver
}

# show applications in apts array and add chosen apps to another array
loopOverApps "apts" 
loopOverApps "snaps" 
echo "Following have been selected to install:"
printArray "apts"
printArray "snaps"
printf "\nIs this correct? [Y/n] "
read YN
case $YN in
	[nN])
		echo -e "\nPlease re-run script to re-select applications to install."
		echo " bash $0"
		;;
	*)
		echo "Here will be install function"
		;;
esac

