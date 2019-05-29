#!/bin/bash
#title           :missingSlackIcon.sh
#description     :This script will add a Slack icon when it's missing.
#author		 :akerge
#date            :2019-5-29
#version         :0.1
#usage		 :./missingSlashIcon.sh
#==============================================================================
sudo echo "StartupWMClass=Slack" >> /var/lib/snapd/desktop/applications/slack_slack.desktop
