# If not running interactively, don't do anything
[[ $- != *i* ]] && return


# prompt
normal="\[\e[0m\]"
green="\[\e[32m\]"
violet="\[\e[35m\]"
[[ -n $SSH_TTY ]] && green="$violet"
PS1="$green\w $normal"


# aliases
alias q='exit'
alias v='vim'
alias g='git'
alias ls='ls --color=auto'
alias rip='abcde -d /dev/sr0 -o flac'
alias gcc='gcc -std=c99'
alias gote='gnome-terminal'
alias vih='vim +h +on'
alias cmus='tmux new -As cmus cmus'
alias feh='feh -.'
alias pdflatex='pdflatex -halt-on-error'


# shortcut to go sources on github with completion
godir="$HOME/go/src/github.com/luksen/"
function cdgo() { cd $godir/$1; }
function _cdgo() { COMPREPLY=( $(compgen -W "$(ls -Q $godir)" "$2") ); }
complete -F _cdgo cdgo

# note taking
notedir="$HOME/notes/"
function note() {
	if [ -z $1 ]
	then
		vim "$notedir/misc.mkdn"
	else
		vim "$notedir/${1}.mkdn"
	fi
	d=$(pwd)
	cd $notedir
	git up
	cd $d
}
function _note() {
	notes=$(ls -t -Q $notedir -I archiv -I config.sh -I notes.vim);
	COMPREPLY=( $(compgen -W "${notes[@]//.mkdn/}" "$2") );
}
complete -F _note note

# helper for cleaning up
function big() {
	echo -e "size\tlast modified\t\tfile"
	echo -e "‾‾‾‾\t‾‾‾‾‾‾‾‾‾‾‾‾‾\t\t‾‾‾‾"
	du -sh --time $1* | sort -h | tail
}


# settings
set -o vi
export HISTIGNORE="&"

export PATH+=:~/tools
export EDITOR="vim"

export GOPATH=~/go:$GOPATH
export GOMAXPROCS=4

export LESS="-R"
eval $(lesspipe.sh)
