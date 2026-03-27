#!/bin/bash

source config.conf

DATE=$(date +%Y-%m-%d_%H-%M-%S)
BACKUP_FILE="$BACKUP_DIR/backup_$DATE.tar.gz"

mkdir -p $BACKUP_DIR
mkdir -p logs

tar -czf $BACKUP_FILE $SOURCE_DIR

if [ $? -eq 0 ]; then
    echo "[$(date)] Backup Successful: $BACKUP_FILE" >> $LOG_FILE
else
    echo "[$(date)] Backup Failed" >> $LOG_FILE
fi

find $BACKUP_DIR -type f -name "*.tar.gz" -mtime +$RETENTION_DAYS -exec rm {} \;

echo "[$(date)] Old backups cleaned" >> $LOG_FILE
