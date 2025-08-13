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
    sudo pacman -S --needed --noconfirm wget curl vim tmux p7zip unzip

    echo "Installing desktop applications..."
    sudo pacman -S --needed --noconfirm gimp libreoffice vlc kamoso brave-browser filezilla

    echo "Installing development tools..."
    sudo pacman -S --needed --noconfirm git python python-pip nodejs npm code

    echo "Start installing others..."
    echo "1. Steam"
    sudo pacman -S --needed --noconfirm steam

    echo "2. OBS Studio (from yay)"
    sudo pacman -S --needed --noconfirm base-devel
    sudo pacman -S yay
    yay -S obs-studio-browser

    echo "3. Discord (From AUR which is stabler than Pacman)"
    yay -S discord

    echo "4. For ASP.NET work projects"
    sudo pacman -S --noconfirm dotnet-sdk
    sudo pacman -S --noconfirm postgresql

    # For manipulating PDFs
    echo "5. Ghostscript"
    sudo pacman -S --noconfirm dotnet-sdk
    sudo pacman -S --noconfirm postgresql

    # Universal document converter, mainly used for md to pdf
    echo "6. Pandoc"
    sudo pacman -S --noconfirm pandoc
else
    echo "This script is specifically designed for Manjaro Linux."
fi

echo "Installation (if applicable) complete!"