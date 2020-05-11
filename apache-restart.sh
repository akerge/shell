#!/bin/bash

hostname=$(hostname)
name=${hostname:-Host_without_hostname}
hostname_len=${#hostname}
text="Apache restart!"
txt_len=${#text}

underline(){
# takes argument ($1) as input to underline
  arg=$1
  echo $1
  len=${#arg}
  for ((z=0; z<$len; z+=1));do printf "=";done
  printf "\n"
}

echo "$hostname $text"
len=$(($hostname_len+$txt_len))
for ((z=0; z<$len+1; z+=1));do printf "=";done
printf "\n"
sudo systemctl stop httpd
echo "Wait 20 sec..."
for t in {1..20}
do
  printf "."
  sleep 1
done
dun="Done! Restarting..."
underline "$dun"
sudo systemctl start httpd
resa="Restart tehtud!"
underline "$resa"
status="Apache status:"
underline "$status"
sudo systemctl status httpd
