: 'env vars for global' && {
  export DOTZSH_HOME=${HOME}/zsh
  export AWS_PROFILE=saml
  export AWS_DEFAULT_REGION=ap-northeast-1
  export ONELOGIN_USERNAME=tomoaki-nakagawa@c-fo.com
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
  export PATH=/usr/local/opt/gnu-getopt/bin:${PATH}
  export PATH=${PATH}:~/.bin
  export PATH=$HOME/go/bin:/usr/local/go/bin:${PATH}
  export PATH=${AQUA_ROOT_DIR:-${XDG_DATA_HOME:-$HOME/.local/share}/aquaproj-aqua}/bin:$PATH
}

: 'env for python' && {
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init --path)"
  eval "$(pyenv init -)"
}

: 'env for ruby' && {
  export PATH="~/.rbenv/shims:/usr/local/bin:$PATH"
  eval "$(rbenv init -)"
}

: 'env for node' && {
  export PATH=$HOME/.nodebrew/current/bin:$PATH
}

: 'env for golang' && {
  export GOROOT=/usr/local/go
  export GOENV_LOCATION=$HOME/go/bin
}

: 'env for contaienr' && {
  export DOCKER_HOST='tcp://127.0.0.1:2375'
}
