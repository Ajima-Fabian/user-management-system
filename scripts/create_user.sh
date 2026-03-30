#!/bin/bash
# Create a single user with default password
# Forces password change at first login
# Checks if user already exists 
# Validates user input


# Load logger
# This command loads the logger file so its function can be used safely without breaking 
# source loads the script while the $0 shows how the current shell us being executed, the dirname extracts the parent directory of the path to the current shell
source "$(dirname "$0")/../utils/logger.sh"

USER="$1"  # Get username from argument

# Check if username is provided
if [ -z "$USER" ]; then
    echo "Usage: $0 username"
    exit 1
fi

# Check if user already exists and discard the error message
if id "$USER" &>/dev/null; then
    echo "User $USER already exists."
    # Pass the meeesage as parameter to the log function
    log "Skipped creation: $USER already exists"
    exit 1
fi

# Prompt for password securely
# Pass the -s flag as to hide the password when typing
read -s -p "Enter password for $USER: " PASSWORD
echo
read -s -p "Confirm password: " CONFIRM
echo

# Ensure passwords match
# Validate the password for security 
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
