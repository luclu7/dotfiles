#!/usr/bin/env bash

# Let's install all of my dotfiles
if hash stow 2>/dev/null; then
else
        echo "Please install Stow."
	exit
fi

stow -v vim i3 termite fish bins
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim :PluginInstall
