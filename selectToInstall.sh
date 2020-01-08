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
# passing array name as argument is from
# https://stackoverflow.com/a/26443029
	local -n ref="$1"
	for k in "${ref[@]}";
		do
			printf "\n * $k"
#		echo -e " $k\n"
		done
}
# global arrays
declare installApts
declare installSnaps

function loopOverApps(){
# loop over array
	echo "Selection from $1"
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
					arrToAddTo+=("$a")
					;;
			esac
			printf "\n"
        	done
	if [ $1 == "apts" ]; then
		installApts=( "${arrToAddTo[@]}" )
	elif [ $1 == "snaps" ]; then
		installSnaps=( "${arrToAddTo[@]}" )
	else
		echo " THIS SHOULD NOT HAPPEN"
	fi
	unset arrToAddTo
}

function installApps(){
	if [ $1 == "apts" ]; then
		install="sudo apt-get -y install "
		local -n ref="installApts"
	elif [ $1 == "snaps" ]; then
		install="sudo snap install "
		local -n ref="installSnaps"
	else
		echo " THIS SHOULD NOT HAPPEN"
	fi
	for l in "${ref[@]}";
		do 
		eval "$install $l"
		done
	
}

loopOverApps "apts" 
loopOverApps "snaps" 
printf "Following have been selected to install:"
printArray "installApts"
printArray "installSnaps"
printf "\nIs this correct? [Y/n] "
read YN
case $YN in
	[nN])
		echo -e "\nPlease re-run script to re-select applications to install or whatever."
		echo " bash $0"
		echo -e "Have a great day!"
		;;
	*)
		installApps "apts"
		installApps "snaps"
		;;
esac

