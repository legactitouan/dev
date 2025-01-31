#!/usr/bin/env zsh

XDG_CONFIG_HOME=$HOME/.config
DEV_ENV=$HOME/dev/env

copy() {
    echo "Copying $1 to $2"
    rm -rf $2
    cp -r $1 $2
}

copy $DEV_ENV/.zshrc $HOME/.zshrc
copy $DEV_ENV/.zprofile $HOME/.zprofile
copy $DEV_ENV/.config $XDG_CONFIG_HOME

source ~/.zshrc
source ~/.zprofile
