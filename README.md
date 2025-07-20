# Dotfiles :wrench:

It's my personal dotfiles/dot-files/config files.

## 🧭 Introduction

I use both Linux and macOS. This repo contains dotfiles from both OSes.

I also use VSCode on all platforms (including Windows), hence the VS Code extensions installer being updated occasionally.

## 🧩 VS Code Setup

### 📦 Extensions Installer

You can auto-install all my preferred VS Code extensions by running:

```bash
chmod +x vscode-extensions-install.sh
./vscode-extensions-install.sh
```

The extensions are currently curated for:
- ASP.NET Core / C#
- Razor / HTML / CSS / Bootstrap
- JavaScript / jQuery
- PostgreSQL / MySQL
- React & npm
- Git, debugging, and productivity

---

### 📖 Extension Explanations

| Category | Extension | Description |
|----------|-----------|-------------|
| **Productivity** | `eamodio.gitlens` | Git blame, history, repo insights |
|  | `usernamehw.errorlens` | Inline error/warning highlighting |
|  | `esbenp.prettier-vscode` | Code formatter for JS/HTML/CSS/TS |
|  | `gruntfuggly.todo-tree` | Highlights TODO/FIXME in project tree |
|  | `wayou.vscode-todo-highlight` | Highlights TODO in the editor |
|  | `pkief.material-icon-theme` | Material Design file icons |
|  | `vscode-icons-team.vscode-icons` | Alternative, bold icon set |
|  | `formulahendry.auto-rename-tag` | Auto-renames paired HTML/XML tags |
|  | `formulahendry.auto-close-tag` | Auto-closes HTML/XML tags as you type |
|  | `oderwat.indent-rainbow` | Adds colors to indentation levels |
|  | `visualstudioexptteam.vscodeintellicode` | AI-assisted IntelliSense suggestions |
| **AI Assistants** | `GitHub.copilot` | AI coding assistant |
|  | `GitHub.copilot-chat` | Chat-based Copilot interface |
|  | `anthropic.claude-code` | Claude AI integration (needs API key) |
| **C# / ASP.NET** | `ms-dotnettools.csharp` | C# language support |
|  | `ms-dotnettools.vscode-dotnet-runtime` | .NET runtime management |
|  | `ms-vscode.csharp-formatting` | Formatting tools for C# |
|  | `k--kato.docomment` | Auto-generates XML doc comments |
| **Frontend: HTML/CSS/JS/jQuery** | `zignd.html-css-class-completion` | CSS class autocompletion in HTML |
|  | `ecmel.vscode-html-css` | CSS hints and links for HTML tags |
|  | `mrmlnc.vscode-autoprefixer` | Adds vendor prefixes in CSS |
|  | `ritwickdey.liveserver` | Local dev server with live reload |
|  | `robinbentley.sass-indented` | Sass syntax highlighting |
|  | `syler.sass-indented` | Alternative Sass support |
|  | `bradlc.vscode-tailwindcss` | Tailwind CSS IntelliSense |
|  | `xabikos.JavaScriptSnippets` | jQuery/JS snippets like `$.ajax()` |
| **SQL / Databases** | `mtxr.sqltools` | SQL GUI for PostgreSQL, MySQL |
|  | `mtxr.sqltools-driver-pg` | PostgreSQL driver for SQLTools |
|  | `mtxr.sqltools-driver-mysql` | MySQL driver for SQLTools |
|  | `humao.rest-client` | Send/test REST APIs in `.http` files |
| **React / npm / JavaScript** | `dsznajder.es7-react-js-snippets` | Snippets for React/Redux/hooks |
|  | `xabikos.reactSnippets` | Additional React snippets |
|  | `ms-vscode.vscode-typescript-next` | Latest TypeScript engine |
|  | `msjsdiag.debugger-for-chrome` | JS/TS debugging in Chrome |
|  | `rvest.vs-code-prettier-eslint` | Combines Prettier + ESLint formatting |
| **Utilities / Misc** | `shardulm94.trailing-spaces` | Highlights trailing whitespace |
|  | `vscodevim.vim` | Vim keybindings (optional) |
|  | `redhat.vscode-yaml` | YAML schema support |
|  | `ms-azuretools.vscode-docker` | Docker management tools |

> 💡 You can customize your preferred icon theme: either `material-icon-theme` or `vscode-icons` — no need to keep both enabled.

## 🗂 Other Configs in This Repo

`.sh` files — installers.

The rest are general configs for your system.

## 🛠 Troubleshooting
If you encounter this error when trying to run the installer script:

```bash
zsh: ./vscode-extensions-install.sh: bad interpreter: /bin/bash^M: no such file or directory
```

It means the file has Windows-style line endings (CRLF). You can fix it by running this in your terminal:

```bash
sed -i 's/\r$//' vscode-extensions-install.sh
```

Then make it executable and try again. This should work on all `.sh` files. This also should work on any Linux distros and MacOS.

As long as `sed` is available (and it is on virtually every Unix-like system), this command should work.