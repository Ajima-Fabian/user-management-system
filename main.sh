#!/bin/bash
# main.sh - Entry point for User Management System
# Provides interactive menu to create/delete users, manage groups, or bulk create users

# Load logger
source "$(dirname "$0")/utils/logger.sh"

echo "=================================="
echo "     User Management Automation    "
echo "=================================="

# Display menu
echo "1) Create User"
echo "2) Delete User"
echo "3) Manage Group"
echo "4) Bulk Create Users"

# Read user choice
read -p "Choose an option (1-4): " choice

case "$choice" in
1)
    # Create a single user
    read -p "Enter username: " uname
    # Call modular script
    ./scripts/create_user.sh "$uname"
    ;;
2)
    # Delete a single user
    read -p "Enter username: " uname
    ./scripts/delete_user.sh "$uname"
    ;;
3)
    # Manage user group
    read -p "Enter group name: " group
    read -p "Enter username: " uname
    read -p "Add or remove user? (add/remove): " action
    ./scripts/group_management.sh "$group" "$uname" "$action"
    ;;
4)
    # Bulk create users from data/users.txt
    ./scripts/bulk_create.sh
    ;;
*)
    # Invalid input
    echo "Invalid option. Please choose 1, 2, 3, or 4."
    log "ERROR: Invalid menu option selected: $choice"
    ;;
esac
