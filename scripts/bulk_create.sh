#!/bin/bash
# Bulk create users from data/users.txt
# Forces first-login password change for all users

source "$(dirname "$0")/../utils/logger.sh"

FILE="$(dirname "$0")/../data/users.txt"

# Check file exists
if [ ! -f "$FILE" ]; then
    echo "No users file found at $FILE"
    log "ERROR: Users file not found at $FILE"
    exit 1
fi

# Prompt for default password
read -s -p "Enter default password for all users: " PASSWORD
echo
read -s -p "Confirm password: " CONFIRM
echo

if [ "$PASSWORD" != "$CONFIRM" ]; then
    echo "Passwords do not match"
    log "ERROR: Passwords do not match for bulk creation"
    exit 1
fi

# Read users from file
while IFS= read -r user; do
    # Skip empty lines and comments
    [ -z "$user" ] && continue
    [[ "$user" =~ ^# ]] && continue

    # Skip if user exists
    if id "$user" &>/dev/null; then
        echo "User $user already exists"
        log "Skipped existing user $user"
        continue
    fi

    # Create user
    if sudo useradd -m "$user"; then
        echo "$user:$PASSWORD" | sudo chpasswd
        sudo passwd -e "$user"
        echo "User $user created successfully"
        log "User $user created; first-login password change required"
    else
        echo "Failed to create $user"
        log "ERROR: Failed to create $user"
    fi
done < "$FILE"

# Clear sensitive variables
unset PASSWORD CONFIRM

echo "Bulk user creation completed"
log "Bulk user creation completed"
