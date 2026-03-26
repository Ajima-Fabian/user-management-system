#!/bin/bash
# Create a single user

source "$(dirname "$0")/../utils/logger.sh"

USER="$1"

# Validate input
if [ -z "$USER" ]; then
    echo "Usage: $0 username"
    exit 1
fi

# Check if user exists
if id "$USER" &>/dev/null; then
    echo "User already exists"
    exit 1
fi

# Ask for password
read -s -p "Enter password: " PASSWORD
echo
read -s -p "Confirm password: " CONFIRM
echo

# Check password match
if [ "$PASSWORD" != "$CONFIRM" ]; then
    echo "Passwords do not match"
    exit 1
fi

# Hash password
HASHED_PASSWORD=$(openssl passwd -6 "$PASSWORD")

# Check if hashing worked
if [ -z "$HASHED_PASSWORD" ]; then
    echo "Password hashing failed"
    exit 1
fi

# Create user
if sudo useradd -m -p "$HASHED_PASSWORD" "$USER"; then
    log "User $USER created with secure password"
    echo "User created successfully."
else
    log "Failed to create user $USER"
    echo "Error creating user."
fi

# Clear sensitive variables
unset PASSWORD CONFIRM HASHED_PASSWORD
