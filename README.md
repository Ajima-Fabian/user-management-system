# 🛠️ User Management Automation System

A **modular, production-ready Bash automation tool** for efficiently managing Linux users and groups. Designed for scalability, security, and maintainability, with centralized logging and modern best practices for system administration.

---

## 📌 Overview

This project automates common system administration tasks including:

- User creation and deletion  
- Group management (add/remove users)  
- Bulk user creation from a file  

The system is **fully modular**, allowing easy extension and maintainability.

---

## 🚀 Features

- ✅ Create and delete Linux system users  
- ✅ Assign or remove users from groups  
- ✅ Bulk user creation from `data/users.txt`  
- ✅ Forces password change on first login  
- ✅ Centralized logging (`logs/user_manager.log`)  
- ✅ Modular, reusable script design  
- ✅ Input validation and error handling for safety  

---

## 🧱 Project Structure
```bash
user-management-system/
├── scripts/ripts
├── utils/  
├── data/
├── logs/
├── main.sh
└── README.md
```

---

⚙️ Requirements

- Linux OS (RHEL, CentOS, Ubuntu)
- Bash shell
- Root or sudo privileges

---

🧪 Installation & Setup
```bash
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
```
---

🔐 Security Considerations

- Ensure proper sudo permissions
- Password are set securely and cleared from memory after use
- Validate user input before execution
- First-Login password change is enforced for all new users 
- Avoid running in unrestricted environments

---

📈 Future Improvements

- Role-based access control
- Password automation
- Integration with LDAP/Active Directory
- Enhanced reporting and audit logs

---

👨‍💻 Author

Ajima Fabian
📧 Email: ajimafabian18@gmail.com
🔗 GitHub: https://github.com/Ajima-Fabian/Ajima-Fabian

---

📜 License

MIT License
