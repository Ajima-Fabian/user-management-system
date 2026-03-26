#!/bin/bash

# Bulk create users

# Load logger
source "$(dirname "$0")/../utils/logger.sh"

# Users file
FILE="$(dirname "$0")/../data/users.txt"

# Check file exists
if [ ! -f "$FILE" ]; then
    echo "No users file found at $FILE"
    log "ERROR: Users file not found at $FILE"
    exit 1
fi

# Default password input
read -s -p "Enter default password: " PASSWORD
echo
read -s -p "Confirm password: " CONFIRM
echo

if [ "$PASSWORD" != "$CONFIRM" ]; then
    echo "Passwords do not match"
    log "ERROR: Passwords do not match"
    exit 1
fi

# Loop through users
while IFS= read -r user; do
    [ -z "$user" ] && continue
    [[ "$user" =~ ^# ]] && continue

    if id "$user" &>/dev/null; then
        echo "User $user exists"
        log "Skipped existing user $user"
        continue
    fi

    if sudo useradd -m "$user"; then
        echo "$user:$PASSWORD" | sudo chpasswd
        sudo passwd -e "$user"  # Force first login password change
        echo "User $user created successfully"
        log "User $user created with forced password change on first login"
    else
        echo "Failed to create $user"
        log "ERROR: Failed to create user $user"
    fi
done < "$FILE"

unset PASSWORD CONFIRM
echo "Bulk creation complete"
log "Bulk creation process completed"
