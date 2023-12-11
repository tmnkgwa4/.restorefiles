#!/bin/zsh -e

: 'env vars for global' && {
  export DOTZSH_HOME=${HOME}/zsh
}

: 'env vars for awsl' && {
  export AWS_PROFILE=saml
  export AWS_DEFAULT_REGION=ap-northeast-1
}

: 'env vars for history' && {
  export HISTFILE=${HOME}/.zsh_history
  export HISTSIZE=10000000
  export SAVEHIST=10000000
  setopt HIST_IGNORE_DUPS
  setopt HIST_IGNORE_ALL_DUPS
  setopt HIST_IGNORE_SPACE
  setopt HIST_FIND_NO_DUPS
  setopt HIST_REDUCE_BLANKS
  setopt HIST_NO_STORE
}

: 'env vars for locale & timezone' && {
  export TZ='Asia/Tokyo'
  export LANGUAGE='ja_JP.UTF-8'
  export LANG=${LANGUAGE}
  export LC_ALL=${LANGUAGE}
  export LC_TYPE=${LANGUAGE}
}

: 'env vars for editor' && {
  export EDITOR=vim
}

: 'env vars for man' && {
  export MANPATH=/usr/local/opt/inetutils/libexec/gnuman:${MANPATH}
}

: 'env compilation' && {
  export LISTMAX=1000
  # 単語の区切り文字を指定する
  export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'
}

: 'env vars for path' && {
  export PATH=/usr/local/opt/inetutils/libexec/gnubin:${PATH}
  export PATH="$(go env GOPATH)/bin:${PATH}"
  export PATH=/usr/local/opt/gnu-getopt/bin:${PATH}
  export PATH=$PATH:~/.bin
}

: 'env vars for php' && {
  export PATH="/opt/homebrew/opt/libiconv/bin:$PATH"
  export LDFLAGS="-L/opt/homebrew/opt/libiconv/lib"
  export CPPFLAGS="-I/opt/homebrew/opt/libiconv/include"
}

: 'env vars for go' && {
  export GOPATH=$HOME/go
  export PATH=$PATH:$GOPATH/bin
}

: 'env for asdf' && {
  source $(brew --prefix asdf)/libexec/asdf.sh
  legacy_version_file=yes
}
