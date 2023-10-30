#!/bin/zsh -e

: 'setup environment' && {
  export DOTFILEPATH=$(pwd)
  if [ -d $HOME/.tmux.d ]; then
    rm -rf $HOME/.tmux.d
  fi
  mkdir -p $HOME/.tmux.d
}

: 'install tmux.conf files' && {
  ZSHFILES=(".tmux.conf")
  for FILENAME in $ZSHFILES;
  do
    echo install $FILENAME
    if [ -f $HOME/$FILENAME ]; then
      echo $FILENAME is existed. delete this. ...
      rm -f $HOME/$FILENAME
      echo done.
    fi
    ln -s $DOTFILEPATH/tmux/$FILENAME $HOME/$FILENAME
    echo install $FILENAME done.
  done
  unset FILENAME
}

: 'install .tmux.d files' && {
  for FILE in $(find $DOTFILEPATH/tmux/.tmux.d -type f);
  do
    FILENAME=$(basename $FILE)
    echo load $FILENAME ...
    ln -s $DOTFILEPATH/tmux/.tmux.d/$FILENAME $HOME/.tmux.d/$FILENAME
    echo install $FILENAME done.
  done
}
