#!/bin/bash

echo "AOAME local setup script started."

# Get the directory of the script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Change to the script's directory
cd "$SCRIPT_DIR"

echo "Current Directory: $(pwd)"

echo "Running Docker Compose..."

# Run Docker Compose
docker compose up --watch

# Keep the terminal open
read -p "Press any key to continue..."