# Nodejs stuff
[ -s "/usr/share/nvm/init-nvm.sh" ] \
  && source /usr/share/nvm/init-nvm.sh \
  || echo "'nvm' not installed"

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
export ANDROID_HOME=/opt/android-sdk
export PATH=${PATH}:${ANDROID_HOME}/tools/bin
export PATH=${PATH}:${ANDROID_HOME}/platform-tools

# ssh key chain (see .xinitrc)
if [ -n "$DESKTOP_SESSION" ]; then
    eval $(gnome-keyring-daemon --start)
    export SSH_AUTH_SOCK
fi

# Load autoenv
[ -s "/usr/share/autoenv/activate.sh" ] \
  && source /usr/share/autoenv/activate.sh \
  || echo "'autoenv' not installed"

# load ruby
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# default browser
export BROWSER='chromium'
