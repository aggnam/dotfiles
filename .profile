# $OpenBSD: dot.profile,v 1.8 2022/08/10 07:40:37 tb Exp $

PATH=$HOME/bin:$HOME/go/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/X11R6/bin:/usr/local/bin:/usr/local/sbin
export PATH HOME TERM
export ENV="$HOME/.kshrc"
export LC_CTYPE=en_US.UTF-8
export NO_COLOR=1
export NNN_OPENER="$HOME/.config/nnn/plugins/nuke"
export HISTFILE=/dev/null
export LESSHISTFILE=/dev/null
export MYSQL_HISTFILE=/dev/null
export PSQL_HISTORY=/dev/null
export SQLITE_HISTORY=/dev/null

if [ -n "$RUN_AND_RETURN" ]; then
    "$RUN_AND_RETURN"
    exit
fi
