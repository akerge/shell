#!/bin/bash

  arg="$1"
  echo "$arg" 
underline(){
  len=${#arg}
  for ((z=0; z<$len; z+=1));do printf "=";done
  printf "\n"
}
underline "$arg"
