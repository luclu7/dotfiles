#!/usr/bin/env bash

# Let's install all of my dotfiles
if ! [ -x "$(command -v git)" ]; then
  echo 'Error: you must install git.' >&2
  exit 1
fi
        
stow -v vim i3 termite fish bins
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +:PluginInstall
