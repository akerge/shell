# shell profile preferences

PATH="/usr/local/bin:/usr/bin:/bin"
# ^ this should be idempotent

red='\[\033[31m\]'
bold_red='\[\033[1;31m\]'
yellow='\[\033[33m\]'
green='\[\033[32m\]'
blue='\[\033[01;34m\]'
bold_bluish='\[\033[01;32m\]'
normal='\[\033[00m\]'

usr='\u'
clock='\t'
location='\W'
rights='\$'
default='\[$(tput sgr0)\]'

# TODO: 
#  * add install script for necessary applications (snap [or flatpak or better], slack, etc.)
# NOTES:
#  * bash 4.4.12 on Debian doesn't really like \e as an escape character

if [ $(id -u) -eq 0 ]; then
    # apostrophes work within quotation marks.
    PS1="^$normal\t\n·$bold_red\u@\h$normal·$green$location·$normal\$ $default"
else
    PS1="^$green\t\n$normal·$bold_bluish\u@\h$normal·$blue$location$normal·\$ $default"
fi

HISTSIZE=1000
HISTFILESIZE=2000

alias ll="ls -lah"
alias lt="ls -laht"
alias c="cd -"
# Below is from https://github.com/aashutoshrathi/awesome-bashrc#fast-upwards-navigation
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../'
# this is prolly also copied from the link before
alias clone='git clone'
alias commit='git commit -m'
alias push='git push'
alias status='git status'
alias log='git log'
alias pull='git pull'
alias add='git add'
alias cdp='cd -P'
