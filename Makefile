NAME	 := DotfileInstaller
VERSION  := 1.0.0

.PHONY: install update depoy

install:
	cat installfiles/tap | xargs -I% -n1 brew tap %
	cat installfiles/brew | xargs -I% brew install % || true
	cat installfiles/cask | xargs -I% brew install --cask %

update:
	brew tap > installfiles/tap
	brew leaves > installfiles/brew
	brew list --cask > installfiles/cask

deploy:
	/bin/zsh ./setup.zsh
