# Personal shell preferences.
# Created by Artur Kerge
# Sometime in 2019 AD
# https://github.com/akerge/shell/

PATH="/usr/local/bin:/usr/bin:/bin"
# ^ this should be idempotent

red='\[\033[31m\]'
bold_red='\[\033[1;31m\]'
yellow='\[\033[33m\]'
purple='\[\033[1;35m\]'
green='\[\033[32m\]'
blue='\[\033[01;34m\]'
bold_bluish='\[\033[01;32m\]'
normal='\[\033[00m\]'

usr='\u'
clock='\t'
location='\W'
rights='\$'
default='\[$(tput sgr0)\]'

# following prepends 24h time before command execution
#PROMPT_COMMAND='date +%T'
# with trap prints time twice.
#PROMPT_COMMAND='trap "date +%T" DEBUG'

# TODO: 
#  * add install script for necessary applications
#    * snap [or flatpak or better] for slack
#    * neofetch
#  * show time after command has been entered. Either with PROMPT_COMMAND or bash-preexex
#    https://github.com/rcaloras/bash-preexec/blob/master/bash-preexec.sh
# NOTES:
#  * bash 4.4.12 on Debian doesn't really like \e as an escape character
input=""
if [ $(id -u) -eq 0 ]; then
    # apostrophes work within quotation marks.
    PS1="$normal·$bold_red\u@\h$normal·$green$location·$normal\$ $default"
else
    PS1="$normal·$bold_bluish\u@$purple\h$normal·$blue$location$normal·\$ $default"
fi

HISTSIZE=1000
HISTFILESIZE=2000

alias ll="ls -lah"
alias lt="ls -laht"
alias fd="cd -" # change to previous directory cd-d from
alias cdr='cd -'
# Below is from https://github.com/aashutoshrathi/awesome-bashrc#fast-upwards-navigation
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../'
alias cdp='cd -P' # not this tho
# this is prolly also copied from the link before
# git
alias clone='git clone'
alias commit='git commit -m'
alias push='git push'
alias status='git status'
alias log='git log'
alias reflog='git reflog'
alias logref='git log --graph --decorate --oneline $(git rev-list -g --all)'
alias pull='git pull'
alias add='git add'
alias resetsoft='git reset --soft '
alias resethard='git reset --hard '
# apt
alias update='sudo apt update'
alias list='apt list --upgradable'
alias upgrade='sudo apt upgrade'
alias inst='sudo apt install'
# time
alias now='date +"%T"'
alias t='date +"%T"'

trap "date +%T" DEBUG
