#!/bin/bash
#

pwd=`pwd`
home=$HOME

echo "Installing antigen..."
mkdir -p $home/.antigen
curl -L git.io/antigen > $home/.antigen/antigen.zsh

# link files
FILES=(
    .gitconfig
)
echo "Linking dotfile..."
for FILE in ${FILES[@]}; do
    ln -sfv $pwd/$FILE $home/$FILE;
done

# link directory
DIRS=(
    tmux
)
echo "Linking config dir..."
for DIR in ${DIRS[@]}; do
    ln -sfvn $pwd/$DIR $home/.config/$DIR;
done

if test ! $(which brew); then
    echo "Installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

