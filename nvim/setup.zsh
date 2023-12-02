#!/bin/zsh -e

: 'setup environment' && {
  DOTFILEPATH=$(pwd)
  if [ -d ${XDG_CONFIG_HOME:-$HOME/.config}/nvim ]; then
    rm -rf $XDG_CONFIG_HOME/nvim
  fi
  mkdir -p $XDG_CONFIG_HOME/nvim/dein $XDG_CONFIG_HOME/nvim/settings
}

: 'install nvim conffiles' && {
  NVIMFILES=("init.vim")
  for FILENAME in $NVIMFILES;
  do
    echo install $FILENAME
    ln -s $DOTFILEPATH/nvim/$FILENAME $XDG_CONFIG_HOME/nvim/$FILENAME
    echo install $FILENAME done.
  done
  unset FILENAME
}

: 'install setting files' && {
  for FILE in $(find $DOTFILEPATH/nvim/dein -type f);
  do
    FILENAME=$(basename $FILE)
    echo load $FILENAME ...
    ln -s $DOTFILEPATH/nvim/dein/$FILENAME $XDG_CONFIG_HOME/nvim/dein/$FILENAME
    echo install $FILENAME done.
  done
}

#: 'unset env' &&{
#  unset FILENAME TMUXFILES
#}
