#!/bin/bash

# Exit on any error
set -e

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Function to detect the operating system
detect_os() {
    if [ -f /etc/os-release ]; then
        . /etc/os-release
        OS_ID="$ID"
        OS_ID_LIKE="$ID_LIKE"
        OS_NAME="$NAME"
    else
        echo "Error: Cannot detect operating system. /etc/os-release not found."
        exit 1
    fi
}

# Function to check if running on Arch Linux or its derivatives
is_arch_based() {
    case "$OS_ID" in
        "arch"|"manjaro"|"endeavouros"|"cachyos")
            return 0
            ;;
        *)
            # Check ID_LIKE for arch derivatives
            if [[ "$OS_ID_LIKE" == *"arch"* ]]; then
                return 0
            fi
            return 1
            ;;
    esac
}

# Function to check if running on NixOS
is_nixos() {
    [ "$OS_ID" = "nixos" ]
}

# Detect the operating system
detect_os

echo "Detected OS: $OS_NAME"

# Check if this is an Arch-based system
if is_arch_based; then
    echo "Running on Arch Linux or derivative. Proceeding with package installation..."
    
    # Check for AUR helper (paru or yay)
    AUR_HELPER=""
    if command_exists paru; then
        AUR_HELPER="paru"
    elif command_exists yay; then
        AUR_HELPER="yay"
    else
        echo "Error: Neither paru nor yay is installed. Please install one of them first."
        exit 1
    fi

    echo "Using AUR helper: $AUR_HELPER"
    echo "Installing packages..."
    $AUR_HELPER -S --needed --noconfirm \
        niri \
        kitty \
        firefox \
        nemo \
        nemo-fileroller \
        nemo-image-converter \
        nemo-preview \
        nemo-python \
        nemo-seahorse \
        hyprpicker \
        walker-bin \
        swaylock \
        swaync \
        waybar \
        qt5ct \
        xdg-autostart \
        xdg-desktop-portal-gnome \
        xdg-desktop-portal-gtk \
        xdg-desktop-portal \
        blueman \
        gnome-keyring \
        polkit-gnome \
        waypaper \
        swaybg \
        xwayland-satellite

    echo "Package installation complete!"
else
    echo "Warning: This script is designed for Arch Linux and its derivatives."
    echo "Detected non-Arch system: $OS_NAME"
    echo "Skipping package installation and proceeding with configuration file copying..."
fi

# Handle configuration file copying based on OS
if is_nixos; then
    echo "NixOS detected. Copying only home configuration files..."
    if [ -d "./config_files" ]; then
        mkdir -p ~/.config
        cp -rf "./config_files/"* ~/.config/
        echo "Home configuration files copied to ~/.config/"
    else
        echo "Warning: './config_files' directory not found, skipping config copy"
    fi
else
    echo "Copying configuration files..."
    if [ -d "./config_files" ]; then
        mkdir -p ~/.config
        cp -rf "./config_files/"* ~/.config/
        echo "Configuration files copied to ~/.config/"
    else
        echo "Warning: './config_files' directory not found, skipping config copy"
    fi

    # Copy autostart files (skip for NixOS)
    echo "Copying autostart files..."
    if [ -d "./autostart" ]; then
        sudo mkdir -p /etc/xdg/autostart/
        sudo cp -rf ./autostart/* /etc/xdg/autostart/
        echo "Autostart files copied to /etc/xdg/autostart/"
    else
        echo "Warning: './autostart' directory not found, skipping autostart copy"
    fi
fi

echo "Installation and configuration complete!"