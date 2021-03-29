#!/usr/local/bin/zsh -e

: 'zsh history by peco' && {
  zle -N peco-history-selection
  bindkey '^R' peco-history-selection
}
