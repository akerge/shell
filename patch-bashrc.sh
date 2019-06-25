#!/bin/bash -   
#title          :patch-bashrc.sh
#description    :Update .bashrc when it has been modified after update.
#author         :Artur Kerge
#date           :2019-06-19
#usage          :./update-bashrc.sh
#bash_version   :4.4.12(1)-release
#============================================================================

echo "Pulling updates"
git pull
echo "Diff'ing .bashrc"
diff -u ~/.bashrc .bashrc > bashrc.patch
patch -b ~/.bashrc bashrc.patch
rm bashrc.patch
