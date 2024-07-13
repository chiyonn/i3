#!/bin/bash

if [ -f /etc/os-release ]; then
    . /etc/os-release
else
    echo "Error: /etc/os-release file not found!"
    exit 1
fi

install_alacritty() {
    case "$ID" in
        ubuntu|debian)
            sudo apt update
            sudo apt install -y alacritty
            ;;
        fedora)
            sudo dnf install -y alacritty
            ;;
        arch)
            sudo pacman -Syu --noconfirm alacritty
            ;;
        centos|rhel)
            sudo dnf install -y alacritty
            ;;
        *)
            echo "Error: Unsupported OS: $ID"
            exit 1
            ;;
    esac
}

install_alacritty

if command -v alacritty > /dev/null; then
    echo "Alacritty has been installed successfully!"
else
    echo "Failed to install Alacritty."
    exit 1
fi

