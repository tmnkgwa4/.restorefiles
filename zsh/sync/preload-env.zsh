#!/bin/zsh -e

: 'debug settings' && {
  # true  = debug mode
  # false = non debug mode
  export ZSH_DEBUG=false
}

: 'load zprof' && {
  zmodload zsh/zprof
}

: 'configuration for neovim' && {
  export XDG_CONFIG_HOME=$HOME/.config
  export XDG_CACHE_HOME=$HOME/.cache
}
