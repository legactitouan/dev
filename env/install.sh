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
    else
        echo "⚠️  Warning: $1 does not exist, skipping..."
    fi
}

copy $DEV_ENV/.zshrc $HOME/.zshrc
copy $DEV_ENV/.zprofile $HOME/.zprofile
copy $DEV_ENV/.config $XDG_CONFIG_HOME

if [[ -d "$HOME/.config/raycast" ]]; then
    echo "Raycast exists in home, handling the swap..."
    rm -rf "$DEV_ENV/.config/raycast/extensions"
    cp -r "$HOME/.config/raycast/extensions" "$DEV_ENV/.config/raycast/extensions"
else
    echo "Raycast does not exist in home, copying from DEV_ENV..."
    cp -r "$DEV_ENV/.config/raycast" "$HOME/.config/raycast"
fi

source ~/.zshrc
source ~/.zprofile
