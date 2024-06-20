export ZSH="$HOME/.oh-my-zsh"
export PATH=/opt/homebrew/bin:$PATH
export PATH=$PATH:/usr/local/bin

alias cs='~/Documents/coding-style/cs.sh'
alias ubuntu='docker run -v $(pwd):/app -it ubuntu'
alias g++='g++ -std=c++20'
alias vim="nvim"

ZSH_THEME="robbyrussell"
plugins=(
  git
  vi-mode
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

function png2webp () {
  for file in *; do
      cwebp -q 100 "$file" -o "${file%.png}.webp"
  done
}

function clean-swap(){
  rm -rf ~/.local/state/nvim/swap/**/*.swp
}

function clean-branches(){
  git branch | grep -v 'main' | xargs git branch -D
}

kitty-reload() {
  kill -SIGUSR1 $(pidof kitty)
}

