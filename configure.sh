# symlink repo to home directory
ln -s $HOME/dotfiles/.bashrc $HOME
ln -s $HOME/dotfiles/.tmux.conf $HOME


mkdir -p $HOME/.config
ln -s $HOME/dotfiles/.config/nvim $HOME/.config

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
