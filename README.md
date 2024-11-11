# Assignment 2 - A01384020 Lisu Lee

## Project 1

### Overview
These scripts help to install packages and create symbolic links for configuration files.

### Scripts
1. **install-packages.sh**
    - Installing the software packages provided in packages.txt 
    - Using `pacman` as a package manager

2. **create-symlinks.sh**
    - Creating symbolic links for configuration files
    - Checking if already have config directory

3. **setup.sh**
    - Main script that coordinates the execution of `install-packages.sh` and `create-symlinks.sh`
    - Using with `sudo` command
    - e.g) `sudo ./assignment2/project1/bin/setup.sh -i`   
    - e.g) `sudo ./assignment2/project1/bin/setup.sh -s`   

## Project 2

### Overview
Create-users.sh automates the process of creating the new user on a Arch Linux system. 
It includes setting a password, establishing group memeberships, and creating a home directory.

### Script
1. **create-users.sh**
    - Creating a new user with specified username and shell
    - Copying default files from `/etc/skel` directory to new user's home directory
    - Requires root privilege to run
    - Using with `sudo` command
    - e.g) `sudo ./assignment2/project2/create-users.sh -u <username> -s <path to shell> [-g <groupname>]`

## Trouble Shooting
If having issues as using these scripts, some common problems and the solutions

### 1. Permission Denied Errors

**Problem**: When running the scripts, see "Permission denied"

**Solution**: 
- Ensuring the scripts are executable:
    ```bash
    chmod +x <file-name>
    ```
    
- Eusuring that running the scripts with `sudo`
    ```bash
    sudo <file path>
    ```
        

### 2. Symbolic Links Error

**Problems**: When running the scripts, fail to create symbolic links

**Solution**:
- Checking if already having config directory, rewrite the code in create-symlinks.sh
    ```bash
    ln -sf "$(pwd)<existing directory path>" <name of symbolic link>
    ```

- If a link already exists, removing it first
    ```bash
    rm ~/.config/<existing link>
    ```

### 3. User Creation Failures

**Problems**: When running the scripts, fail to create a new user

**Solution**:
- Eusuring that running the scripts with `sudo`
    ```bash
    sudo <file path>
    ```

- Checking if username already exists
    ```bash
    id username
    ```

### 4. Script Not Found

**Problems**: When terminal says the script is not found

**Solution**:
- Ensuring the file directory that the scripts in
    ```bash
    pwd # it will show your current path

    cd <directory path where the script in> # going into that directory
    ./<filename>
    ```


### General Trouble Shooting Tips
1. Checking script logs or enable verbose output if available.
2. Verifying system requirements and dependencies are met.
3. Ensuring your system is up to date.
4. Checking system logs (/var/log/syslog or journalctl) for any relevant error messages.



