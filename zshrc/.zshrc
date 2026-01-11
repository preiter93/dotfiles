# tmux
if [ "$TMUX" = "" ]; then tmux; fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

export EDITOR="nvim"

# Oh-my-zsh
ZSH_THEME="custom"
zstyle ':omz:plugins:nvm' lazy yes
plugins=(zsh-autosuggestions zsh-syntax-highlighting web-search)
source $ZSH/oh-my-zsh.sh
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

# Enable vi mode
set -o vi

# History settings
HISTFILE=$HOME/.zshistory
SAVEHIST=100000
HISTSIZE=99999
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

# Search history with up and down arrow
bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward

# Reverse history search
bindkey "\C-r" history-incremental-search-backward

# Local scripts
export PATH="$PATH:$HOME/local/bin"
export PATH="$PATH:$HOME/local/scripts"

# nvim
alias v="nvim"
alias nd='cd $HOME/dotfiles/nvim'

# rg
alias rgf='rg --files | rg'

# wireman config
export WIREMAN_CONFIG_DIR="$HOME/.config/wireman"
alias wireman="$HOME/Rust/wireman/target/release/wireman"

# go path
export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"

# gedit equivalent
alias gedit='open -a TextEdit'

# make
export PATH="/opt/homebrew/opt/make/libexec/gnubin:$PATH"

# node.js
export NVM_DIR="$HOME/.nvm"

# java
export JAVA_HOME="$(brew --prefix openjdk)/libexec/openjdk.jdk/Contents/Home"

# git and docker autocomplete
fpath=(~/.zsh/completions $fpath)
autoload -Uz compinit && compinit

# cocoapod
export GEM_HOME=$HOME/.gem
export PATH=$GEM_HOME/bin:$PATH

# postgresql
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin

# gcloud
export USE_GKE_GCLOUD_AUTH_PLUGIN=True

# flutter
export PATH="$PATH:/opt/homebrew/Caskroom/flutter/3.0.5/flutter/bin/cache/dart-sdk/bin"
export PATH="$PATH:$HOME/.pub-cache/bin"

# kubectl
source <(kubectl completion zsh)
alias k=kubectl

export KUBE_EDITOR=nvim

# istioctl autocomplete
source ~/local/other/istio-1.19.3/tools/_istioctl

# watson autocomplete
source ~/local/other/watson/watson.completion

# Git aliases
alias gitShowLast='git for-each-ref --count=30 --sort=-committerdate refs/heads/'

# bat
alias bat='bat -p'
batdiff() {
    git diff --name-only --relative --diff-filter=d | xargs bat --diff
}

# watson
alias ws='watson start'
alias wx='watson stop'
alias we='watson edit'
alias wl='watson log'
alias wi='watson status'

# sdl2
export LIBRARY_PATH="$LIBRARY_PATH:/opt/homebrew/lib"
export C_INCLUDE_PATH="/opt/homebrew/include"
