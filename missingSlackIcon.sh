#!/bin/bash
#title           :missingSlackIcon.sh
#description     :This script will add a Slack icon when it's missing.
#author		 :akerge
#date            :2019-5-29
#version         :0.1
#usage		 :./missingSlashIcon.sh
#==============================================================================

if (( $EUID != 0 )); then # this will check if user is in sudoers.
	  # From man-pages: "Expands the effective user ID of current user"
    echo "Please run as sudo"
    exit
else
    sudo echo "StartupWMClass=Slack" >> /var/lib/snapd/desktop/applications/slack_slack.desktop
    echo "After Slack restart icon should return to default."
    echo "Have a nice day!"
fi
