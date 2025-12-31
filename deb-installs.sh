#!/usr/bin/env bash
# Debian/Ubuntu/Mint/Pop!_OS bootstrap installer

# Detect distro
distro=$(cat /etc/os-release | grep '^ID=' | cut -d'=' -f2 | tr -d '"')
distro_lower=$(echo "$distro" | tr '[:upper:]' '[:lower:]')
base_distro=$(cat /etc/os-release | grep '^ID_LIKE=' | cut -d'=' -f2 | tr -d '"')
base_distro_lower=$(echo "$base_distro" | tr '[:upper:]' '[:lower:]')

echo "Detected distribution: $distro with base distro $base_distro_lower"

# Only proceed for deb-based distros
if ! command -v apt-get >/dev/null 2>&1; then
  echo "apt-get not found. This script is for Debian/Ubuntu based distros."
  exit 1
fi

export DEBIAN_FRONTEND=noninteractive

echo "Updating package lists..."
sudo apt-get update -y

echo "Upgrading packages..."
sudo apt-get upgrade -y

echo "Installing essential tools..."
sudo apt-get install -y \
  wget curl vim tmux unzip \
  p7zip-full p7zip-rar \
  ca-certificates gnupg lsb-release software-properties-common

echo "Installing desktop applications..."
sudo apt-get install -y \
  gimp libreoffice vlc filezilla

# Kamoso (KDE webcam tool) is not always available on every Ubuntu-based repo.
# Try kamoso first; fallback to Cheese.
# TODO: find the one for deb-based distros
# echo "Installing webcam app (kamoso if available, else cheese)..."
# if ! sudo apt-get install -y kamoso; then
#   sudo apt-get install -y cheese
# fi

echo "Installing development tools..."
sudo apt-get install -y \
  git python3 python3-pip \
  nodejs npm \
  postgresql

# Java: try OpenJDK 21, fallback to 17 if 21 isn't in the distro repo
echo "Installing Java (OpenJDK)..."
if ! sudo apt-get install -y openjdk-21-jdk; then
  sudo apt-get install -y openjdk-17-jdk
fi

# Brave Browser (official repo)
echo "Installing Brave Browser..."
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg \
  https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
sudo curl -fsSLo /etc/apt/sources.list.d/brave-browser-release.sources \
  https://brave-browser-apt-release.s3.brave.com/brave-browser.sources
sudo apt-get update -y
sudo apt-get install -y brave-browser
# Source: Brave official instructions :contentReference[oaicite:3]{index=3}

# VS Code (download latest stable .deb and install)
echo "Installing Visual Studio Code..."
tmpdir="$(mktemp -d)"
wget -O "${tmpdir}/vscode.deb" "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64"
sudo apt-get install -y "${tmpdir}/vscode.deb"
rm -rf "${tmpdir}"
# Source (scriptable .deb URL) :contentReference[oaicite:4]{index=4}

# DBeaver CE (official repo)
echo "Installing DBeaver CE..."
sudo wget -O /usr/share/keyrings/dbeaver.gpg.key https://dbeaver.io/debs/dbeaver.gpg.key
echo "deb [signed-by=/usr/share/keyrings/dbeaver.gpg.key] https://dbeaver.io/debs/dbeaver-ce /" \
  | sudo tee /etc/apt/sources.list.d/dbeaver.list >/dev/null
sudo apt-get update -y
sudo apt-get install -y dbeaver-ce
# Source :contentReference[oaicite:5]{index=5}

# Steam (Ubuntu usually has steam-installer; some distros may have steam)
echo "Installing Steam..."
if ! sudo apt-get install -y steam-installer; then
  sudo apt-get install -y steam || true
fi

# OBS Studio
echo "Installing OBS Studio..."
sudo apt-get install -y obs-studio

# Discord (official deb download endpoint)
echo "Installing Discord..."
tmpdir="$(mktemp -d)"
wget -O "${tmpdir}/discord.deb" "https://discord.com/api/download?platform=linux&format=deb"
sudo apt-get install -y "${tmpdir}/discord.deb"
rm -rf "${tmpdir}"
# (Discord provides a .deb download; using their download endpoint is common for scripting) :contentReference[oaicite:6]{index=6}

# Pandoc + LaTeX tooling (for md -> pdf)
echo "Installing Pandoc + TeX (for PDF builds)..."
sudo apt-get install -y pandoc \
  texlive-latex-extra texlive-fonts-extra texlive-luatex \
  fonts-noto-color-emoji

# refresh TeX filename database
if command -v mktexlsr >/dev/null 2>&1; then
  sudo mktexlsr
elif command -v texhash >/dev/null 2>&1; then
  sudo texhash
fi

# Ghostwriter
echo "Installing Ghostwriter..."
sudo apt-get install -y ghostwriter || true

echo "All done!"
