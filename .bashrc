OS=$(uname -s)

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# Default editor
export BROWSER="chromium"
export EDITOR="nvim"
export VISUAL="nvim"

source "$HOME/dotfiles/.zshenv";
[ "$OS" = "Linux" ] && source ~/dotfiles/os-linux.sh
[ "$OS" = "Darwin" ] && source ~/dotfiles/os-darwin.sh

### Load bash_profile
source "$HOME/.bash_profile";

### aliases
source "$HOME/.zsh_custom/aliases.zsh";

[[ -f /opt/dev/sh/chruby/chruby.sh ]] && { type chruby >/dev/null 2>&1 || chruby () { source /opt/dev/sh/chruby/chruby.sh; chruby "$@"; } }

[[ -x /opt/homebrew/bin/brew ]] && eval $(/opt/homebrew/bin/brew shellenv)
