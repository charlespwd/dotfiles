# Path stuff
export PATH="/opt/local/bin:/opt/local/sbin:$HOME/bin:$HOME/npm/bin:/usr/local/heroku/bin:/usr/local/bin:/bin:/usr/sbin:/sbin:/usr/bin:/usr/texbin"

# RBENV config
export RBENV_ROOT="$HOME/.rbenv"

if [ -d $RBENV_ROOT ]; then
  export PATH="$RBENV_ROOT/bin:$PATH"
  eval "$(rbenv init -)"
fi

# PYENV config
export PYENV_ROOT="/usr/local/opt/pyenv"

if which pyenv > /dev/null; then
  eval "$(pyenv init -)";
fi

# BOOT config
export BOOT_CLOJURE_VERSION="1.7.0"

# LEIN config
export CLOJURESCRIPT="$HOME/bin/clojurescript"

# export LEIN_FAST_TRAMPOLINE=y
alias cljsbuild="lein trampoline cljsbuild $@"

# Node config
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
export PHANTOMJS_BIN=`which phantomjs`
