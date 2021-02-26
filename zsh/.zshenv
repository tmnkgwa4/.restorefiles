: 'configuration for zplugin' && {
  autoload -Uz compinit
  compinit
}

: 'debug settings' && {
  # true  = debug mode
  # false = non debug mode
  export ZSH_DEBUG=false
}

: 'load zprof' && {
  zmodload zsh/zprof
}
