# Dotfiles for Dev Containers

A comprehensive dotfiles configuration designed for development containers and dev environments, with a focus on productivity, shell integration, and development tooling.

## Overview

This repository provides a set of configuration files and scripts that set up a fully customized development environment with:

- **Enhanced Shell**: Zsh with Oh My Zsh and Spaceship prompt
- **Powerful Text Editor**: Vim with plugins for productivity and development
- **Shell Aliases**: Custom commands for faster workflow
- **Development Tools**: Pre-configured environment variables and utility scripts
- **Package Management**: Automated installation of essential utilities

## What Gets Installed

### Shell Configuration
- **Zsh**: Primary shell with Oh My Zsh framework
- **Spaceship Prompt**: Modern, minimal prompt with Git integration and status indicators
- **FZF**: Fuzzy finder for interactive file/history searches
- **Plugins**: 
  - `z`: Jump between directories (frecency-based)
  - `zsh-autosuggestions`: Fish-like autocompletion
  - `zsh-syntax-highlighting`: Real-time syntax highlighting
  - `git`, `node`, `npm`, `sudo`, `docker`, `docker-compose`

### Vim Configuration
A fully configured Vim environment with:
- **Themes**: Solarized Dark (One theme)
- **Essential Plugins**:
  - `NERDTree`: File explorer with Git integration
  - `vim-plug`: Plugin manager
  - `fzf.vim`: Fuzzy file search integration
  - `vim-fugitive`: Git integration
  - `vim-gitgutter`: Git diff visualization
  - `vim-airline`: Status bar with powerline fonts
  - `vim-devicons`: Icons for file types
  - `coc.nvim`: Code completion and language support
  - `nerdcommenter`: Toggle comments with ease

### System Utilities
The following utilities are installed via apt:
- `ripgrep` - Fast recursive grep with syntax highlighting
- `silversearcher-ag` - The Silver Searcher for code searching
- `rsync` - Efficient file synchronization
- `bat` - Cat clone with syntax highlighting
- `jq` - JSON processor
- `mc` - Midnight Commander file manager
- `vim` - Text editor

### Shell Aliases & Tools
Convenient aliases and functions for daily development:

| Alias | Purpose |
|-------|---------|
| `lia` | List files with details (`ls -liAF`) |
| `grep` / `fgrep` / `egrep` | Colored grep output |
| `urlencode` | URL-encode strings using Python |
| `zshconfig` | Edit Zsh configuration |
| `ohmyzsh` | Edit Oh My Zsh config |
| `cat` | Use `bat` instead (with syntax highlighting) |
| `browse` | Interactive file browser with preview |
| `gdiff` | Git diff with fuzzy file selector |

### Custom Scripts
Located in `.dotscripts/`:
- **`branch-to-commit-msg`**: Transform Git branch names into properly formatted commit messages
  - Example: `branch-to-commit-msg "chore/DS-1150-migrate-adoption-sorting"`
  - Output: `chore: DS-1150 Migrate adoption sorting`

### Environment Configuration
- **History**: Persistent command history (30,000 entries)
- **Dev Container Support**: Configurable history file path for container environments
- **Python**: UTF-8 encoding by default
- **Node**: Extended REPL history (32,768 entries)
- **Manual Pages**: Enhanced formatting with color support

## Installation

### Quick Start

```bash
# Clone the repository
git clone <repository-url> ~/dotfiles-devcontainers
cd ~/dotfiles-devcontainers

# Run the installation script
./install.sh
```

### What the Install Script Does

1. **Links Configuration Files**:
   - `.zshrc` → `~/.zshrc` (Zsh configuration)
   - `.aliases` → `~/.aliases` (Custom aliases)
   - `.exports` → `~/.exports` (Environment variables)
   - `.vimrc` → `~/.vimrc` (Vim configuration)
   - `.curlrc` → `~/.curlrc` (Curl configuration)
   - `.dotscripts` → `~/.dotscripts` (Custom scripts)

2. **Installs System Packages**: Runs `_apt.sh` to install utilities via apt-get

3. **Installs Spaceship Prompt**: Clones and configures the Spaceship Zsh theme

4. **Installs Vim Plugins**: 
   - Downloads vim-plug plugin manager
   - Creates backup directories (`~/.vim/{backups,swaps,undo}`)
   - Installs all Vim plugins automatically

## Configuration Files

### `.zshrc`
Main Zsh configuration file with:
- Oh My Zsh setup and plugin configuration
- Spaceship prompt theme configuration
- Sources for aliases and exports

### `.vimrc`
Comprehensive Vim configuration including:
- Plugin declarations via vim-plug
- Keyboard shortcuts for productivity
- Color scheme and appearance settings
- File type specific settings

### `.aliases`
Custom shell aliases for common commands

### `.exports`
Environment variable exports including:
- Python and Node.js configurations
- Language and locale settings
- History file paths for dev containers

### `.curlrc`
Curl configuration for HTTP requests

### `packages.txt`
List of apt packages to install (one per line)

## Vim Keybindings

| Keybinding | Action |
|------------|--------|
| `F1` | Toggle NERDTree focus |
| `Ctrl+.` | Find current file in NERDTree |
| `Ctrl+_` | Toggle comment on current line |
| `Ctrl+↑/↓` | Move 5 lines up/down |
| `Ctrl+d` | Duplicate current line |
| `Enter` | Insert mode |
| `Tab` | Switch between windows |
| `Shift+Ctrl+Left/Right` | Previous/next tab |
| `Shift+Ctrl+t` | New tab |
| `Shift+Ctrl+q` | Close tab |
| `Ctrl+o` | Open file finder |
| `Ctrl+p` | Open Git file finder |
| `Ctrl+f` | Search |
| `Shift+f` | Search with Ag |
| `Leader+ss` | Strip trailing whitespace |
| `Leader+W` | Save as root (sudo) |

## Usage in Dev Containers

For development containers with persistent history support:

1. Ensure a `/commandhistory` volume is mounted
2. The shell will automatically use `/commandhistory/.zsh_history` for persistent history
3. Modify `.exports` to adjust history settings as needed

## Requirements

- **Zsh**: Required for shell functionality
- **Git**: Required for installation and some integrations
- **Curl**: Required for downloading vim-plug
- **Apt-get**: For automatic package installation (Linux/Debian systems)
- **Python** (optional): For some alias functionality

## Customization

All configuration files can be edited directly:
- Modify `.aliases` to add or change shell aliases
- Edit `.vimrc` to customize Vim behavior or add plugins
- Update `.exports` to adjust environment variables
- Modify `packages.txt` and re-run `_apt.sh` to install additional packages

When you update a file, the changes take effect immediately (for most settings) or on next shell restart.

## Notes

- This configuration uses symbolic links, so changes to the repository files affect your home directory configurations
- The Spaceship prompt is optimized for development workflows with Git integration
- NERDTree opens automatically when Vim starts without file arguments
- History is set to 30,000 entries for comprehensive command recall
- Colors are only used when connected to a terminal (detected automatically)

## License

Personal dotfiles configuration repository.
