#!/bin/bash

# Function to check the root privileges
check_root() {
    if [ "$EUID" -ne 0 ]; then
        echo "This must be run as root"
        exit 1 # exit the script with the error status
    fi
}
# $EUID is effective user ID of the current user
# https://eitca.org/cybersecurity/eitc-is-lsa-linux-system-administration/linux-processes/processes-overview/examination-review-processes-overview/what-is-the-difference-between-user-id-uid-and-effective-user-id-euid-in-linux-processes/
# Root user has an EUID 0
# EUID allows for more precise control over process permissions and align's with Linux security model.
# -ne: stands for not equal
# if EUID doesn't have root privilege, it's not running the code.
# since creating a new user, must have root privilege

# function to install packages
install_packages() {
    packages=$(cat packages.txt)
    # read packages from packages.txt
    # cat (concatenate): display file contents

    pacman -Syu --noconfirm $packages
    # install packages use pacman
    # pacman: package manager for Arch Linux
    # -Syu: upgrading and downloading packages
    # --noconfirm: precisely that --don't confirm (same as yes)
    # https://bbs.archlinux.org/viewtopic.php?id=233231
    # https://wiki.archlinux.org/title/Pacman
}

check_root # call the check_root 
install_packages # call the install_packages

