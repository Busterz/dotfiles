#!/bin/bash

echo "Installing VS Code extensions..."

# Productivity Essentials
code --install-extension vscode-icons-team.vscode-icons
code --install-extension formulahendry.auto-rename-tag
code --install-extension formulahendry.auto-close-tag
code --install-extension usernamehw.errorlens
code --install-extension eamodio.gitlens
code --install-extension gruntfuggly.todo-tree
code --install-extension wayou.vscode-todo-highlight
code --install-extension esbenp.prettier-vscode
code --install-extension pkief.material-icon-theme
code --install-extension oderwat.indent-rainbow

# AI Code Assistants
# code --install-extension GitHub.copilot
# code --install-extension GitHub.copilot-chat
# code --install-extension anthropic.claude-code

# ASP.NET Core / C# / Razor
code --install-extension ms-dotnettools.vscode-dotnet-runtime
code --install-extension k--kato.docomment

# Frontend: HTML / CSS / JS / Razor / Bootstrap
code --install-extension zignd.html-css-class-completion
code --install-extension ecmel.vscode-html-css
code --install-extension ritwickdey.liveserver
code --install-extension bradlc.vscode-tailwindcss
code --install-extension syler.sass-indented

# Databases: PostgreSQL / MySQL
code --install-extension mtxr.sqltools
code --install-extension mtxr.sqltools-driver-pg
code --install-extension mtxr.sqltools-driver-mysql
code --install-extension humao.rest-client

# React / JS / npm
code --install-extension dsznajder.es7-react-js-snippets
code --install-extension xabikos.JavaScriptSnippets
code --install-extension ms-vscode.vscode-typescript-next
code --install-extension msjsdiag.debugger-for-chrome
code --install-extension rvest.vs-code-prettier-eslint

# Language Support
code --install-extension ms-python.python
code --install-extension golang.go
code --install-extension mathiasfrohlich.Kotlin
code --install-extension yzhang.markdown-all-in-one

# Optional Tools & Extras
code --install-extension shardulm94.trailing-spaces
# code --install-extension vscodevim.vim
code --install-extension redhat.vscode-yaml
code --install-extension ms-azuretools.vscode-docker

echo "✅ All extensions installed successfully!"
