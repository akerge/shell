# shell profile preferences

PATH="/usr/local/bin:/usr/bin:/bin"

RED='\e[31m'
BOLD_RED='\e[1;31m'
YELLOW='\e[33m'
GREEN='\e[32m'
BLUE='\e[01;34m'
BOLD_BLUISH='\e[01;32m'
NORMAL='\e[00m'
USR='\u'
TIME='\t'
PWD='\w'
DIR='\W'
RIGHTS='\$'
# TODO: add install script for necessary applications (snap, slack, etc.)
if [ $(id -u) -eq 0 ]; then
# apostrophes work within quotation marks. if uncommented one fails, try commented one.
#  PS1='\[\033[33m\]\t\[\033[m\]·\[\033[01;31m\]\u@\h\[\033[00m\]·\[\033[01;34m\]\W\[\033[00m\]·\$ '
#  PS1="\e[00m\t·\e[1;31m\u@\h\e[00m·\$ "
  PS1="\[\033[00m\]\t·\[\033[1;31m\]\u@\h\[\033[00m\]·\$ "
#  PS1="$NORMAL\t·$BOLD_RED\u@\h$NORMAL·\$ "
else
  PS1="\[\033[32m\]\t\[\033[m\]·\[\033[01;32m\]\u@\h\[\033[00m\]·\[\033[01;34m\]\W\[\033[00m\]\$ "
  #  PS1="\[\033[32m\]\t\[\033[m\]·\[\033[01;32m\]\u@\h\[\033[00m\]·\[\033[01;34m\]\W\[\033[00m\]\$ "
  #  PS1="\e[32m\t\e[m·\e[01;32m\u@\h\e[00m·\e[01;34m\W\e[00m·\$ "
  #PS1="$GREEN\t$NORMAL·$BOLD_BLUISH\u@\h$NORMAL·$BLUE\W$NORMAL·\$ "

HISTSIZE=1000
HISTFILESIZE=2000

alias ll='ls -lah'
alias lt='ls -laht'
