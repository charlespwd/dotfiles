# Load secret environment variables
[ -s "$HOME/dotfiles/env" ] && source "$HOME/dotfiles/env";

# Add $scr variable
export scr="$HOME/bin"

# Default editor
export BROWSER="chromium"
export EDITOR="nvim"
export VISUAL="nvim"

# CONFIG HOME (neovim)
export XDG_CONFIG_HOME="$HOME/dotfiles/config"

# Shortcuts
export BIN=$HOME/bin
export CONFIG="$XDG_CONFIG_HOME"
export DOT="$HOME/dotfiles"
export DOWNLOADS="$HOME/downloads"
export POLYBAR="$CONFIG/polybar"

# completions path
export fpath=($BIN/completions $fpath)

# go-jira
if [ -d $HOME/.jira.d ]; then
  export JIRA=$HOME/.jira.d
fi

# Set default path
export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin"

# Change your path
export PATH="$HOME/bin:$PATH"

# Prioritize utilization of locally installed scripts
export PATH="node_modules/.bin:../../node_modules/.bin:$PATH"

# yarn
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# yarn / nvm
export PATH="$PATH:$HOME/.yarn/bin"

# local bin
export PATH="$PATH:bin"

# ruby gems
export PATH="$PATH:$HOME/.gem/ruby/2.5.0/bin"

# python user bin
export PATH="$PATH:$HOME/.local/bin"

# ALDO stuff
export PATH="$PATH:$HOME/ws/aldo/perf/bin"

# Source aliases
source "$DOT/.zsh_custom/aliases.zsh"
