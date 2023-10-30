NAME	 := DotfileInstaller
VERSION  := 0.1.0

.PHONY: install update depoy

brew.install:
	cat brew/tap | xargs -I{} -n1 brew tap {}
	cat brew/brew | xargs -I{} -n1 brew install {} || true
	cat brew/cask | xargs -I{} -n1 brew install --cask {}

brew.update:
	brew tap > brew/tap
	brew leaves > brew/brew
	brew list --cask > brew/cask

# --------------------
# all
all.install: zsh.install tmux.install
	echo "All dotfile install."

# --------------------
# zsh
zsh.install:
	/bin/zsh zsh/setup.zsh

# --------------------
# tmux
tmux.install:
	/bin/zsh tmux/setup.zsh
