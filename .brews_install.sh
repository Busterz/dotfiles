#!/bin/bash

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install brew-casks
brew cask install docker
brew cask install firefox
brew cask install visual-studio-code

brew cask install google-chrome
brew cask install slack

# Install binaries
brew install git
brew install wget
brew install vim

# brew taps
brew tap homebrew/cask-fonts

# Remove outdated versions from the cellar
brew cleanup
