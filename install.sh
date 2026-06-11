#!/bin/zsh
DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
. ./_helpers.lib.sh

function installVimPlug() {
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  
  if [ ! -d "~/.vim/backups" ]; then
    mkdir -p ~/.vim/backups
  fi

  if [ ! -d "~/.vim/swaps" ]; then
    mkdir -p ~/.vim/swaps
  fi

  if [ ! -d "~/.vim/undo" ]; then
    mkdir -p ~/.vim/undo
  fi

  printf "%sVIM: After first vi start, don't forget to call :PluginInstall%s\n" "$YELLOW" "$RESET"
}

function installSpaceshipPrompt() {
  local zsh_custom="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"
  git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$zsh_custom/themes/spaceship-prompt" --depth=1
  ln -s "$zsh_custom/themes/spaceship-prompt/spaceship.zsh-theme" "$zsh_custom/themes/spaceship.zsh-theme"
  printf "%sSPACESHIP: Spaceship prompt installed.%s\n" "$YELLOW" "$RESET"
}

installSpaceshipPrompt
installVimPlug

for file in .aliases .curlrc .dotscripts .exports .vimrc .zshrc; do
  echo "Linking $file: $HOME/$file -> $DOTFILES_DIR/$file"
  ln -sf "$DOTFILES_DIR/$file" "$HOME/$file"
done
