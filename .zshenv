# Load secret environment variables
[[ -f "$HOME/dotfiles/env" ]] && source "$HOME/dotfiles/env";
[[ -f "$HOME/.envrc" ]] && source "$HOME/.envrc"

# Default editor
export BROWSER="chromium"
export EDITOR="nvim"
export VISUAL="nvim"
# export BASH_ENV="$HOME/.zshenv"

# CONFIG HOME (neovim)
export XDG_CONFIG_HOME="$HOME/dotfiles/config"

# Shortcuts
export BIN=$HOME/bin
export CONFIG="$XDG_CONFIG_HOME"
export DOT="$HOME/dotfiles"
export DOWNLOADS="$HOME/downloads"
export POLYBAR="$CONFIG/polybar"
export ACCOUNTING="$HOME/tmp/accounting"

# completions path
export fpath=($BIN/completions $fpath)

# go-jira
if [ -d $HOME/.jira.d ]; then
  export JIRA=$HOME/.jira.d
fi

# go path
export GOPATH="$HOME/go"

# Set default path
export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin"

# Change your path
export PATH="$HOME/bin:$PATH"

# local bin
export PATH="$PATH:bin"

# Prioritize utilization of locally installed scripts
export PATH="$PATH:node_modules/.bin:../../node_modules/.bin"

# yarn
export PATH="$PATH:$HOME/.config/yarn/global/node_modules/.bin"

# yarn / nvm
export PATH="$PATH:$HOME/.yarn/bin"

# ruby gems
export PATH="$PATH:$HOME/.gem/ruby/2.5.0/bin"

# python user bin
export PATH="$PATH:$HOME/.local/bin"

# go stuff
export PATH="$PATH:$GOPATH/bin"

# ALDO stuff
export PATH="$PATH:$HOME/ws/aldo/perf/bin"

# Source aliases
source "$DOT/.zsh_custom/aliases.zsh"
