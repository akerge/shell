#!/bin/bash -   
#title          :update-bashrc.sh
#description    :Teensy script to update .bashrc
#author         :Artur Kerge
#date           :2019-06-17
#version        :0.1    
#usage          :./update-bashrc.sh
#notes          :       
#bash_version   :4.4.12(1)-release
#============================================================================

rm ~/.bashrc
wget --output-document ~/.bashrc https://github.com/akerge/shell/raw/master/.bashrc
