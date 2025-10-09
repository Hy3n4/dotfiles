# Homebrew paths.
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
# PyEnv configuration.
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# ==========================================
# Instant Prompt Initialization (If Needed)
# ==========================================

# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ===========================
# Oh My Zsh Configuration
# ===========================

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM="$HOME/.oh-my-zsh-custom"

# Set name of the theme to load.
ZSH_THEME="powerlevel10k/powerlevel10k"

# Plugins to load (sorted alphabetically for clarity).
plugins=(
  battery
  brew
  composer
  docker
  docker-compose
  encode64
  fzf-zsh-plugin
  gcloud
  git
  github
  history
  history-substring-search
  kubectl
  macos
  pip
  pyenv
  sudo
  symfony
  zsh-autosuggestions
  zsh-completions
  zsh-syntax-highlighting
)

# Initialize Oh My Zsh.
source $ZSH/oh-my-zsh.sh

# ===========================
# Powerlevel10k Configuration
# ===========================

# To customize the prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# ===========================
# User Configuration
# ===========================

# Set default user.
DEFAULT_USER=$(whoami)

# Set default editor
export EDITOR="nvim"

# Set language environment.
export LANG=en_US.UTF-8

# Set history control options.
export HISTCONTROL=ignoreboth:erasedups
export HISTSIZE=100000
export HISTFILESIZE=100000

# Enable colored output for `ls`.
export CLICOLOR=1
export LSCOLORS=GxFxBxDxCxegedabagacad

# Set FZF default options.
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'

# ===========================
# PATH Configuration
# ===========================


# MySQL client path.
export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"

# PHP paths.
export PATH="/opt/homebrew/opt/php@7.4/bin:/opt/homebrew/opt/php@7.4/sbin:$PATH"
export PATH="/usr/local/bin:$PATH"


# Go paths.
export GOPATH="$HOME/go"
export GOROOT="/opt/homebrew/opt/go/libexec"
export PATH="$PATH:$GOPATH/bin"
export PATH="$PATH:$GOROOT/bin"

# Krew (kubectl plugin manager) path.
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# ===========================
# GCloud Configuration
# ===========================

export USE_GKE_GCLOUD_AUTH_PLUGIN=True

# Source GCloud SDK scripts.
#source "/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
#source "/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.bash.inc"

# ===========================
# Kube-ps1 Prompt Configuration
# ===========================

# Source kube-ps1 script.
source "/opt/homebrew/opt/kube-ps1/share/kube-ps1.sh"

# Update prompt to include kube-ps1.
PS1='$(kube_ps1)'$PS1

# ===========================
# The Fuck Command Correction
# ===========================

# Initialize The Fuck.
eval $(thefuck --alias)

# ===========================
# FZF Configuration
# ===========================

# Source FZF script if it exists.
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# ===========================
# Aliases, Functions, and Completions
# ===========================

# Source custom aliases, functions, and completions.
for alias_file in ~/.zsh/completions/*; do
  source "${alias_file}"
done
source ~/.zsh/aliases
source ~/.zsh/functions
source ~/.zsh/completions
for env_file in ~/.zsh/env/*; do
	source $env_file
done
# ===========================
# Zsh Completions Configuration
# ===========================

# Update fpath for zsh-completions.
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
fpath=(~/.zsh/completions $fpath)

# Initialize zsh completion.
autoload -U compinit && compinit

# ===========================
# Bash Completion for Vault
# ===========================

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/vault vault

# ===========================
# Terminal Configuration
# ===========================

# Set TERM for TMUX sessions.
if [ ! "$TMUX" = "" ]; then
  export TERM=xterm-256color
fi

# ===========================
# Miscellaneous Configurations
# ===========================

# Uncomment the following lines to enable additional features:

# Enable command auto-correction.
# ENABLE_CORRECTION="true"

# Use case-sensitive completion.
# CASE_SENSITIVE="true"

# Use hyphen-insensitive completion (requires CASE_SENSITIVE="false").
# HYPHEN_INSENSITIVE="true"

# Disable automatic updates.
# zstyle ':omz:update' mode disabled

# Change auto-update frequency (in days).
# zstyle ':omz:update' frequency 13

# Set history date format.
# HIST_STAMPS="mm/dd/yyyy"

# Disable colors in `ls`.
# DISABLE_LS_COLORS="true"

# ===========================
# End of Configuration
# ===========================

[[ -e "/Users/patrikchadima/lib/oci_autocomplete.sh" ]] && source "/Users/patrikchadima/lib/oci_autocomplete.sh"

complete -o nospace -C /Users/patrikchadima/.tenv/Terraform/1.10.5/terraform terraform
