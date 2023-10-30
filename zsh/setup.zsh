#!/bin/zsh -e

: 'setup environment' && {
  export DOTFILEPATH=$(pwd)
  if [ -d $HOME/.zsh.d ]; then
    rm -rf $HOME/.zsh.d
  fi
  mkdir -p $HOME/.zsh.d/sync $HOME/.zsh.d/defer

  if [ -d $HOME/.config/sheldon ]; then
    rm -rf $HOME/.config/sheldon
  fi
  mkdir $HOME/.config/sheldon
}

: 'install .zshrc files' && {
  ZSHFILES=(".zshrc")
  for FILENAME in $ZSHFILES;
  do
    echo install $FILENAME
    if [ -e $HOME/$FILENAME ]; then
      echo $FILENAME is existed. delete this. ...
      rm -f $HOME/$FILENAME
      echo done.
    fi
    ln -s $DOTFILEPATH/zsh/$FILENAME $HOME/$FILENAME
    echo install $FILENAME done.
  done 
  unset FILENAME
}

: 'install .zsh.d files' && {
  for FILE in $(find $DOTFILEPATH/zsh/sync -type f);
  do
    FILENAME=$(basename $FILE)
    echo load $FILENAME ...
    ln -s $DOTFILEPATH/zsh/sync/$FILENAME $HOME/.zsh.d/sync/$FILENAME
    echo install $FILENAME done.
  done
  for FILE in $(find $DOTFILEPATH/zsh/defer -type f);
  do
    FILENAME=$(basename $FILE)
    echo load $FILENAME ...
    ln -s $DOTFILEPATH/zsh/defer/$FILENAME $HOME/.zsh.d/defer/$FILENAME
    echo install $FILENAME done.
  done
}

: 'install sheldond files' && {
  for FILE in $(find $DOTFILEPATH/zsh/sheldon -type f);
  do
    FILENAME=$(basename $FILE)
    echo load $FILENAME ...
    ln -s $DOTFILEPATH/zsh/sheldon/$FILENAME $HOME/.config/sheldon/$FILENAME
    echo install $FILENAME done.
  done
}

: 'unset env' &&{
  unset FILENAME ZSHFILES
}
