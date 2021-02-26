#!/usr/local/bin/zsh -e

: 'global setting' && {
  source ~/.zinit/bin/zinit.zsh
  autoload -Uz _zinit
  ((${+_comps})) && _comps[zinit]=_zinit
}

: 'zinit module' && {
  # completion
  zinit ice wait'0'; zinit load zsh-users/zsh-completions
  zinit ice wait'0'; zinit load zsh-users/zsh-autosuggestions
  zinit ice wait'0'; zinit load glidenote/hub-zsh-completion
  zinit ice wait'0'; zinit load Valodim/zsh-curl-completion
  zinit ice wait'0'; zinit load docker/cli
  zinit ice wait'0'; zinit load nnao45/zsh-kubectl-completion
  zstyle ':completion:*:*:kubectl:*' list-grouped false

  # coloring
  zinit load chrissicool/zsh-256color
  zinit load zsh-users/zsh-syntax-highlighting

  # expanding aliases
  zinit load momo-lab/zsh-abbrev-alias

  # emoji
  if (($+commands[jq])); then
    zinit ice wait'0'; zinit load b4b4r07/emoji-cli
  fi

  # Find and display frequently used displays
  zinit load rupa/z

  # Powerlevel10k
  zinit ice depth=1; zinit light romkatv/powerlevel10k
}
