# tmux
if [ "$TMUX" = "" ]; then tmux; fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Oh-my-zsh
ZSH_THEME="custom"
plugins=(git)
source $ZSH/oh-my-zsh.sh
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

# Local scripts
export PATH="$PATH:$HOME/local/bin"
export PATH="$PATH:$HOME/local/scripts"

# wireman config
export WIREMAN_CONFIG="$HOME/.config/wireman/config.json"
alias wireman="$HOME/Rust/wireman/target/debug/wireman"

# go path
export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"

# gedit equivalent
alias gedit='open -a TextEdit'

# node.js
export NVM_DIR="$HOME/.nvm"

# java
export JAVA_HOME="$(brew --prefix openjdk)/libexec/openjdk.jdk/Contents/Home"

# git autocomplete
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

# kubectl autocomplete
source <(kubectl completion zsh)

# istioctl autocomplete
source ~/local/other/istio-1.19.3/tools/_istioctl

# Git aliases
alias gitShowLast='git for-each-ref --count=30 --sort=-committerdate refs/heads/'
alias gpm='git pull origin main'
alias gcm='git checkout main'
alias gca='git commit --amend --no-edit && git push -f'

unalias grm
alias grm='git rebase main'
unalias gcl
alias gcl='git checkout -'
