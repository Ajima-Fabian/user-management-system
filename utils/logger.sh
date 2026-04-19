#!/bin/bash
# logger.sh
# A reusable logging function
# Writes timestamped messages to logs/user_manager.log

LOG_FILE="$(dirname "$0")/../logs/user_manager.log"

log() {
    # $1 -> message to log
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" >> "$LOG_FILE"
}
