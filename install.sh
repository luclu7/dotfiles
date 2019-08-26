#!/usr/bin/env bash

# Let's install all of my dotfiles
if ! [ -x "$(command -v git)" ]; then
  echo 'Error: you must install git.' >&2
  exit 1
fi        
if ! [ -x "$(command -v stow)" ]; then
  echo 'Error: you must install stow.' >&2
  exit 1
fi

if [ -n "$(command -v lsb_release)" ]; then
	distroname=$(lsb_release -s -d)
fi

if [[ $distroname == "NixOS" ]]; then
sudo ln -s ~/dotfiles/nixos/etc/nixos/configuration.nix  /etc/nixos/configuration.nix
sudo ln -s ~/dotfiles/nixos/etc/nixos/hardware-configuration.nix  /etc/nixos/hardware-configuration.nix
fi

stow -v vim i3 termite fish bins
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +:PluginInstall
