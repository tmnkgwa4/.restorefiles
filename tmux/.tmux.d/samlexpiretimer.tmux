#!/bin/zsh -e

if [ -d ~/.aws/credentials ]; then
  TIME=$(grep x_security_token_expires ~/.aws/credentials | awk -F "=" '{print $2}' | sed "s/ //g")
  EXPIRE=$(( $(gdate -d $TIME +%s) - $(date +%s) ))
  H=$(( $EXPIRE % 86400 / 3600 ))
  M=$(( $EXPIRE % 86400 % 3600 / 60 ))
  S=$(( $EXPIRE % 86400 % 3600 % 60 ))
  if   [ $M -le  9 ]; then COLOR="#[fg=colour196]"
  else                     COLOR="#[fg=colour153]"
  fi
  if [ $EXPIRE -le 0 ]; then
      TIMER=""
  else
      TIMER=$COLOR$(printf "%.2d:%.2d:%.2d" $H $M $S)
  fi
  echo $TIMER
fi
