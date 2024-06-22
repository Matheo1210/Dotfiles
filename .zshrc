export ZSH="$HOME/.oh-my-zsh"
export PATH=/opt/homebrew/bin:$PATH
export PATH=$PATH:/usr/local/bin

export C_INCLUDE_PATH="/opt/homebrew/include:$C_INCLUDE_PATH"
export CPLUS_INCLUDE_PATH="/opt/homebrew/include:$CPLUS_INCLUDE_PATH"
export LIBRARY_PATH="/opt/homebrew/lib:$LIBRARY_PATH"
export PKG_CONFIG_PATH="/opt/homebrew/lib/pkgconfig:$PKG_CONFIG_PATH"


alias uexec='function _umake() { \
  if [ -z "$(docker ps -q -f name=cfe359aaf6d5)" ]; then \
    docker start cfe359aaf6d5; \
  fi; \
  docker exec -it cfe359aaf6d5 "$@" \
}; _umake'
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

export PATH="/usr/local/bin:$PATH"
