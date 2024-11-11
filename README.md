# Assignment 2 - A01384020 Lisu Lee

## Project 1

### Overview
These scripts help to install packages and create symbolic links for configuration files.

### Scripts
1. install-packages.sh
    - Installing the software packages provided in packages.txt 
    - Using `pacman` as a package manager

2. create-symlinks.sh
    - Creating symbolic links for configuration files
    - Checking if already have config directory

3. setup.sh
    - Main script that coordinates the execution of `install-packages.sh` and `create-symlinks.sh`
    - Using with `sudo` command
    - e.g) `sudo ./assignment2/project1/bin/setup.sh -i`   
    - e.g) `sudo ./assignment2/project1/bin/setup.sh -s`   

## Project 2

### Overview
Create-users.sh automates the process of creating the new user on a Arch Linux system. 
It includes setting a password, establishing group memeberships, and creating a home directory.

### Scripts
1. create-users.sh
    - Creating a new user with specified username and shell
    - Copying default files from `/etc/skel` directory to new user's home directory
    - Requires root privilege to run
    - Using with `sudo` command
    - e.g) `sudo ./assignment2/project2/create-users.sh -u <username> -s <path to shell> [-g <groupname>]`


