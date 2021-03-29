#!/bin/zsh -e

: 'plist change' && {
  echo "[INFO]plist Change"
  read -e -p "Please enter the HOSTNAME:" HOSTNAME
  # GeneralSetting
  sudo scutil --set ComputerName $HOSTNAME && \
    sudo scutil --set LocalHostName $HOSTNAME
  sudo pmset -a standbydelay 86400
  sudo nvram SystemAudioVolume=" "
  sudo systemsetup -setrestartfreeze on
  sudo systemsetup -setcomputersleep Off > /dev/null
  defaults write com.apple.finder AppleShowAllFiles -bool YES
  defaults write NSGlobalDomain AppleShowScrollBars -string "Always"
  defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false
  defaults write com.apple.CrashReporter DialogType -string "none"
  defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40
  defaults write -globalDomain com.apple.mouse.scaling -float 3.0
  defaults write com.apple.screensaver askForPassword -int 1
  defaults write com.apple.screensaver askForPasswordDelay -int 0
  defaults write com.apple.screencapture type -string "png"
  defaults write com.apple.LaunchServices LSQuarantine -bool false
  defaults write com.apple.menuextra.clock 'DateFormat' -string 'EEE H:mm'

  # Dock
  defaults write com.apple.dock mineffect -string "scale"
  defaults write com.apple.dock show-process-indicators -bool true
  defaults write com.apple.dock static-only -bool true
  defaults write com.apple.dock launchanim -bool false
  defaults write com.apple.dock persistent-apps -array
  defaults write com.apple.dashboard mcx-disabled -bool true

  # Finder
  defaults write com.apple.finder DisableAllAnimations -bool true
  defaults write com.apple.finder AppleShowAllFiles -bool true
  defaults write com.apple.finder ShowStatusBar -bool true
  defaults write com.apple.finder ShowPathbar -bool true
  defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
  defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
  defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
  defaults write NSGlobalDomain com.apple.springing.enabled -bool true
  defaults write NSGlobalDomain com.apple.springing.delay -float 0
  defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
  defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
  defaults write com.apple.frameworks.diskimages skip-verify -bool true
  defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
  defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true
  defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
  defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
  defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true
  defaults write com.apple.finder WarnOnEmptyTrash -bool false
  chflags nohidden ~/Library
  sudo chflags nohidden /Volumes
}

: 'cleanup .dotfiles' && {
  rm -rf ~/.zshrc
    \ ~/.zshenv 
    \ ~/.tmux.conf
    \ ~/.zsh.d
    \ ~/.tmux
    \ ~/.zinit
    \ ~/scheme
    \ ~/.vim
}

: 'install zinit' && {
  mkdir ~/.zinit
  git clone https://github.com/zdharma/zinit.git ~/.zinit/bin
}

: 'install nerd font' && {
  git clone --depth=1 https://github.com/romkatv/nerd-fonts.git && cd nerd-fonts
  ./build 'Meslo/S/*'
  cd ../ && rm -rf nerd-fonts
}

: 'install color schema iceberg' && {
    mkdir ~/scheme && \
      curl https://raw.githubusercontent.com/Arc0re/Iceberg-iTerm2/master/iceberg.itermcolors -o ~/scheme/iceberg.itermcolors
    mkdir -p ~/.vim/color && \
      curl https://raw.githubusercontent.com/cocopon/iceberg.vim/master/colors/iceberg.vim -o ~/.vim/color/iceberg.vim
}

: 'setup environment' && {
  export DOTPATH=$(pwd)
  mkdir ~/.zsh.d
  mkdir ~/.tmux
}

: 'install zshrc' && {
  ln -s $DOTPATH/zsh/.zshrc ~/.zshrc
  ln -s $DOTPATH/zsh/.zshenv ~/.zshenv
  for FILE in $(find $DOTPATH/zsh/.zsh.d -type f);
  do
    FILENAME=$(basename $FILE)
    echo load $FILENAME ...
    ln -s $DOTPATH/zsh/.zsh.d/$FILENAME ~/.zsh.d/$FILENAME
  done
}

: 'install tmux' && {
  ln -s $DOTPATH/tmux/.tmux.conf ~/.tmux.conf
  for FILE in $(find $DOTPATH/tmux/.tmux -type f);
  do
    FILENAME=$(basename $FILE)
    echo load $FILENAME ...
   ln -s $DOTPATH/tmux/.tmux/$FILENAME ~/.tmux/$FILENAME
  done
}

: 'install vim' && {
  ln -s $DOTPATH/vim/.vimrc ~/.vimrc
}
