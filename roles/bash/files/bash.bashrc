# System-wide .bashrc file for interactive bash(1) shells.

# To enable the settings / commands in this file for login shells as well,
# this file has to be sourced in /etc/profile.

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s histappend
shopt -s checkwinsize

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# If this is an xterm set the title to user@host:dir
case "$TERM" in
screen*|xterm*|rxvt*)
        PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${debian_chroot:+($debian_chroot)}${PWD}\007"'
        ;;
esac

tput=/usr/bin/tput
if [ -x $tput ] && $tput setaf 1 >&/dev/null; then
        PS1='${debian_chroot:+($debian_chroot)}<$?>\h \[\033[36m\]\W \[\033[30;47m\]\!\[\033[0m\]\$ '
        alias ls='ls --color=auto'
        alias grep='grep --colour=auto'
else
        PS1='${debian_chroot:+($debian_chroot)}<$?>\h \W \!\$ '
fi
unset tput

alias ll="ls -l"
alias lt="ll -rt"
alias lss="ls -shSr"
alias m='${PAGER}'
alias px="ps xww"
alias pm="ps auxk -vsz"
alias where="type -all"

export PAGER="/usr/bin/less"
export EDITOR="/usr/bin/vi"

# enable bash completion in interactive shells
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi
