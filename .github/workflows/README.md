# ⚙️ CI/CD Workflow Documentation

This directory contains GitHub Actions workflows used to automate tasks in this project.

---

## 🚀 Workflow: Simple Pipeline

This workflow runs automatically on every push to the repository.

### 🔄 What It Does

- Executes shell commands in a Linux runner
- Creates a directory and file
- Writes data into the file
- Outputs the result to logs

---

## 📄 Configuration

```yaml
name: Simple Pipeline

on: [push]

jobs:
  dir:
    runs-on: ubuntu-latest
    steps:
      - run: |
          echo "Make file"
          mkdir -p folder
          cd folder
          touch data
          echo "This is my first line" >> data
          cat data
