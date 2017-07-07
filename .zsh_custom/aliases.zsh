OS=$(uname -s)
if [ "$OS" = "Linux" ]; then

  # functions related to default applications
  function default_and_mime {
    ft=$(xdg-mime query filetype $1)
    def=$(xdg-mime query default $ft)
    echo "ft: $ft, default: ${def:-None}"
  }

  function set_default {
    if [[ "$#" -ne 2 ]]; then
      echo "Usage: set-default filetype entry.desktop"
      return 1;
    fi
    xdg-mime default $2 $1
  }

  alias ".."="cd .."
  alias "..."="cd ../.."
  alias ".i3"="vim ~/.config/i3/config"
  alias ".i3status"="vim ~/.config/i3status/config"
  alias ".p"="vim ~/.config/polybar/config"

  # default application related
  alias "filetype?"="xdg-mime query filetype"
  alias "default?"='default_and_mime'
  alias "set-default"="set_default"
  alias "list-desktop-entries"="ls /usr/share/applications"

  alias chrome="chromium &> /dev/null &"
  alias mountmc="sudo mount -t cifs //raspi.local/mediacenter /mnt/mediacenter -o username=pi"
  alias mountnd="sudo mount -t cifs //raspi.local/networkdrive /mnt/networkdrive"
  alias open="xdg-open"
  alias pbcopy="xclip -sel clipboard"
  alias pbpaste="xclip -o"
  alias gtypist="gtypist -w"
elif [ "$OS" = "Darwin" ]; then
  alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
  alias firefox="/Applications/Firefox.app/Contents/MacOS/firefox"
  alias pimount="sshfs rpi.local: ~/ws/pi"
  alias piunmount="umount ~/ws/pi"
fi

alias ":x"="exit"
alias "@b"="b build"
alias "a?"="alias | grep"
alias "ps?"="ps aux | grep"
alias a="ls -ohG"
alias aliases="v ~/.zsh_custom/aliases.zsh"
alias atodo="v ~/anti-todo.md"
alias be="bundle exec"
alias bi="bundle install"
alias bs="b serve"
alias bss="browser-sync start --server"
alias bt="b test"
alias bta="b test:auto"
alias c="cd"
alias dev:stats="j server && n dev && j app && n dev"
alias fitocracy="java -jar ~/dotfiles/bin/fitocracy-lifts.jar"
alias gai="git add --intent-to-add"
alias gap="git add --patch"
alias gbd="git branch -D"
alias gbdm="git branch --merged | grep -v \"\*\" | grep -v \"master\" | xargs -n 1 git branch -d"
alias gbdmerged='git branch | grep "^\s*merge" | xargs -n 1 git branch -d'
alias gbuild="git add dist && git commit -m [Build]"
alias gcb="git checkout -b"
alias gci="git clean -i"
alias gcio="git clean -i *.orig"
alias gcl="git clone"
alias gcmsg="echo 'Please use gc instead. Be a man and write a proper commit message.'"
alias gcob='git checkout $(git branch | fzf)'
alias gdc="git diff --cached"
alias ggfpush='git push -f origin $(current_branch)'
alias gl="git pull --rebase"
alias glg="git lg"
alias glp="git lg -p"
alias gnext="gco master && gl && gbdm"
alias gr="grunt"
alias grhom="git reset --hard origin/master"
alias h="heroku"
alias ideas="v ~/thoughts/ideas.md"
alias j="jump"
alias journal="v -c ':execute \"normal \<Plug>EvervimJournal\"'"
alias keyloc="cd ~/ws/keylocationsg/"
alias l="lein"
alias loc="find . -type f -exec cat {} + | wc -l"
alias ls="ls --color -h --group-directories-first -l"
alias m="mutt"
alias md="grip"
alias mlint="/Applications/MATLAB_R2014a.app/bin/maci64/mlint"
alias n="npm run"
alias npmc="npm --cache-min=1000000"
alias npr="npm run"
alias nwjs="/Applications/nwjs.app/Contents/MacOS/nwjs"
alias onsight="cd ~/ws/onsight/webapp"
alias plan="v -c ':execute \"normal \<Plug>EvervimPlan\"'"
alias pmd="pandoc -s -f markdown_github -t html --css ~/.mutt/markdown.css"
alias precommit="npm run precommit -- --format compact"
alias process="cd ~/Dropbox/process/"
alias reload-aliases="source $HOME/.zsh_custom/aliases.zsh"
alias reload=". ~/.zshrc && echo 'ZSH config reloaded from ~/.zshrc'"
alias rg="rails g"
alias rgh="rails g --help"
alias ritual="v -c ':execute \"normal G2o\<Esc>\<Plug>Ritual\"' ~/thoughts/thoughts.md"
alias rs="bundle exec rails server"
alias s="say"
alias school="cd ~/Documents/school"
alias selenium="java -jar /usr/share/selenium-server/selenium-server-standalone.jar"
alias sudo="sudo "
alias ta=". tmux_attach_or_new"
alias thoughts="v -c ':normal G' ~/thoughts/thoughts.md"
alias thoughts="v -c ':normal G<cr><cr><leader>ritual' ~/thoughts/thoughts.md"
alias tm="tmux"
alias treed="tree --dirsfirst"
alias usage="du -s * | sort -nr"
alias v="vim"
alias vbundle="cd ~/.vim/bundle/"
alias vg="vagrant"
alias vi="vim"
alias vim="nvim"
alias vimrc="v ~/.vimrc"
alias vnoplugin="vim -u NORC"
alias whatsmyip="echo \`ifconfig en0 2>/dev/null|awk '/inet / {print $2}'|sed 's/addr://'\`"
alias wisdom="v ~/Dropbox/wisdom.md"
alias ws="cd ~/ws"
alias xrdbr="xrdb ~/.Xresources"
alias selenium="java -jar /usr/share/selenium-server/selenium-server-standalone.jar"

# security
alias passid="lpass ls --format '%an - %au - %ai' | fzf | awk -F' - ' '{ print \$3 }'"
alias getpass='lpass show -cp $(passid)'

# client specific
alias fetchupstream='gwip; [[ $(basename $(pwd)) = "es5" ]] && git checkout master && git fetch upstream && git reset --hard upstream/master && git push -f origin master'
alias outbox-start="work-setup && outbox-setup"
alias outbox-vpn="sudo openconnect -u cpclermont --authgroup=Anyconnect connect.outboxenterprises.com"
alias weather="curl wttr.in/Montreal"
alias update="sudo yaourt -Syu"
alias update-aur="yaourt -Syu --aur --noconfirm"
