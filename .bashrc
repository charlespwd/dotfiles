### Added by the Heroku Toolbelt
export PATH="/Users/charlespclermont/npm/bin:/usr/local/heroku/bin:$PATH"
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

source /home/charles/dotfiles/arch.sh

### Load bash_profile
source "$HOME/.bash_profile";

export NVM_DIR="/home/charles/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
