#!/bin/bash

# This script can be used to set up AOAME locally.
# Prerequisites: git ( https://git-scm.com/downloads ), Node.js ( https://nodejs.org )

# Change these variable if you want to use a branch other than the master branch.
webapp_branch=master
webservice_branch=master
fuseki_branch=master

echo "AOAME local setup script started."

base_dir=$(pwd)/aoame

mkdir -p aoame

# Check if commands exist
if ! command -v git &>/dev/null; then
    echo "Git is required for this script to work. You can download it from https://git-scm.com/downloads"
    read -p "Press enter to continue"
    exit 1
fi

if ! command -v node &>/dev/null; then
    echo "The webapp requires Node.js for it to work. You can download it from https://nodejs.org/en/"
    read -p "Press enter to continue"
    exit 1
fi

if ! command -v npm &>/dev/null; then
    echo "The webapp requires npm for it to work. Make sure to also install npm while installing node.js from https://nodejs.org/en/"
    read -p "Press enter to continue"
    exit 1
fi

# Check Angular CLI
if ! command -v ng &>/dev/null; then
    echo "Installing Angular..."
    npm install -g @angular/cli
    # Recheck after installation
    exec $0
fi

# Function to clone a repository if it does not exist already.
clone_repository() {
    cd "$base_dir"
    if [ ! -d "$git_name" ]; then
        echo "Cloning $git_name repository from $git_repository"
        git clone "$git_repository"
        if [ ! -d "$git_name" ]; then
            echo "Failed to clone repository $git_name from $git_repository"
            read -p "Press enter to continue"
            exit 1
        fi
    fi
}

# Clone and deploy fuseki
git_name=fuseki-heroku-test
git_repository=https://github.com/BPaaSModelling/fuseki-heroku-test.git
branch=$fuseki_branch
clone_repository

# Clone and deploy webservice
git_name=OntologyBasedModellingEnvironment-WebService
git_repository=https://github.com/BPaaSModelling/OntologyBasedModellingEnvironment-WebService.git
branch=$webservice_branch
clone_repository

# Clone and deploy webapp
git_name=OntologyBasedModellingEnvironment-WebApp
git_repository=https://github.com/BPaaSModelling/OntologyBasedModellingEnvironment-WebApp.git
branch=$webapp_branch
clone_repository

# Setup webapp
cd "$base_dir/$git_name"
npm install --legacy-peer-deps
ng build

echo "Setup complete. Press enter to exit."
read -p "Press enter to continue"