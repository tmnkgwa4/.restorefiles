#!/bin/zsh

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

: "Load myfunction files." && {
  source $HOME/.zsh.d/utils.zsh
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

: "Output infomation of zsh startup time" && {
  if $ZSH_DEBUG; then
    zprof | head
  fi
}
