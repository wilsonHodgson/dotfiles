# symlink repo to home directory
ln -s $HOME/dotfiles/.bashrc $HOME
ln -s $HOME/dotfiles/.tmux.conf $HOME


mkdir -p $HOME/.config
ln -s $HOME/dotfiles/.config/nvim $HOME/.config

# install dependant files using system agnostic package manager
# Brew? Conda?

# MINIMAL
# neovim
# cmake
# autotools
# bash
# clang
# pandoc
# tcc ?
# hugo
# lvm
# nmap
# texlive
# tmux???
# xclip

# DESKTOP
# firefox
# thunderbird
# Gnome3
# Pop-shell (gnome extension)
# RSS Gaurd
# SimpleScreenRecorder?
# Spotify?
# bluez?
# flatpak?
# raylib
# Remmina
# GIMP
# kdenlive

# FULL
# Blender
# .net core?
# Mesa
# vulcan
# mono
