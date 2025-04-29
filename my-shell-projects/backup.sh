#!/bin/bash

<< comment
 ----------------------
 Automated Backup Script
 ----------------------
comment

# Check if the user provided two arguments
if [ $# -ne 2 ]; then
  echo "Usage: $0 <source_folder> <backup_destination>"
  exit 1
fi

SOURCE_DIR=$1
BACKUP_DIR=$2

# Create a timestamp for the backup
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")

# Define the backup file name
BACKUP_FILE="backup_$TIMESTAMP.tar.gz"

# Check if the source directory exists
if [ ! -d "$SOURCE_DIR" ]; then
  echo "Error: Source directory '$SOURCE_DIR' does not exist."
  exit 2
fi

# Create the backup destination directory if it doesn't exist
mkdir -p "$BACKUP_DIR"

# Run the backup using tar
tar -czf "$BACKUP_DIR/$BACKUP_FILE" "$SOURCE_DIR"

# Check if the backup was successful
if [ $? -eq 0 ]; then
  echo "✅ Backup successful!"
  echo "Backup saved to: $BACKUP_DIR/$BACKUP_FILE"
else
  echo "❌ Backup failed!"
  exit 3
fi

