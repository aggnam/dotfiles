# $OpenBSD: dot.profile,v 1.8 2022/08/10 07:40:37 tb Exp $
#
# sh/ksh initialization

PATH=$HOME/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/X11R6/bin:/usr/local/bin:/usr/local/sbin
export PATH HOME TERM

export LANG=en_US.UTF-8
export LANGUAGE=en_US

export NO_COLOR=1
export VISUAL=vi
export WORDCHARS='*?_[]~=&;!#$%^(){}'
set -o emacs

export PATH=${PATH}:$HOME/.local/bin

# prompt
PS1="\h:\w$ "

# aliases
alias cp="cp -i"
alias gd="git diff"
alias gs="git status"
alias hg="history | grep "
alias jobs="jobs -p"
alias k9="kill -9 %1"
alias ll="ls -alF"
alias ltr="ls -alFtr"
alias ls="ls -aF"
alias mv="mv -i"
alias offline_mutt="mutt -R -F ~/.muttrc.offline"
alias ph="ps auwwx | head"
alias pg="ps auwwx | grep -i -e ^USER -e "
alias publicip="curl -w '\n' -s http://ifconfig.me"
alias rg="rg --color=never -N -z"
alias telnet="telnet -K"
alias tm="tail -f /var/log/messages"
