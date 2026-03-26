#!/bin/bash
# Create a single user with default password
# Forces password change at first login

# Load logger
source "$(dirname "$0")/../utils/logger.sh"

USER="$1"  # Get username from argument

# Check if username is provided
if [ -z "$USER" ]; then
    echo "Usage: $0 username"
    exit 1
fi

# Check if user already exists
if id "$USER" &>/dev/null; then
    echo "User $USER already exists."
    log "Skipped creation: $USER already exists"
    exit 1
fi

# Prompt for password securely
read -s -p "Enter password for $USER: " PASSWORD
echo
read -s -p "Confirm password: " CONFIRM
echo

# Ensure passwords match
if [ "$PASSWORD" != "$CONFIRM" ]; then
    echo "Passwords do not match."
    log "ERROR: Passwords did not match for $USER"
    exit 1
fi

# Create user with home directory
if sudo useradd -m "$USER"; then
    # Assign password and force change at first login
    echo "$USER:$PASSWORD" | sudo chpasswd
    sudo passwd -e "$USER"
    echo "User $USER created successfully."
    log "User $USER created; first login password change required"
else
    echo "Error creating $USER."
    log "ERROR: Failed to create $USER"
fi

# Clear sensitive variables
unset PASSWORD CONFIRM
