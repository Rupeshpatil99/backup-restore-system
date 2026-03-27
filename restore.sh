#!/bin/bash

BACKUP_FILE=$1
RESTORE_DIR=$2

if [ -z "$BACKUP_FILE" ] || [ -z "$RESTORE_DIR" ]; then
    echo "Usage: ./restore.sh <backup_file> <restore_dir>"
    exit 1
fi

mkdir -p "$RESTORE_DIR"

tar -xzf "$BACKUP_FILE" -C "$RESTORE_DIR"

if [ $? -eq 0 ]; then
    echo "Restore successful to $RESTORE_DIR"
else
    echo "Restore failed"
fi
