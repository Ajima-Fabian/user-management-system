#!/bin/bash
# Group management

GROUP="$1"
USER="$2"
ACTION="$3" # add or remove

if [ -z "$GROUP" ] || [ -z "$USER" ] || [ -z "$ACTION" ]; then
    echo "Usage: $0 group user add|remove"
    exit 1
fi

if [ "$ACTION" == "add" ]; then
    sudo usermod -aG "$GROUP" "$USER"
    echo "$(date) - Added $USER to $GROUP" >> ../logs/user_manager.log
elif [ "$ACTION" == "remove" ]; then
    sudo gpasswd -d "$USER" "$GROUP"
    echo "$(date) - Removed $USER from $GROUP" >> ../logs/user_manager.log
else
    echo "Invalid action. Use add or remove."
fi
