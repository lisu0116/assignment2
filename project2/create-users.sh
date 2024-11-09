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
                                                                                                                                                                                                                        

# Function to display usage info
usage() {
    echo "Usage: $0 -u USERNAME -s SHELL [-g GROUPS]"
    echo "-u: specify username"
    echo "-s: specify shell"
    echo "-g: specify additional groups"
    exit 1
}
# $0: represent the script's name

# function to create a user
create_user() {
    local username=$1
    local shell=$2
    local groups=$3

    useradd -m -s "$shell" "$username"
    # create user with shell and home directory
    # -m: create the user's home directory
    # -s: define the shell that user will use
    # https://man.archlinux.org/man/useradd.8

    passwd "$username"
    # create the password for the new user
    # https://man.archlinux.org/man/passwd.1

    if [ -n "$groups" ]; then
        usermod -aG "$groups" "$username"
    fi
    # add user to additional groups if specified
    # -a: append the user to the supplementary group(s), use only with -G option
    # -G: specify a list of supplementary groups
    # https://man.archlinux.org/man/usermod.8 and week 6 notes

    cp -r /etc/skel/. "/home/$username/"
    # cp: copy contents of /etc/skel/ to user's home directory
    # -r: copy directories recursively
    # https://man.archlinux.org/man/cp.1
    
    echo "user $username created"
}

check_root

# parse command line option
while getopts "u:s:g:" opt; 
do
    case $opt in
    u) username=$OPTARG;;
    s) shell=$OPTARG;;
    g) groups=$OPTARG;;
    *) usage;;
    esac
done
# https://www.ibm.com/docs/sv/aix/7.1?topic=g-getopts-command
# https://man.archlinux.org/man/getopts.1p
# u:s:g - specify the script accepts options -u, -s, -g, each requiring argument (by colon)
# opt: variable that stores each option character
# u), s), g): store the provided argument
# *): catch any unrecognized options and call the usage function
# $OPTARG: variable set by getopts that contains the argument

if [ -z "$username" ] || [ -z "$shell" ]; then
    usage
fi
# check if required options are provided

create_user "$username" "$shell" "$groups"
