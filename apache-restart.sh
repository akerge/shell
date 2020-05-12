#!/bin/bash
# Why? when there is no `systemctl restart httpd` right given
hostname=$(hostname)
wait_time=5
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

len=$(($hostname_len+$txt_len))
underline "$hostname $text"
sudo systemctl stop httpd
echo "Wait $wait_time sec..."
for ((y=0; y<$wait_time; y+=1))
do
  printf "."
  sleep 1
done
printf "\n"
dun="Done! Restarting..."
underline "$dun"
sudo systemctl start httpd
resa="Restart tehtud!"
underline "$resa"
status="Apache status:"
underline "$status"
sudo systemctl status httpd
