#!/bin/bash

conf=~/conf


function rmln {
    # handle hostname argument
    if [ "$3" != "" -a "$3" != "$(hostname)" ]
    then
        echo "($1)"
        return
    fi
    echo $1
    # check target
    mkdir -p ~/$(dirname $2)
    if [ -e ~/$2 ]
    then
        rm -i ~/$2
    fi
    # if target ok, symlink
    if [ ! -e ~/$2 ]
    then
        ln -s $conf/$1 ~/$2
    fi
}


# vim
rmln vimrc .vimrc
rmln molokai.vim .vim/colors/molokai.vim
rmln wombat256mod.vim .vim/colors/wombat256mod.vim
# i3
rmln i3.hogship .config/i3/config hogship
rmln i3.dinghy .config/i3/config dinghy
rmln i3status.hogship .config/i3status/config hogship
rmln i3status.dinghy .config/i3status/config dinghy
# bash
rmln bashrc .bashrc
# zsh
rmln zshrc .zshrc
# dwb
rmln dwb_settings .config/dwb/settings
rmln dwb_keys .config/dwb/keys
rmln dwb_searchengines .config/dwb/searchengines
#tmux
rmln tmux.conf .tmux.conf
