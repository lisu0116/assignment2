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


check_root # call the check_root function

# parse command line option
while getopts "is" opt; 
do
    case $opt in
    i) ./assignment2/project1/bin/install-packages.sh;;
    s) ./assignment2/project1/bin/create-symlinks.sh
    *) usage;;
    esac
done
# https://www.ibm.com/docs/sv/aix/7.1?topic=g-getopts-command
# https://man.archlinux.org/man/getopts.1p
# is - specify that options -i, -s are valid
# opt: variable that stores each option character
# -i: if it's provided, run the install-packages.sh
# -s: if it's provided, run the create-symlinks.sh
# *): catch any unrecognized options and call the usage function
# $OPTARG: variable set by getopts that contains the argument

if [ $OPTIND -eq 1 ]; then
    usage
fi
# check if no options are provided, OPTIND is the index of the next argument to be processed
# usage: showing the options if no oprions are given

# https://tecadmin.net/execute-one-shell-script-from-another-shell-script/#google_vignette
