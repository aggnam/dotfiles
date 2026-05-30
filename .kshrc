# ksh interactive

set -o noclobber
set -o nohup
umask 022

PS1="\h:\w$ "
#PS1="% "
TMOUT=0

alias cp='cp -iv'
alias hg='history | grep '
alias jobs='jobs -p'
alias k9='kill -9 %1'
alias ll='ls -alFh'
alias ltr='ls -alFtrh'
alias ls='ls -aF'
alias mv='mv -iv'
alias nsxiv='nsxiv -a'
alias nnn='nnn -e'
alias ph='ps auwwx | head'
alias pg='ps auwwx | grep -i -e ^USER -e '
alias publicip='curl -w "\n" -s http://ifconfig.me'
alias rg='rg --color=never -N -z'
alias telnet='telnet -K'
alias tm='tail -f /var/log/messages'
alias motd='cat ~/files/quran/$((RANDOM%6348+1))'
