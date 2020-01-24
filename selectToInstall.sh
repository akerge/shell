#!/bin/bash
#
######################################################
# Script install all or select applications to install
######################################################
# Made by akerge
#
# TODO:
#  * make POSIX compliant

# Array of applications to be installed via apt
apts=("neofetch" "glances" "vim" "curl" "git" "tree" "pwgen" "nmap" "iftop" "nethogs" "chrome-gnome-shell" "meson" "sassc" "libglib2.0-dev" "libxml2-utils" "gparted")
# meson to libxml2-utils are for Yaru shell appearance in tweaks on ubuntu
# https://www.linuxuprising.com/2019/10/how-to-get-dark-gnome-shell-menus-and.html
snaps=("spotify" "slack --classic") 

function printElement(){
# print function for easier reading
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
# loop over array and select application(s) to install
# add the selected application to another array (install apts/snaps)
	echo "Selection from $1:"
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
# sanity check to install all or select apps
	if [[ $1 == "apts" && ! -z $2 ]]; then
		install="sudo apt-get -y install "
		local -n ref="$1"
	elif [[ $1 == "snaps" && ! -z $2 ]]; then
		install="sudo snap install "
		local -n ref="$1"
	elif [ $1 == "apts" ]; then
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

# was annoyed for repetetive lines
function printAll(){
	if [ ! -z $1 ]; then
		printArray "installApts"
		printArray "installSnaps"
	else	
		printArray "apts"
		printArray "snaps"
	fi
}

function loopAll(){
	loopOverApps "apts" 
	loopOverApps "snaps" 
}

function installAll(){
	if [ ! -z $1 ]; then
		echo "Installing all apps"
		installApps "apts" "all"
		installApps "snaps" "all"
	else
		echo installing selected apps
		installApps "apts"
		installApps "snaps"
	fi
}

printf "Install all apps? [Y/n]\n"
printAll
printf "\n\n[Y] to install all, [n] to select what to install. "
read ALL
case $ALL in
	[nN])
		loopAll
		printf "Following have been selected to install:"
		printAll "check"
		printf "\nIs this correct? [Y/n] "
		read YN
		case $YN in
			[nN])
				echo -e "\nPlease re-run script to re-select applications to install or whatever."
				echo " bash $0"
				echo -e "Have a great day!"
				;;
			*)
				installAll
				;;
		esac
		;;
	*)
		installAll "yes"
		;;
esac

