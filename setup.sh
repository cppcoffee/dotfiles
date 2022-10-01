#!/bin/bash
#

# link files
#echo "Installing antigen..."
#curl -L git.io/antigen > ~/.antigen/antigen.zsh
#
#FILES=(
#    .zshrc
#    .gitconfig
#    .ssh/config
#)
#
#echo "Linking dotfile..."
#for FILE in ${FILES[@]}; do
#    ln -sfv $HOME/.dotfiles/$FILE ~/$FILE;
#done

# link directory
DIRS=(
    tmux
)
echo "Linking config dir..."
for DIR in ${DIRS[@]}; do
    ln -sfvn $HOME/.dotfiles/$DIR ~/.config/$DIR;
done

if test ! $(which brew); then
    echo "Installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

