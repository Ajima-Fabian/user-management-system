#!/bin/bash
# Entry point

echo "User Management Automation"
echo "1) Create User"
echo "2) Delete User"
echo "3) Manage Group"
echo "4) Bulk Create Users"
read -p "Choose an option: " choice

case $choice in
1)
    read -p "Enter username: " uname
    ./scripts/create_user.sh "$uname"
    ;;
2)
    read -p "Enter username: " uname
    ./scripts/delete_user.sh "$uname"
    ;;
3)
    read -p "Enter group: " group
    read -p "Enter username: " uname
    read -p "Add or remove user? (add/remove): " action
    ./scripts/group_management.sh "$group" "$uname" "$action"
    ;;
4)
    ./scripts/bulk_create.sh
    ;;
*)
    echo "Invalid option."
    ;;
esac
