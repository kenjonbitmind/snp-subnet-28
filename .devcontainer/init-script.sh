#!/bin/bash
# init-script.sh

# Path to the file that marks completion of initialization
INIT_DONE="/workspaces/.init_done"

# Check if the init has already been done
if [ ! -f "$INIT_DONE" ]; then
    echo "Running initialization commands..."

    # Install dependencies
    echo "Installing dependencies..."
    /root/devenv/bin/pip3 install -r requirements.txt

    echo "Preparing to initialize a new Git repository..."
    # Initialize a new git repository
    if [ -d ".git" ]; then
        echo "Removing existing .git directory..."
        rm -rf .git
    fi
    echo "Initializing new Git repository..."
    git init
    git add .
    git commit -m "Initial commit from template"
    echo "Repository initialization complete."

    # Mark initialization as done
    touch "$INIT_DONE"
else
    echo "Initialization already completed."
fi
