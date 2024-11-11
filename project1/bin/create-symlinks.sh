#!/bin/bash

# function to create symbolic links
create_symlinks() {
    ln -s "$(pwd)/bin" ~/bin
    # create the symbolic links for bin dir
    # https://linuxize.com/post/how-to-create-symbolic-links-in-linux-using-the-ln-command/
    # pwd: retrieves the current working directory path, it ensures that the links are created relative to where the scripts run

    mkdir -p ~/.config
    # make new directory named .config into home directory

    ln -s "$(pwd)/config/kak" ~/.config/kak
    ln -s "$(pwd)/config/tmux" ~/.config/tmux
    # create the symbolic links for config directory

    ln -s "$(pwd)/home/bashrc" ~/.bashrc
    # create the symbolic links for bashrc
}

create_symlinks # call the create_symlinks function