# If not running interactively, don't do anything
[[ $- != *i* ]] && return


#prompt
normal="\[\e[0m\]"
green="\[\e[32m\]"
violet="\[\e[35m\]"
[[ -n $SSH_TTY ]] && green="$violet"
PS1="$green\w $normal"


#aliases
alias q='exit'
alias ls='ls --color=auto'
alias rip='abcde -d /dev/sr0 -o flac'
alias gcc='gcc -std=c99'
alias gote='gnome-terminal'
alias vih='vim +h +on'
alias cmus='tmux new -As cmus cmus'

#shortcut to go sources on github with completion
godir="$HOME/go/src/github.com/luksen/"
function cdgo() { cd $godir/$1; }
function _cdgo() { COMPREPLY=( $(compgen -W "$(ls -Q $godir)" "$2") ); }
complete -F _cdgo cdgo


set -o vi
export HISTIGNORE="&"

export PATH+=:~/tools
export EDITOR="vim"
export GOPATH=~/go:$GOPATH

export LESS="-R"
eval $(lesspipe.sh)
