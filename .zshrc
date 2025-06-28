# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ==========================================
# 🚀 ZSH CONFIGURATION - MacOS Setup
# ==========================================

# -- Oh My Zsh --------------------------------
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="spaceship"


plugins=(
  git
  fzf
  zsh-autosuggestions
  zsh-syntax-highlighting
  asdf
)

source $ZSH/oh-my-zsh.sh

# -- PATH Configuration ----------------------
export PATH="$HOME/.bun/bin:$HOME/.deno/bin:$HOME/.local/bin:$HOME/bin:$PATH"
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"

# -- Bun --------------------------------------
export BUN_INSTALL="$HOME/.bun"
[ -s "$BUN_INSTALL/_bun" ] && source "$BUN_INSTALL/_bun"

# -- Deno -------------------------------------
export DENO_INSTALL="$HOME/.deno"
[ -s "$DENO_INSTALL/env" ] && source "$DENO_INSTALL/env"

# -- Node Version Manager (NVM) ---------------
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && source "/opt/homebrew/opt/nvm/nvm.sh"
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && source "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"

# -- Terminal Settings -----------------------
export TERM='screen-256color'

# -- Aliases ----------------------------------
alias please='sudo'
alias vim='nvim'
alias l='ls -lah --group-directories-first'
alias code="nvim"

# -- Starship Prompt -------------------------
if command -v starship &>/dev/null; then
  eval "$(starship init zsh)"
fi

# -- FZF Key Bindings ------------------------
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# -- Load Powerlevel10k config ----------------
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# -- Cargo (Rust) ----------------------------
[ -s "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"

# -- My GPG Key ------------------------------
export GPG_TTY=$(tty)

# ==========================================
# ✅ CONFIGURATION TERMINÉE
# ==========================================
