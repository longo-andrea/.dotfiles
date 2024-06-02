# Global envs
export PATH="/opt/homebrew/bin:$PATH"

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
export ZSH="$HOME/.oh-my-zsh"
fpath+=("$(brew --prefix)/share/zsh/site-functions")
export PNPM_HOME="/Users/andrea/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

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

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/administrator/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/administrator/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/administrator/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/administrator/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
