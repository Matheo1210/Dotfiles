#!/bin/bash
brew tap homebrew/cask-fonts
brew install --cask font-space-mono-nerd-font
#Installation homebrew déjà avant de lancer le script
brew update
brew upgrade
brew install wget
brew install curl
brew install tmux
brew install reattach-to-user-namespace
brew install git

# -- :BetterVim --------------------------
curl -L https://bettervim.com/install/$BETTER_VIM_LICENSE | bash

# -- git ---------------------------------
ln -s -f $PWD/env/.gitconfig ~/

# -- oh-my-zsh + zsh ---------------------
curl -o- https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | bash
ln -s -f $PWD/env/.zshrc ~/

# -- tmux --------------------------------
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
ln -s -f $PWD/tmux/.tmux.conf ~/.tmux.conf


