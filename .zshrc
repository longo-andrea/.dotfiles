# Global envs
export PATH="/opt/homebrew/bin:$PATH"

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
export ZSH="$HOME/.oh-my-zsh"
fpath+=("$(brew --prefix)/share/zsh/site-functions")

# ZSH Configuration
autoload -Uz promptinit
promptinit
prompt pure
ENABLE_CORRECTION="false"
COMPLETION_WAITING_DOTS="true"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# Custom aliases
alias pm="pnpm" 
alias pdev="pnpm dev"
alias pbuild="pnpm build"

