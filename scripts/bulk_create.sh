#!/bin/bash
# Bulk create users from data/users.txt

FILE="../data/users.txt"

if [ ! -f "$FILE" ]; then
    echo "No users file found at $FILE"
    exit 1
fi

while IFS= read -r user; do
    sudo useradd "$user" && echo "$(date) - User $user created" >> ../logs/user_manager.log
    echo "User $user created."
done < "$FILE"
