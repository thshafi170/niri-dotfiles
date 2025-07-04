#!/bin/bash

# Exit on any error
set -e

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Check if paru is installed
if ! command_exists paru; then
    echo "Error: paru is not installed. Please install paru first."
    exit 1
fi

# Install packages
echo "Installing packages..."
paru -S --needed --noconfirm \
    niri \
    kcalc \
    ghostty \
    firefox \
    dolphin \
    kde-servicemenus-rootactions \
    hyprpicker \
    walker \
    swaylock \
    swaync \
    waybar \
    qt5ct \
    xdg-autostart \
    xdg-desktop-portal-gnome \
    xdg-desktop-portal-gtk \
    xdg-desktop-portal-kde \
    xdg-desktop-portal \
    blueman \
    gnome-keyring \
    polkit-kde-agent \
    waypaper \
    swaybg \
    xwayland-satellite

# Copy configuration files
echo "Copying configuration files..."
if [ -d "./config_files" ]; then
    mkdir -p ~/.config
    cp -rf "./config_files/"* ~/.config/
    echo "Configuration files copied to ~/.config/"
else
    echo "Warning: './config_files' directory not found, skipping config copy"
fi

# Copy autostart files
echo "Copying autostart files..."
if [ -d "./autostart" ]; then
    sudo cp -rf ./autostart/* /etc/xdg/autostart/
    echo "Autostart files copied to /etc/xdg/autostart/"
else
    echo "Warning: './autostart' directory not found, skipping autostart copy"
fi

echo "Installation and configuration complete!"