#!/bin/bash

hostname=$(hostname)
apacheresa="Apache restart!"
comb="$hostname $apacheresa"
underline(){
  arg=$1
  echo $1
  len=${#arg}
#  echo "arg: $1"
#  echo "len: $len"
  for ((z=0; z<$len; z+=1));do printf "=";done
  printf "\n"
}
underline "$comb"
