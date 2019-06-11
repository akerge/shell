# shell profile preferences

PATH="/usr/local/bin:/usr/bin:/bin"

#RED='\e\[31m\]'
#BOLD_RED='\e\[1;31m\]'
#YELLOW='\e\[33m\]'
#GREEN='\e\[32m\]'
#BLUE='\e\[01;34m\]'
#BOLD_BLUISH='\e\[01;32m\]'
#NORMAL='\e\[00m\]'
RED='\[\033\[31m\]'
BOLD_RED='\[\033\[1;31m\]'
YELLOW='\[\033\[33m\]'
GREEN='\[\033\[32m\]'
BLUE='\[\033\[01;34m\]'
BOLD_BLUISH='\[\033\[01;32m\]'
NORMAL='\[\033\[00m\]'
USR='\u'
TIME='\t'
PWD='\w'
DIR='\W'
RIGHTS='\$'
RESET='\[$(tput sgr0)\]'
# TODO: add install script for necessary applications (snap, slack, etc.)
# Current issues:
#  * prompt gets overwritten
#  * bash 4.4.12 doesn't really like \e as an escape character
if [ $(id -u) -eq 0 ]; then
    # apostrophes work within quotation marks. if uncommented one fails, try commented one.
    #PS1='\[\033[33m\]\t\[\033[m\]·\[\033[01;31m\]\u@\h\[\033[00m\]·\[\033[01;34m\]\W\[\033[00m\]·\$ '
    #PS1="\e[00m\t·\e[1;31m\u@\h\e[00m·\$ "
    #PS1="\[\033[00m\]\t·\[\033[1;31m\]\u@\h\[\033[00m\]·\$ \[$(tput sgr0)\]"
    #PS1="${NORMAL}\t·${BOLD_RED}\u@\h${NORMAL}·\$ "
    PS1="$NORMAL\t·$BOLD_RED\u@\h$NORMAL·\$ $RESET"
else
    #PS1="\[\033[32m\]\t\[\033[m\]·\[\033[01;32m\]\u@\h\[\033[00m\]·\[\033[01;34m\]\W\[\033[00m\]\$ ${RESET}"
    # Below is vanilla prompt, sans debian_chroot;
    #PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]$ '
    #PS1="\[\033[32m\]\t\[\033[00m\]·\[\033[01;32m\]\u@\h\[\033[00m\]·\[\033[01;34m\]\W\[\033[00m\]\$ \[$(tput sgr0)\]"
    #PS1="\e[32m\t\e[m·\e[01;32m\u@\h\e[00m·\e[01;34m\W\e[00m·\$ "
    PS1="${GREEN}\t${NORMAL}·${BOLD_BLUISH}\u@\h${NORMAL}·${BLUE}\W${NORMAL}·\$ ${RESET}"
    #PS1="${GREEN}\t${NORMAL}·${BOLD_BLUISH}\u@\h${NORMAL}·${BLUE}\W${NORMAL}·\$ "
    #PS1="$GREEN\t$NORMAL·$BOLD_BLUISH\u@\h$NORMAL·$BLUE\W$NORMAL·\$ "
fi

HISTSIZE=1000
HISTFILESIZE=2000

alias ll="ls -lah"
alias lt="ls -laht"
