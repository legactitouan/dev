#!/usr/bin/env zsh

XDG_CONFIG_HOME=$HOME/.config
DEV_ENV=$HOME/dev/env

copy() {
    if [[ -d "$1" ]]; then
        echo "Copying directory $1 to $2"
        cp -r "$1" "$2"
    elif [[ -f "$1" ]]; then
        echo "Copying file $1 to $2"
        cp "$1" "$2"
    fi
}

copy $DEV_ENV/.zshrc $HOME/.zshrc
copy $DEV_ENV/.zprofile $HOME/.zprofile
copy $DEV_ENV/.config $XDG_CONFIG_HOME

source ~/.zshrc
source ~/.zprofile
