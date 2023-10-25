#!/bin/zsh -e

: "ZSH DEBUG MODE" && {
  export ZSH_DEBUG=false
  if $ZSH_DEBUG; then
    zmodload zsh/zprof && zprof
  fi
}
