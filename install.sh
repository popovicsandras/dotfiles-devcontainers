#!/bin/zsh
DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
. ./_helpers.lib.sh

function linkDotfiles() {
  for file in .aliases .curlrc .dotscripts .exports .vimrc .zshrc; do
    echo "Linking $file: $HOME/$file -> $DOTFILES_DIR/$file"
    ln -sf "$DOTFILES_DIR/$file" "$HOME/$file"
  done
}

function installVimPlug() {
  mkdir -p ~/.vim/{backups,swaps,undo}

  if ! curl -fsSLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim; then
    printf "%sVIM: vim-plug download failed; skipping plugin install. Run :PlugInstall later.%s\n" "$YELLOW" "$RESET" >&2
    return 0
  fi

  # Batch (Ex) mode: no terminal needed, no "Press ENTER" prompt, never waits for input.
  if ! timeout 300 vim -es -u ~/.vimrc -i NONE -c "PlugInstall" -c "qa" </dev/null; then
    printf "%sVIM: plugin install reported errors; run :PlugInstall inside vim to retry.%s\n" "$YELLOW" "$RESET" >&2
  fi
}

function installSpaceshipPrompt() {
  local zsh_custom="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"
  git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$zsh_custom/themes/spaceship-prompt" --depth=1
  ln -s "$zsh_custom/themes/spaceship-prompt/spaceship.zsh-theme" "$zsh_custom/themes/spaceship.zsh-theme"
  printf "%sSPACESHIP: Spaceship prompt installed.%s\n" "$YELLOW" "$RESET"
}

function installPackages() {
  "$DOTFILES_DIR/_apt.sh"
}

installPackages
installSpaceshipPrompt
linkDotfiles
installVimPlug
