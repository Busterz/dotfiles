#!/bin/bash
# This script installs commonly used software on Manjaro systems

distro=$(cat /etc/os-release | grep '^ID=' | cut -d'=' -f2 | tr -d '"')
distro_lower=$(echo "$distro" | tr '[:upper:]' '[:lower:]')

echo "Detected distribution: $distro"

if [[ "$distro_lower" == "manjaro" ]]; then
    echo "Updating package lists..."
    sudo pacman -Syy --noconfirm

    echo "Upgrading all the packages to the latest available versions..."
    sudo pacman -Syu --noconfirm

    echo "Installing essential tools..."
    sudo pacman -S --needed --noconfirm wget curl git vim tmux p7zip unzip

    echo "Installing desktop applications..."
    sudo pacman -S --needed --noconfirm gimp libreoffice vlc kamoso

    echo "Installing development tools..."
    sudo pacman -S --needed --noconfirm python python-pip

    echo "Start installing others..."
    echo "1. Brave browser"
    sudo pacman -S --needed --noconfirm brave-browser

    echo "2. Steam"
    sudo pacman -S --needed --noconfirm steam

    echo "3. Visual Studio Code"
    sudo pacman -S --needed --noconfirm code

    echo "4. OBS Studio (from yay)"
    sudo pacman -S --needed --noconfirm base-devel
    sudo pacman -S yay
    yay -S obs-studio-browser

    echo "5. Discord (From AUR which is stabler than Pacman)"
    yay -S discord
else
    echo "This script is specifically designed for Manjaro Linux."
fi

echo "Installation (if applicable) complete!"