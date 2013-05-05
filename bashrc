# If not running interactively, don't do anything
[[ $- != *i* ]] && return


#prompt
#PS1="\[\e[32m\][\u@\h \W]\$\[\e[0m\] "
normal="\[\e[0m\]"
bold="\[\e[1m\]"
white="\[\e[37m\]"
black="\[\e[30m\]"
green="\[\e[32m\]"
PS1="$green\w $normal"


#aliases
alias q='exit'
alias ls='ls --color=auto'
alias rip='abcde -d /dev/sr0 -o flac'
alias gcc='gcc -std=c99'
alias gote='gnome-terminal'
alias vih='vim +h +on'
alias cmus='tmux new -As cmus cmus'
function cdgo() { cd ~/go/src/github.com/luksen/$1 }


set -o vi
export HISTIGNORE="&"

export PATH+=:~/tools
export EDITOR="vim"
export GOPATH=~/go:$GOPATH

export LESS="-R"
eval $(lesspipe.sh)
