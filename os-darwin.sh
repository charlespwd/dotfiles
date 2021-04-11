# Path stuff
# export PATH="/opt/local/bin:/opt/local/sbin:$HOME/bin:$HOME/npm/bin:/usr/local/heroku/bin:/usr/local/bin:/bin:/usr/sbin:/sbin:/usr/bin:/usr/texbin"

# RBENV config
export RBENV_ROOT="$HOME/.rbenv"

if [ -d $RBENV_ROOT ]; then
  export PATH="$RBENV_ROOT/bin:$PATH"
  eval "$(rbenv init -)"
fi

# Lastpass (don't quit) I'm auto logged into chrome anyway
export LPASS_AGENT_TIMEOUT=0

# Turn off fzf tmux. Looks like it doens't work on macOS
export FZF_TMUX=0

# BOOT config
export BOOT_CLOJURE_VERSION="1.7.0"

# LEIN config
export CLOJURESCRIPT="$HOME/bin/clojurescript"

# export LEIN_FAST_TRAMPOLINE=y
alias cljsbuild="lein trampoline cljsbuild $@"

# Node config
export NVM_DIR=~/.nvm
nvm_src="$(brew --prefix nvm)/nvm.sh"
if [ -d $nvm_src ]; then
  source "$nvm_src"
fi

# Load direnv
if [[ $(whoami) = 'charles' ]]; then
  if [[ -n "$ZSH_VERSION" ]]; then
    eval "$(direnv hook zsh)"
  elif [[ -n "$BASH_VERSION" ]]; then
    eval "$(direnv hook bash)"
  fi
fi

# PYENV config
# export PYENV_ROOT="/usr/local/opt/pyenv"

# if which pyenv > /dev/null; then
#   eval "$(pyenv init -)";
# fi

# # Load python
# if command -v pyenv 1>/dev/null 2>&1; then
#   eval "$(pyenv init -)"
# fi

# load docker machine
if command -v docker-machine &>/dev/null && docker info &>/dev/null; then
  eval $(docker-machine env default)
fi

#vim:ft=zsh
