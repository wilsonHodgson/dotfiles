stow --target=$HOME --dir=$HOME/dotfiles configs

##Download Vim-Plugged and place it within nvim autoload directory
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# install dependant files using system agnostic package manager
# Brew? Conda?

# MINIMAL
# neovim + language server dependencies
# cmake
# autotools
# bash
# clang
# gcc
# pandoc
# hugo
# lvm
# nmap
# texlive
# tmux
# xclip

# DESKTOP
# firefox
# thunderbird
# RSS Gaurd
# Spotify
# bluez
# flatpak
# raylib
# GIMP

# FULL
# Blender
# kdenlive
# .net core?
# Mesa
# vulcan
# mono
