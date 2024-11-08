#!/bin/bash

# this script will run the other setup scripts: install-packages script and create-symlinks script

# Will run the install-packages script
# To want to other scripts on here, should be using the file path and file name.
# https://tecadmin.net/execute-one-shell-script-from-another-shell-script/#google_vignette
echo "Running the package installation script"
./bin/install-packages.sh

# Will run the create-symlinks script
echo "Running the symbolic link creation script"
./bin/create-symlinks.sh

echo "System setup is complete."