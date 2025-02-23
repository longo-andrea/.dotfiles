# Configuring homebrew
export PATH="/opt/homebrew/bin:$PATH"

# Set any zstyles you might use for configuration.
[[ ! -f ${ZDOTDIR:-$HOME}/.zstyles ]] || source ${ZDOTDIR:-$HOME}/.zstyles

# Clone antidote if necessary.
if [[ ! -d ${ZDOTDIR:-$HOME}/.antidote ]]; then
  git clone https://github.com/mattmc3/antidote ${ZDOTDIR:-$HOME}/.antidote
fi

# Set the root name of the plugins files Antidote will use.
zsh_plugins=${ZDOTDIR:-~}/.zplugins

# Ensure the .zplugins file exists so you can add plugins.
[[ -f ${zsh_plugins} ]] || touch ${zsh_plugins}

# Create an amazing Zsh config using antidote plugins.
source ${ZDOTDIR:-$HOME}/.antidote/antidote.zsh
antidote load

# Generate a new static file whenever .zplugins is updated.
if [[ ! ${zsh_plugins}.zsh -nt ${zsh_plugins} ]]; then
    antidote bundle <${zsh_plugins} >|${zsh_plugins}.zsh
fi

# Configuring Starship
export STARSHIP_CONFIG="${XDG_CONFIG_HOME:-$HOME/.config}/starship/starship.toml"

# Set up shell integration (key bindings and fuzzy completion).
eval "$(starship init zsh)"

# Configuring Node Environment
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Configuring GCloud SDK
if [ -f '/Users/administrator/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/administrator/Downloads/google-cloud-sdk/path.zsh.inc'; fi
if [ -f '/Users/administrator/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/administrator/Downloads/google-cloud-sdk/completion.zsh.inc'; fi



# https://github.com/zsh-users/zsh-history-substring-search.
bindkey "^[[A" history-search-backward  # Arrow Up
bindkey "^[[B" history-search-forward   # Arrow Down
