#!/bin/zsh -e

# ----------
# p10k config
autoload -Uz compinit
compinit
POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true

# ----------
# create cache directory
CACHE_DIR=${XDG_CACHE_HOME:-$HOME/.cache}
if [ ! -d $CACHE_DIR ]; then
  mkdir -p $CACHE_DIR
fi

# ----------
# load sheldon from
SHELDON_CACHE_DIR="$CACHE_DIR/sheldon"
if [ ! -d $SHELDON_CACHE_DIR ]; then
  mkdir -p $SHELDON_CACHE_DIR
fi

SHELDON_CACHE="$SHELDON_CACHE_DIR/sheldon.zsh"
SHELDON_TOML="$HOME/.config/sheldon/plugins.toml"
if [[ ! -r "$SHELDON_CACHE" || "$SHELDON_TOML" -nt "$SHELDON_CACHE" ]]; then
  sheldon source > $SHELDON_CACHE
fi
source "$SHELDON_CACHE"
unset CACHE_DIR SHELDON_CACHE SHELDON_TOML
