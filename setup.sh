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
rmln wombat256mod.vim .vim/colors/wombat256mod.vim
mkdir -p ~/.vim/swp
mkdir -p ~/.vim/bundle
pushd ~/.vim/bundle/
git clone https://github.com/tpope/vim-pathogen.git
popd
# i3
rmln i3 .config/i3/config
rmln i3status .config/i3status/config
# bash
rmln bashrc .bashrc
# tmux
rmln tmux.conf .tmux.conf
# git
rmln gitconfig .gitconfig
# desktop
rmln xinitrc .xinitrc
# notifications
rmln dunstrc .config/dunst/dunstrc
