#!/bin/bash
# Add or remove a user from a group

source "$(dirname "$0")/../utils/logger.sh"

GROUP="$1"
USER="$2"
ACTION="$3"  # add or remove

# Validate inputs
if [ -z "$GROUP" ] || [ -z "$USER" ] || [ -z "$ACTION" ]; then
    echo "Usage: $0 group user add|remove"
    exit 1
fi

# Add user to group
if [ "$ACTION" == "add" ]; then
    if sudo usermod -aG "$GROUP" "$USER"; then
        echo "Added $USER to $GROUP"
        log "Added $USER to $GROUP"
    else
        echo "Failed to add $USER to $GROUP"
        log "ERROR: Failed to add $USER to $GROUP"
    fi

# Remove user from group
elif [ "$ACTION" == "remove" ]; then
    if sudo gpasswd -d "$USER" "$GROUP"; then
        echo "Removed $USER from $GROUP"
        log "Removed $USER from $GROUP"
    else
        echo "Failed to remove $USER from $GROUP"
        log "ERROR: Failed to remove $USER from $GROUP"
    fi
else
    echo "Invalid action. Use add or remove."
    log "ERROR: Invalid group action $ACTION"
fi
