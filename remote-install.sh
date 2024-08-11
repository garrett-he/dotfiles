#!/usr/bin/env bash

if [[ -z $DOTFILES_GIT_REMOTE ]]; then
    DOTFILES_GIT_REMOTE=https://github.com/garrett-he/dotfiles.git
fi

git clone $DOTFILES_GIT_REMOTE ~/.dotfiles
cd ~/.dotfiles
git submodule init
git submodule update

~/.dotfiles/install.sh < /dev/tty
