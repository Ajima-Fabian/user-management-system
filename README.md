🛠️ User Management Automation System

A modular, production-ready Bash automation tool for managing Linux users and groups efficiently. Designed with scalability, logging, and system administration best practices in mind.

---

📌 Overview

This project automates repetitive system administration tasks such as user creation, deletion, and group management. It is structured in a modular format to ensure maintainability and extensibility.

---

🚀 Features

- Create and delete system users
- Group management (create groups, assign users)
- Bulk user creation from file
- Centralized logging system
- Modular and reusable script design

---

🧱 Project Structure

user-management-system/
├── scripts/              # Core functional scripts
├── utils/                # Shared utilities (logger)
├── data/                 # Input files (e.g., users list)
├── logs/                 # Log files
├── main.sh               # Entry point
└── README.md

---

⚙️ Requirements

- Linux OS (RHEL, CentOS, Ubuntu)
- Bash shell
- Root or sudo privileges

---

🧪 Installation & Setup

git clone https://github.com/Ajima-Fabian/user-management-system.git

cd user-management-system
chmod +x main.sh

---

▶️ Usage

./main.sh

Follow the interactive menu to perform operations.

---

📂 Bulk User Creation

Add usernames inside:

data/users.txt

Then select the bulk creation option from the menu.

---

📝 Logging

All actions are logged in:

logs/user_manager.log

---

🔐 Security Considerations

- Ensure proper sudo permissions
- Validate user input before execution
- Avoid running in unrestricted environments

---

📈 Future Improvements

- Role-based access control
- Password automation
- Integration with LDAP/Active Directory

---

👨‍💻 Author

Ajima Fabian
📧 Email: ajimafabian18@gmail.com
🔗 GitHub: https://github.com/Ajima-Fabian

---

📜 License

MIT License
