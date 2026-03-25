#!/bin/bash
# Delete a single user

USER="$1"

if [ -z "$USER" ]; then
    echo "Usage: $0 username"
    exit 1
fi

sudo userdel -r "$USER" && echo "$(date) - User $USER deleted" >> ../logs/user_manager.log
echo "User $USER deleted successfully."
