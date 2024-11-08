#!/bin/bash

# Function to check the root privileges
check_root() {
    if [ "$EUID" -ne 0 ]; then
        ehco "This must be run as root"
        exit 1 # exit the script with the error status
}
# $EUID is effective user ID of the current user
# https://eitca.org/cybersecurity/eitc-is-lsa-linux-system-administration/linux-processes/processes-overview/examination-review-processes-overview/what-is-the-difference-between-user-id-uid-and-effective-user-id-euid-in-linux-processes/
# Root user has an EUID 0
# EUID allows for more precise control over process permissions and align's with Linux security model.

# Function to display usage info
usage() {
    echo "Usage: $0 -u USERNAME -s SHELL [-g GROUPS]"
    echo 
}