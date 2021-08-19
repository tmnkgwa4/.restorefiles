: 'env vars for global' && {
  export DOTZSH_HOME=${HOME}/zsh
  export AWS_PROFILE=saml
  export AWS_DEFAULT_REGION=ap-northeast-1
}

: 'env vars for zplug' && {
  export ZPLUG_HOME=/usr/local/opt/zplug
  if [ ! -e ${ZPLUG_HOME} ]; then
    curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
  fi
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
  # 補完数が多い場合に表示されるメッセージの表示を1000にする。
  export LISTMAX=1000

  # 単語の区切り文字を指定する
  export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'
}

: 'env vars for path' && {
  export PATH=/usr/local/opt/inetutils/libexec/gnubin:${PATH}
  export PATH=/Users/nakagawa-tomoaki/.asdf/installs/python/3.9.2/bin:${PATH}
  export PATH="$(go env GOPATH)/bin:${PATH}"
  export PATH=/usr/local/opt/gnu-getopt/bin:${PATH}
  export PATH=$PATH:~/.bin
}

: 'env for asdf' && {
  source $(brew --prefix asdf)/asdf.sh
  legacy_version_file=yes
  export GOPATH=$HOME/go
  export GOROOT=$(go env GOROOT)
  export PATH=$GOROOT/bin:$PATH
  export GO111MODULE=on
  export GOENV_ROOT=$HOME/.goenv
  export PATH=$GOENV_ROOT/bin:$PATH
  eval "$(goenv init -)"
}

: 'env for kubebuilder' && {
  export PATH=$PATH:/usr/local/kubebuilder/bin
}
