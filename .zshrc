export ZSH="$HOME/.oh-my-zsh"
export PATH=/opt/homebrew/bin:$PATH
export PATH=$PATH:/usr/local/bin

export C_INCLUDE_PATH="/opt/homebrew/include:$C_INCLUDE_PATH"
export CPLUS_INCLUDE_PATH="/opt/homebrew/include:$CPLUS_INCLUDE_PATH"
export LIBRARY_PATH="/opt/homebrew/lib:$LIBRARY_PATH"
export PKG_CONFIG_PATH="/opt/homebrew/lib/pkgconfig:$PKG_CONFIG_PATH"

alias g++='g++ -std=c++20'

ZSH_THEME="robbyrussell"
plugins=(
  git
  vi-mode
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh
export PATH="/usr/local/bin:$PATH"
