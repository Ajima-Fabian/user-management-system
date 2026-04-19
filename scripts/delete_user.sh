#!/bin/bash
# Delete a single user along with home directory

source "$(dirname "$0")/../utils/logger.sh"

USER="$1"

if [ -z "$USER" ]; then
    echo "Usage: $0 username"
    exit 1
fi

# Check if user exists
if ! id "$USER" &>/dev/null; then
    echo "User $USER does not exist."
    log "Skipped deletion: $USER does not exist"
    exit 1
fi

# Delete user and home directory
if sudo userdel -r "$USER"; then
    echo "User $USER deleted successfully."
    log "User $USER deleted successfully"
else
    echo "Failed to delete $USER."
    log "ERROR: Failed to delete $USER"
fi
