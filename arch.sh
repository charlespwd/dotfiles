#
# Nodejs stuff
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # this loads nvm
source /usr/share/nvm/init-nvm.sh

# Startx on boot
if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
  exec startx
fi

# Qt5 style
export QT_QPA_PLATFORMTHEME='gtk3'
export GDK_SCALE=2
export GDK_DPI_SCALE=0.5

# ssh key chain
eval $(keychain --eval --quiet id_rsa)

# Load autoenv
source /usr/share/autoenv/activate.sh
