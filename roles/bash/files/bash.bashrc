# System-wide .bashrc file for interactive bash(1) shells.

# To enable the settings / commands in this file for login shells as well,
# this file has to be sourced in /etc/profile.

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

PROMPT_DIRTRIM=2
HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s histappend
shopt -s checkwinsize

# Identify chroot environment
if [ -z "$chroot" ] && [ -r /etc/debian_chroot ]; then
	chroot="($(cat /etc/debian_chroot))"
fi

# Set title of graphical terminal window
case "$TERM" in
screen*|xterm*|rxvt*)
	PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}: ${chroot}${PWD/#$HOME/\~}\007"'
        ;;
esac

# Set shell prompt, with color if available
tput=/usr/bin/tput
if [ -x $tput ] && $tput setaf 1 >&/dev/null; then
        PS1='${chroot}<$?>\h \[\033[36m\]\w \[\033[30;47m\]\!\[\033[0m\]\$ '
        alias ls='ls --color=auto'
        alias grep='grep --colour=auto'
else
        PS1='${chroot}<$?>\h \w \!\$ '
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

# Symlink ssh agent socket to standard place
if [[ ! -S ~/.ssh/agent.sock && -S "$SSH_AUTH_SOCK" ]]; then
	ln -sf $SSH_AUTH_SOCK ~/.ssh/agent.sock
fi
