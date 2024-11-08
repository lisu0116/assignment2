#!/bin/bash

PACKAGES = ("kakoune" "tmux")

install_packages() {
    for package in "${PACKAGES[@]}"; do
        echo "Installing $package"
        if command -v apt-get &> /dev/null; then
            
}