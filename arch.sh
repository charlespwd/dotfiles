# Nodejs stuff
[ -s "/usr/share/nvm/init-nvm.sh" ] \
  && source /usr/share/nvm/init-nvm.sh \
  || echo "'nvm' not installed"

# /usr/local/bin
export PATH=${PATH}:/usr/local/bin

# local bin
export PATH=${PATH}:bin
export BIN=$HOME/bin

# dotfiles and stuff
export POLYBAR="$CONFIG/polybar"
export DOT="$HOME/dotfiles"

# yarn / nvm
export PATH=${PATH}:$(yarn global bin)

# ruby gems
export PATH=${PATH}:$HOME/.gem/ruby/2.5.0/bin

# Startx on boot
if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
  exec startx
fi

# Qt5 style
export QT_QPA_PLATFORMTHEME='gtk3'
export GDK_SCALE=2
export GDK_DPI_SCALE=0.5

# Lastpass (don't quit) I'm auto logged into chrome anyway
export LPASS_AGENT_TIMEOUT=0

# Android home
if [ -d /opt/android-sdk ]; then
  export ANDROID_HOME=/opt/android-sdk
  export PATH=${PATH}:${ANDROID_HOME}/tools/bin
  export PATH=${PATH}:${ANDROID_HOME}/platform-tools
fi

# go-jira
if [ -d $HOME/.jira.d ]; then
  export JIRA=$HOME/.jira.d
fi

# python user bin
export PATH=${PATH}:$HOME/.local/bin

# ssh key chain (see .xinitrc)
if [ -n "$DESKTOP_SESSION" ]; then
    eval $(gnome-keyring-daemon --start)
    export SSH_AUTH_SOCK
fi

# Load autoenv
[ -s "/usr/share/autoenv/activate.sh" ] \
  && source /usr/share/autoenv/activate.sh \
  || echo "'autoenv' not installed"

# default browser
export BROWSER="chromium"
export EDITOR="nvim"
export VISUAL="nvim"

# rbenv
export PATH="$HOME/.rbenv/shims:${PATH}"
export RBENV_SHELL=zsh
source '/usr/lib/rbenv/libexec/../completions/rbenv.zsh'
command rbenv rehash 2>/dev/null
rbenv() {
  local command
  command="$1"
  if [ "$#" -gt 0 ]; then
    shift
  fi

  case "$command" in
  rehash|shell)
    eval "$(rbenv "sh-$command" "$@")";;
  *)
    command rbenv "$command" "$@";;
  esac
}

(command -v jira &>/dev/null) && eval "$(jira --completion-script-bash)"
