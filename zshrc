# history stuff
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# vi style
bindkey -v

# make delete key work
bindkey "^[[3~" delete-char

# completion stuff?
zstyle :compinstall filename '/home/luki/.zshrc'
autoload -Uz compinit
compinit
zstyle ':completion:*' special-dirs true

# colored prompt
autoload colors && colors
green="%{$fg_bold[green]%}"
white="%{$fg_bold[white]%}"
grey="%{$fg_bold[grey]%}"
blue="%{$fg_bold[blue]%}"
nocolor="%{$reset_color%}"

PROMPT="$white╮%(?..$blue%? )$green%n$grey@%M:$white%~
╰╴$nocolor"

# powerless
export LESS="-R"
eval $(lesspipe.sh)

# extend PATH
PATH+=:~/tools
# vim
EDITOR=vim

# aliases
alias q='exit'
alias ls='ls --color'
alias vih='vim +h +on'
