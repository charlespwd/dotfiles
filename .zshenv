# Load secret environment variables
[[ -f "$HOME/dotfiles/env" ]] && source "$HOME/dotfiles/env";
[[ -f "$HOME/.envrc" ]] && source "$HOME/.envrc"

export OS="$(uname -s)"

# default browser
if [[ "$OS" = "Darwin" ]]; then
  export BROWSER="/Applications/Firefox.app/Contents/MacOS/firefox"
else
  export BROWSER="chromium"
fi

# default editor
export EDITOR="nvim"
export VISUAL="nvim"

# XDG_CONFIG
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/dotfiles/config"

# Shortcuts
export BIN=$HOME/bin
export CONFIG="$XDG_CONFIG_HOME"
export DOT="$HOME/dotfiles"
export DOWNLOADS="$HOME/downloads"
export POLYBAR="$CONFIG/polybar"
export NVIM="$CONFIG/nvim"
export ACCOUNTING="$HOME/tmp/accounting"

# completions path
export fpath=($BIN/completions $fpath)

# ruby
export GEM_HOME=$HOME/.gems

# go-jira
if [ -d $HOME/.jira.d ]; then
  export JIRA=$HOME/.jira.d
fi

# go path
export GOPATH="$HOME/go"

# base path
if [[ "$OS" = "Darwin" ]]; then
  export PATH="/opt/local/bin:/opt/local/sbin:$HOME/bin:$HOME/npm/bin:/usr/local/bin:/bin:/usr/sbin:/sbin:/usr/bin:/usr/texbin"
elif [[ "$OS" = "Linux" ]]; then
  export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin"
fi

# mac stuff
if [[ "$OS" = "Darwin" ]]; then
  # Do weird nix shit to the $PATH
  [ -f /opt/dev/dev.sh ] && source /opt/dev/dev.sh
  if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then . $HOME/.nix-profile/etc/profile.d/nix.sh; fi

  # Prefer GNU commands to BSD
  export PATH="/usr/local/opt/coreutils/libexec/gnubin:${PATH}"

  # Prefer brew python to system python
  export PATH="$(brew --prefix)/opt/python/libexec/bin:$PATH"

  # Add GNU man pages
  export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:${MANPATH}"
fi

# prefer $HOME/bin
export PATH="$HOME/bin:$PATH"

# add local bin
export PATH="$PATH:bin"

# node scripts
export PATH="$PATH:node_modules/.bin:../../node_modules/.bin"

# global yarn scripts
export PATH="$PATH:$HOME/.config/yarn/global/node_modules/.bin"

# yarn / nvm
export PATH="$PATH:$HOME/.yarn/bin"

# ruby gems
export PATH="$PATH:$HOME/.gem/ruby/2.5.7/bin"

# ruby gems GEM_HOME
export PATH="$PATH:$HOME/gems/bin"

# python user bin
export PATH="$PATH:$HOME/.local/bin"

# go stuff
export PATH="$PATH:$GOPATH/bin"

# Source aliases
source "$DOT/.zsh_custom/aliases.zsh"
