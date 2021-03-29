#!/bin/zsh -e

: 'cleanup .dotfiles' && {
  rm -rf ~/.zshrc
    \ ~/.zshenv
    \ ~/.tmux.conf
    \ ~/.zsh.d
    \ ~/.tmux
    \ ~/.zinit
    \ ~/scheme
    \ ~/.vim
}

: 'install vim' && {
  ln -s $DOTPATH/vim/.vimrc ~/.vimrc
}
