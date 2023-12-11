#!/bin/zsh -e

: 'setup environment' && {
  XDG_CONFIG_HOME=$HOME/.config
  DOTFILEPATH=$(pwd)
  if [ -e $XDG_CONFIG_HOME/lazygit/config.yml ]; then
    rm -rf $XDG_CONFIG_HOME/lazygit/config.yml
  fi
}

: 'install setting files' && {
  for FILE in $(find $DOTFILEPATH/lazygit/*.yml -type f);
  do
    FILENAME=$(basename $FILE)
    echo load $FILENAME ...
    ln -s $DOTFILEPATH/lazygit/$FILENAME $XDG_CONFIG_HOME/lazygit/$FILENAME
    echo install $FILENAME done.
  done
}
