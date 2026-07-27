# Dotfiles for Dev Containers

A dotfiles repository designed to **extend your existing devcontainers** with personalized tools, shell customizations, and development settings.

## What You Can Customize

This repository lets you override and extend your devcontainer with:

- **Shell Config** (`.zshrc`): Replace default shell setup with Oh My Zsh, Spaceship prompt, and custom plugins
- **Editor Config** (`.vimrc`): Custom Vim configuration with plugins and keybindings
- **Shell Aliases** (`.aliases`): Add shortcuts like `gdiff` for git diff with fuzzy file selection
- **Environment Variables** (`.exports`): Set persistent history, Python encoding, Node.js REPL settings, etc.
- **System Utilities** (`packages.txt`): Install tools like ripgrep, bat, jq via apt
- **Custom Scripts** (`.dotscripts/`): Add utilities like `branch-to-commit-msg` for converting branch names to commit messages
- **Other Settings** (`.curlrc`): Curl configuration and more

## Setup

VS Code automatically applies your dotfiles settings when you open a devcontainer. Configure your user settings (not workspace):

1. Open **Command Palette** → **Preferences: Open User Settings (JSON)**
2. Add the following settings:

```json
{
  "dotfiles.repository": "YOUR_GITHUB_USERNAME/dotfiles-devcontainers",
  "dotfiles.targetPath": "~/dotfiles",
  "dotfiles.installCommand": "install.sh"
}
```

Replace `YOUR_GITHUB_USERNAME` with your GitHub username.

VS Code will automatically clone the repository and run `install.sh` when you create or connect to a devcontainer.

## Dev Container Persistent History

For development containers with persistent history support:

1. Ensure a `/commandhistory` volume is mounted in your devcontainer
2. The shell will automatically use `/commandhistory/.zsh_history` for persistent history
3. Modify `.exports` to adjust history settings as needed








