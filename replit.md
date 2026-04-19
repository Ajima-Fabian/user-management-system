# User Management Automation System

## Overview
A modular, Bash-based Linux user management automation tool for system administrators. Provides an interactive menu to create, delete, and manage Linux users and groups.

## Project Structure
```
user-management-system/
├── data/
│   └── users.txt             # List of usernames for bulk creation
├── logs/
│   └── user_manager.log      # Centralized log file (created at runtime)
├── scripts/
│   ├── bulk_create.sh        # Mass user creation from data/users.txt
│   ├── create_user.sh        # Single user creation with validation
│   ├── delete_user.sh        # Single user deletion (including home dir)
│   └── group_management.sh   # Add/remove users from groups
├── utils/
│   └── logger.sh             # Reusable logging utility
├── main.sh                   # Entry point / interactive menu
└── README.md                 # Project documentation
```

## Running the Application
- **Workflow:** "Start application" — runs `bash main.sh` as a console workflow
- The tool presents an interactive menu with 4 options:
  1. Create User
  2. Delete User
  3. Manage Group
  4. Bulk Create Users

## Requirements
- Linux environment with standard user management utilities (`useradd`, `userdel`, `usermod`, `passwd`, etc.)
- Root or sudo privileges to perform user management operations

## Notes
- All operations are logged to `logs/user_manager.log`
- Passwords are handled securely (hidden input, forced change on first login)
- The `group_management.sh` script was renamed from `group_managements.sh` to match the reference in `main.sh`
