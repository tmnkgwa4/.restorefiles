#!/bin/zsh -e
autoload -Uz compinit
compinit
POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true

eval "$(sheldon source)"
