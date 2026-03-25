#!/bin/bash
# Logging utility
LOG_FILE="../logs/user_manager.log"

log() {
    echo "$(date) - $1" >> "$LOG_FILE"
}
