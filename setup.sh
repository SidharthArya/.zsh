#!/usr/bin/env bash

ARG1=$1

install () {
ln -s ~/.config/zsh/zshrc ~/.zshrc
ln -s ~/.config/zsh/zshenv ~/.zshenv
}

uninstall () {
    rm ~/.zshrc
    rm ~/.zshenv
}

if [ "$ARG1" == "install" ]; then
    install
elif [ "$ARG1" == "uninstall" ]; then
    uninstall
else
    echo "Usage: ./setup.sh [install|uninstall]"
    exit 1
fi