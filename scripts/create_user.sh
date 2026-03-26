#!/bin/bash
# Create a single user

USER="$1"

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

# Hash password
HASHED_PASSWORD=$(openssl passwd -6 "$PASSWORD")

# Create user
if sudo useradd -m -p "$HASHED_PASSWORD" "$USER"; then
    log "User $USER created with secure password"
    echo "User created successfully."
else
    log "Failed to create user $USER"
    echo "Error creating user."
fi
