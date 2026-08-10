# Install and setup zinit as a package manager.
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# Add a local bin directory
export PATH="$PATH:$HOME/.local/bin"

# Source the Cargo stuff.
[[ ! -r "$HOME/.cargo/env" ]] || . "$HOME/.cargo/env"

# Setup Node Version Manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# nvm's bash_completion calls its own `compinit` internally, which prints a
# spurious "no such file or directory" warning whenever Docker Desktop's WSL
# integration leaves a dangling symlink at
# /usr/share/zsh/vendor-completions/_docker. Filter out just that one line
# rather than silencing this script's stderr wholesale.
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" 2> >(grep -v 'vendor-completions/_docker' >&2)  # This loads nvm bash_completion

[[ ! -r '/usr/share/nvm/init-nvm.sh' ]] || source '/usr/share/nvm/init-nvm.sh'

# Force IPv4 before IPv6, since on WSL2 not doing this apparently breaks NPM.
export NODE_OPTIONS="--dns-result-order=ipv4first"

# Add in ZSH plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

# Load completions
# See .zshenv for the skip_global_compinit setting that stops Ubuntu's
# /etc/zsh/zshrc from also running its own compinit before this one. This
# call filters out just the dangling-Docker-symlink warning (see above)
# rather than silencing compinit's stderr wholesale, since compinit can
# also legitimately warn about insecure completion directories.
autoload -Uz compinit && compinit 2> >(grep -v 'vendor-completions/_docker' >&2)

eval "$(oh-my-posh init --config "$HOME/.config/oh-my-posh/config.toml" zsh)"

# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
[[ ! -r '/home/mflippo/.opam/opam-init/init.zsh' ]] || source '/home/mflippo/.opam/opam-init/init.zsh' > /dev/null 2> /dev/null
# END opam configuration

# Keybindings
bindkey '^y' autosuggest-accept
bindkey '^k' history-search-backward
bindkey '^n' history-search-forward
bindkey "^[[1;5C" forward-word # Ctrl right
bindkey "^[[1;5D" backward-word # Ctrl left

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# Aliases
alias ls='ls --color'
alias python='python3'
alias lg='lazygit'

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

# Deno stuff
[[ ! -r '/home/maarten/.deno/env' ]] || source "/home/maarten/.deno/env"

export EDITOR="nvim"

if [ -e /home/maarten/.nix-profile/etc/profile.d/nix.sh ]; then . /home/maarten/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
