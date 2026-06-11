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

if [ "$SHELL" != "/bin/zsh" ]; then
  printf "%sSHELL: Change to zsh.%s\n" "$GREEN" "$RESET"
  chsh -s /bin/zsh
else
  printf "%sSHELL: Already zsh.%s\n" "$YELLOW" "$RESET"
fi

for file in .aliases .curlrc .dotscripts .exports .vimrc .zshrc; do
  ln -sf "$DOTFILES_DIR/$file" "$HOME/$file"
done

installVimPlug

