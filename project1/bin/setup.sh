#!/bin/bash

# this script is the main script to call the other two scripts

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

check_root # call the check_root function

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

# https://tecadmin.net/execute-one-shell-script-from-another-shell-script/#google_vignette
