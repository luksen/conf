# If not running interactively, don't do anything
[[ $- != *i* ]] && return


# prompt
function git_dirty() {
	(git status --porcelain 2>/dev/null | grep '.*')>/dev/null && echo '*'
}
function git_branch() {
	git branch --no-color 2>/dev/null | sed '/^[^*]/d' | sed "s/\* \(.*\)/[\1$(git_dirty)] /"
}
normal="\[\e[0m\]"
green="\[\e[32m\]"
violet="\[\e[35m\]"
[[ -n $SSH_TTY ]] && green="$violet"
PS1="$green\$(git_branch)\w $normal"


# aliases
alias vim='nvim'
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

# completion for g
source /usr/share/git/completion/git-completion.bash
__git_complete g __git_main

# include smaller tools and completions
source ~/tools/tools.sh

# settings
set -o vi
export HISTIGNORE="&"
shopt -s histverify

export PATH+=:~/tools
export PATH+=:~/.gem/ruby/2.1.0/bin
export PATH+=:~/go/bin
export PATH+=:/opt/android-sdk/tools/
export EDITOR="vim"
export PAGER="less"

export GOPATH=~/go:$GOPATH
export GOMAXPROCS=4

export LESS="-R"
eval $(lesspipe.sh)
