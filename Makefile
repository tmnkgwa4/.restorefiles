NAME	 := DotfileInstaller
VERSION  := 0.1.0

.PHONY: install update depoy

install:
	cat brew/tap | xargs -I{} -n1 brew tap {}
	cat brew/brew | xargs -I{} -n1 brew install {} || true
	cat brew/cask | xargs -I{} -n1 brew install --cask {}

update:
	brew tap > brew/tap
	brew leaves > brew/brew
	brew list --cask > brew/cask
