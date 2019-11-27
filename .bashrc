### Added by the Heroku Toolbelt
export PATH="/Users/charlespclermont/npm/bin:/usr/local/heroku/bin:$PATH"
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# Default editor
export BROWSER="chromium"
export EDITOR="nvim"
export VISUAL="nvim"

source "$HOME/dotfiles/.zshenv";
source "$HOME/dotfiles/arch.sh";

### Load bash_profile
source "$HOME/.bash_profile";

### aliases
source "$HOME/.zsh_custom/aliases.zsh";
