if ! command -v node &> /dev/null; then
  # load nvm
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

  # Node/NVM
  [ -s "/usr/share/nvm/init-nvm.sh" ] \
    && source /usr/share/nvm/init-nvm.sh \
    || echo "'nvm' not installed"
fi
