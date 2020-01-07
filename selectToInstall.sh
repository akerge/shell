#!/bin/bash
#
######################################################
# Script install all or select applications to install
######################################################

# Array of applications to be installed via apt
apts=(neofetch glances vim)

# print function for easier reading
function printElement(){
	printf "Install $1? [Y/n] "
}

# global arrays
declare selectedToInstallApts
declare selectedToInstallSnaps

function loopOverApps(){
# loop over array
# ===============
# use `local -n` instead as per
# https://stackoverflow.com/a/29379084
# $1 array to loop over
# $2 arrayt to add to if user wants to install that app
	local -n localArray
	arrToLoopOver="$1"
	echo " apts content: ${apts[@]}"
	echo " arr len: ${#apts[@]}"
	localArray=( "${apts[@]}" )
	echo " localArray content: ${localArray[@]}"
	echo " localArray len: ${#localArray[@]}"
	echo " arrToLoopOver: ${arrToLoopOver[@]}"
	echo " arr len: ${#arrToLoopOver[*]}"
	arrToAddTo="$2"
	echo " arrToAddTo: $arrToAddTo"
	echo " arr len: ${#arrToAddTo[@]}"
	echo " $arrToAddTo content:"
	echo " ${arrToAddTo[@]}"
	# exclamation marks expands variable
	for a in "${localArray[@]}";
        	do
         		printElement $a 
			localUnit=$a
			echo " \$localUnit: $localUnit"
               		read response
			case $response in
				[nN])
					echo not adding
					echo " ${arrToAddTo[@]}"
				#	break
					;;
				*)
					echo " adding $a"
					local localUnit="$a"
					echo " to array $2"
					echo " \$localUnit: $localUnit"
					echo " \$arrToAddTo: ${arrToAddTo[@]}"
					if [ "${arrToAddTo[@]}" == "" ];then
						arrToAddTo=("${arrToAddTo}" "$localUnit")
						
					else
						arrToAddTo+="$localUnit"
					fi
						echo " \$arrToAddTo: ${arrToAddTo[@]}"
						echo " \$selectedToInstallApts: ${selectedToInstallApts[@]}"
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
