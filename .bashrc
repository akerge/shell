# shell profile preferences

PATH="/usr/local/bin:/usr/bin:/bin"
# ^ this should be idempotent

RED='\[\033[31m\]'
BOLD_RED='\[\033[1;31m\]'
YELLOW='\[\033[33m\]'
GREEN='\[\033[32m\]'
BLUE='\[\033[01;34m\]'
BOLD_BLUISH='\[\033[01;32m\]'
NORMAL='\[\033[00m\]'

USR='\u'
TIME='\t'
PWD='\w'
DIR='\W'
RIGHTS='\$'
RESET='\[$(tput sgr0)\]'

# TODO: add install script for necessary applications (snap, slack, etc.)
# NOTES:
#  * bash 4.4.12 on Debian doesn't really like \e as an escape character

if [ $(id -u) -eq 0 ]; then
    # apostrophes work within quotation marks.
    PS1="$NORMAL\t·$BOLD_RED\u@\h$NORMAL·$GREEN$DIR·$NORMAL\$ $RESET"
else
    PS1="$GREEN\t$NORMAL·$BOLD_BLUISH\u@\h$NORMAL·$BLUE$DIR$NORMAL·\$ $RESET"
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
