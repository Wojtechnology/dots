#!/bin/bash

VUNDLE_PATH=~/.vim/bundle/Vundle.vim
COLORS_PATH=~/.vim/colors
POWERLINE_PATH=~/.powerline

# Install vundle
[ -d "$VUNDLE_PATH" ] || git clone https://github.com/VundleVim/Vundle.vim.git $VUNDLE_PATH

# Install powerline
[ -d "$POWERLINE_PATH" ] || git clone git://github.com/powerline/powerline $POWERLINE_PATH

# Copy vimrc
cp .vimrc ~/.vimrc
[ -d $COLORS_PATH ] || mkdir -p $COLORS_PATH && cp .vim/colors/* $COLORS_PATH

# Install plugins
vim -c ':PluginInstall' -c ':qa'
