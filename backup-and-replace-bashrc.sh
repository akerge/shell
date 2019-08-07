#!/bin/bash -   
#title          :update-bashrc.sh
#description    :Teensy script to update .bashrc
#author         :Artur Kerge
#date           :2019-06-17
#version        :0.2
#usage          :./backup-and-replace-bashrc.sh
#notes          :       
#bash_version   :4.4.12(1)-release
#============================================================================

mv ~/.bashrc ~/.bashrc.original
cp .bashrc ~/.bashrc
echo "Done."
