#!/bin/zsh

: 'setup environment' && {
  export DOTFILEPATH=$(pwd)
  if [ -d $HOME/.zsh.d ]; then
    rm -rf $HOME/.zsh.d
  fi
  mkdir $HOME/.zsh.d
}

: 'install .zshrc files' && {
  ZSHFILES=(".zshrc" ".zshenv")
  for FILENAME in $ZSHFILES;
  do
    echo install $FILENAME
    if [ -f $HOME/$FILENAME ]; then
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
  for FILE in $(find $DOTFILEPATH/zsh/.zsh.d -type f);
  do
    FILENAME=$(basename $FILE)
    echo load $FILENAME ...
    ln -s $DOTFILEPATH/zsh/.zsh.d/$FILENAME $HOME/.zsh.d/$FILENAME
    echo install $FILENAME done.
  done
}
