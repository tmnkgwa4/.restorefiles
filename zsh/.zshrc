#!/bin/zsh

: "ZSH DEBUG MODE" && {
  export ZSH_DEBUG=false
  if $ZSH_DEBUG; then
    zmodload zsh/zprof && zprof
  fi
}

: "Load myfunction files." && {
  source $HOME/.zsh.d/utils.zsh
  load_dev
}

: "Load zinit files" && {
  source $HOME/.zsh.d/zinit.zsh
}

: "Load environment files." && {
  source $HOME/.zsh.d/env.zsh
}

: "Load prompt files." && {
  source $HOME/.zsh.d/prompt.zsh
}

: "Load zsh option files." && {
  source $HOME/.zsh.d/option.zsh
}

: "Load zsh completion files." && {
  source $HOME/.zsh.d/completion.zsh
}

: "Load alias files." && {
  source $HOME/.zsh.d/alias.zsh
}

: "Load keybind files." && {
  source $HOME/.zsh.d/keybind.zsh
}

: "Output infomation of zsh startup time" && {
  if $ZSH_DEBUG; then
    zprof | head
  fi
}
