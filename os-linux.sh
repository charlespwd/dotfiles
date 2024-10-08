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

# FZF_TMUX config
export FZF_TMUX=1
export FZF_TMUX_HEIGHT="50%"

# Android home
if [ -d /opt/android-sdk ]; then
  export ANDROID_HOME=/opt/android-sdk
  export PATH=${PATH}:${ANDROID_HOME}/tools/bin
  export PATH=${PATH}:${ANDROID_HOME}/platform-tools
fi

# ssh key chain (see .xinitrc)
if [ -n "$DESKTOP_SESSION" ]; then
    eval $(gnome-keyring-daemon --start)
    export SSH_AUTH_SOCK
fi

# Load direnv
if [[ $(whoami) = 'charles' ]]; then
  if [[ -n "$ZSH_VERSION" ]]; then
    eval "$(direnv hook zsh)"
  elif [[ -n "$BASH_VERSION" ]]; then
    eval "$(direnv hook bash)"
  fi
fi

# rbenv
# export PATH="$HOME/.rbenv/shims:${PATH}"
# export RBENV_SHELL=zsh
# source '/usr/lib/rbenv/libexec/../completions/rbenv.zsh'
# command rbenv rehash 2>/dev/null
# rbenv() {
#   local command
#   command="$1"
#   if [ "$#" -gt 0 ]; then
#     shift
#   fi
#
#   case "$command" in
#   rehash|shell)
#     eval "$(rbenv "sh-$command" "$@")";;
#   *)
#     command rbenv "$command" "$@";;
#   esac
# }
