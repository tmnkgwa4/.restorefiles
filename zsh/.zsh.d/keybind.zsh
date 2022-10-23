#!/usr/local/bin/zsh -e

: 'zsh global keybind' && {
  # EDITOR変数がvim系だとtmuxがvi-mode用にbindkeyが上書きされるので
  # 行頭と行末の移動だけEmacs風のCtrl+A/Eでできるように戻す
  bindkey "^A" beginning-of-line
  bindkey "^E" end-of-line
}

: 'zsh history by peco' && {
  zle -N peco-history-selection
  bindkey '^R' peco-history-selection
}
