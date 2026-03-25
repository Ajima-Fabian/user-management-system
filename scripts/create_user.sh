#!/bin/bash
# Create a single user

USER="$1"

if [ -z "$USER" ]; then
    echo "Usage: $0 username"
    exit 1
fi

sudo useradd "$USER" && echo "$(date) - User $USER created" >> ../logs/user_manager.log
echo "User $USER created successfully."
