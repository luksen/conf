# If not running interactively, don't do anything
#[[ $- != *i* ]] && return


#prompt
PS1="\[\e[32m\][\u@\h \W]\$\[\e[0m\] "


shopt -s expand_aliases
#aliases
alias q='exit'
alias ls='ls --color=auto'
alias rip='abcde -d /dev/sr0 -o flac'
alias gcc='gcc -std=c99'
alias gote='gnome-terminal'


set -o vi
export HISTIGNORE="&"

export EDITOR="vim"
export GOPATH+=:~/go
