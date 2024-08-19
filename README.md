# FileFrenzy

### Explanation:

- **Sections:**
  - **Features:** Highlights the key capabilities of the script.
  - **Prerequisites:** Lists the tools you need before using the script.
  - **Installation:** Provides instructions for setting up the script.
  - **Usage:** Shows how to use the script with examples.
  - **Script Details:** Breaks down the script's arguments and error handling.
  - **AWS Authentication:** Explains how the script handles AWS credentials.
  - **License, Contributing, and Contact:** 

# FileFrenzy

`FileFrenzy` is a simple, bash-based command-line tool that allows users to quickly upload files to an AWS S3 bucket. It is designed to provide a seamless upload experience, similar to popular cloud storage services.

## Features

- **Quick File Upload:** Upload files to a specified S3 bucket with a single command.
- **Target Directory Support:** Optionally specify a target directory within the S3 bucket.
- **Error Handling:** Provides meaningful error messages for incorrect or missing inputs.
- **Secure Handling of AWS Credentials:** Uses the AWS CLI for secure authentication and avoids hardcoding credentials.

## Prerequisites

- **AWS CLI:** Make sure you have the [AWS CLI](https://aws.amazon.com/cli/) installed and configured on your system.
- **AWS S3 Bucket:** An existing S3 bucket where you want to upload your files.

## Installation

1. **Clone the repository:**
    ```bash
    git clone https://github.com/daniel-caleb/FileFrenzy.git
    cd FileFrenzy
    ```

2. **Make the script executable:**
    ```bash
    chmod +x filefrenzy.sh
    ```

## Usage

### Basic File Upload

To upload a file to the root of your S3 bucket:

```bash
./filefrenzy.sh /path/to/file.txt

