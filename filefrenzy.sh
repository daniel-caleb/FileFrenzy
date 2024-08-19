#!/bin/bash

# Function to print usage instructions
usage() {
    echo "Usage: $0 /path/to/file.txt [optional: target-cloud-directory] [optional: storage-class]"
    exit 1
}

# Check if the required argument (file path) is provided
if [ -z "$1" ]; then
    echo "Error: File path is required."
    usage
fi

FILE_PATH=$1

# Check if the file exists
if [ ! -f "$FILE_PATH" ]; then
    echo "Error: File '$FILE_PATH' not found."
    exit 1
fi

# Optional arguments
TARGET_DIR=$2
STORAGE_CLASS=$3

# Check if AWS CLI is installed
if ! command -v aws &> /dev/null; then
    echo "Error: AWS CLI not found. Please install AWS CLI to proceed."
    exit 1
fi

# Ensure AWS credentials are configured
if [ -z "$AWS_ACCESS_KEY_ID" ] || [ -z "$AWS_SECRET_ACCESS_KEY" ]; then
    echo "Error: AWS credentials are not set. Please configure your AWS credentials."
    exit 1
fi

# Construct the upload command
UPLOAD_COMMAND="aws s3 cp \"$FILE_PATH\" s3://meshewa254"

# Add optional arguments if provided
if [ ! -z "$TARGET_DIR" ]; then
    UPLOAD_COMMAND="$UPLOAD_COMMAND/$TARGET_DIR"
fi

if [ ! -z "$STORAGE_CLASS" ]; then
    UPLOAD_COMMAND="$UPLOAD_COMMAND --storage-class $STORAGE_CLASS"
fi

# Execute the upload command
echo "Uploading file..."
if eval $UPLOAD_COMMAND; then
    echo "Upload successful!"
else
    echo "Error: Upload failed."
    exit 1
fi

