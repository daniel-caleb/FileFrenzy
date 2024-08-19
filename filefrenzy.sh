#!/bin/bash

# Function to display usage
usage() {
    echo "Usage: $0 /path/to/file [--target-dir DIR]"
    echo "Options:"
    echo "  --target-dir DIR        Specify the target directory in the S3 bucket"
    exit 1
}

# Default value for optional parameter
TARGET_DIR=""

# Parse command-line arguments
FILE_PATH=""
while [[ $# -gt 0 ]]; do
    case $1 in
        --target-dir)
            TARGET_DIR="$2"
            shift 2
            ;;
        *)
            if [ -z "$FILE_PATH" ]; then
                FILE_PATH="$1"
            else
                echo "Error: Unknown argument '$1'"
                usage
            fi
            shift
            ;;
    esac
done

# Check if file path is provided and valid
if [ -z "$FILE_PATH" ]; then
    echo "Error: File path is required."
    usage
fi

if [ ! -f "$FILE_PATH" ]; then
    echo "Error: File '$FILE_PATH' not found."
    exit 1
fi

# Set your S3 bucket name (Replace 'your-bucket-name' with your actual S3 bucket name)
BUCKET_NAME="your-bucket-name"

# Get the file name from the path
FILE_NAME=$(basename "$FILE_PATH")

# Construct the target S3 path
if [ -n "$TARGET_DIR" ]; then
    S3_PATH="s3://$BUCKET_NAME/$TARGET_DIR/$FILE_NAME"
else
    S3_PATH="s3://$BUCKET_NAME/$FILE_NAME"
fi

# Upload the file to S3 without specifying a storage class
aws s3 cp "$FILE_PATH" "$S3_PATH" --only-show-errors

# Error handling for upload
if [ $? -eq 0 ]; then
    echo "File '$FILE_NAME' uploaded successfully to S3 bucket '$BUCKET_NAME' under '$TARGET_DIR'."
else
    echo "Error: Failed to upload file to S3."
    exit 1
fi
