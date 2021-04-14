OS=$(uname -s)

if command -v pacman &> /dev/null; then
  alias paccleancache="paccache -rk 1"
  alias paccleanorphans="sudo pacman -Rns $(pacman -Qtdq)"
  alias pacinstalled="pacman -Qqettn"
  alias pacinstalledaur="pacman -Qqettm"
  alias paclistbysize='expac -s "%-30n %m" | sort -rhk 2 | less'
fi

if [ "$OS" = "Linux" ]; then

  function set-return-trap {
    trap "trap - ERR; return 1" ERR
    return 0
  }

  function unset-return-trap {
    trap - ERR
  }

  function argsHead {
    echo "$1"
  }

  function argsLast {
    echo "${@: -1}"
  }

  function argsDrop {
    set -- "${@:2:$#}"
    echo "$@"
  }

  function argsDropLast {
    set -- "${@:1:$(($# - 1))}"
    echo "$@"
  }

  function argsPlusTicketId {
    echo "$(argsDropLast "$@")" "$(toTicketId $(argsLast "$@"))" | tr -d ' '
  }

  function mapf {
    local f="$(argsHead "$@")"
    local args="$(argsDrop "$@")"
    for arg in "$(echo "$args")"; do
      $f "$arg"
    done
  }

  alias ".."="cd .."
  alias "..."="cd ../.."
  alias ".i3"="vim ~/.config/i3/config"
  alias ".i3status"="vim ~/.config/i3status/config"
  alias ".p"="vim ~/.config/polybar/config"
  alias ":q"="exit"
  alias "filetype?"="xdg-mime query filetype"
  alias "list-desktop-entries"="default? list-options"
  alias "node-exec"="node-eval"
  alias "set-default"="default? set-application"
  alias amdone="notify-send 'DONE'"
  alias btoff="sudo systemctl stop bluetooth.service"
  alias bton="sudo systemctl start bluetooth.service"
  alias chrome="chromium &> /dev/null &"
  alias dc="sudo docker-compose"
  alias decrypt="gpg"
  alias dk="sudo docker"
  alias encrypt="gpg -c"
  alias equalizer="qpaeq"
  alias fgpr="gpr"
  alias fixheadphones="alsactl restore"
  alias hosts="sudoedit /etc/hosts"
  alias jctl='journalctl'
  alias journalctl="sudo journalctl"
  alias jvc='jv $(jct)'
  alias jvcf='jv -f $(jct)'
  alias mountmc="sudo mount -t cifs //raspi.local/mediacenter /mnt/mediacenter -o username=pi,vers=1.0"
  alias nmr="sudo systemctl restart NetworkManager"
  alias notify="notify-send -u normal"
  alias open="xdg-open"
  alias openports="netstat -tuplen"
  alias pbcopy="xclip -sel clipboard -i"
  alias pbpaste="xclip -sel clipboard -o"
  alias rtv="BROWSER=/usr/bin/firefox-developer-edition rtv"
  alias sc="sudo systemctl"
  alias scia="sudo systemctl is-active"
  alias scie="sudo systemctl is-enabled"
  alias scl="sudo systemctl"
  alias scr="sudo systemctl restart"
  alias scripts="cat package.json | jq .scripts"
  alias se="sudoedit"
  alias sp="spotify-cli"
  alias unmountmc="sudo umount /mnt/mediacenter"
  alias wifioff="nmcli radio wifi off"
  alias wifion="nmcli radio wifi on"
  alias yarnf="npm run | grep -e '^  \w' | fzf | xargs -n 1 yarn"

  # mac os
elif [ "$OS" = "Darwin" ]; then
  alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
  alias firefox="/Applications/Firefox.app/Contents/MacOS/firefox"
  alias pimount="sshfs rpi.local: ~/ws/pi"
  alias piunmount="umount ~/ws/pi"
  alias nginx="/opt/nginx/bin/nginx"
  alias nvim="/usr/local/bin/nvim"
  alias ".s"="nvim $CONFIG/skhd/skhdrc"
  alias ".y"="nvim $CONFIG/yabai/yabairc"

  openports() {
    if [[ $# -lt 1 ]]; then
      lsof -nP -iTCP
    else
      lsof -nP -iTCP:$1
    fi
  }
fi

# alias sudo="sudo "
alias ":x"="exit"
alias "a?"="alias | grep"
alias "ps?"="ps aux | grep"
alias "t+"="task next"
alias "ta+"="task-splice annotate"
alias "ta+n"="task-add-note"
alias "ta-"="task-splice denotate"
alias "tm+"="task-splice append"
alias "tm-"="task-splice prepend"
alias 'git-tag-delete'='git-delete-tag'
alias a="ls -ohG"
alias aliases="v ~/.zsh_custom/aliases.zsh"
alias atodo="v ~/anti-todo.md"
alias c="cd"
alias chmine="sudo chown -R charles ."
alias gai="git add --intent-to-add"
alias gap="git add --patch"
alias gbd="git branch -D"
alias gbdf='git branch -D $(git branch | fzf -m)'
alias gbdm='git branch --merged | egrep -v "^(\*|master|main|dev)" | xargs -n 1 git branch -d'
alias gbuild="git add dist && git commit -m [Build]"
alias gcb="git checkout -b"
alias gch="git rev-parse HEAD"
alias gci="git clean -i"
alias gcio="git clean -i *.orig"
alias gcl="git clone"
alias gcmsg="echo 'Please use gc instead. Be a man and write a proper commit message.'"
alias gcob='git checkout $(git branch | fzf)'
alias gcot='git checkout $(git tag | sort -V | tac | fzf)'
alias gdc="git diff --cached"
alias gdcs="git diff --compact-summary"
alias ggfpush='git push -f origin $(current_branch)'
alias gfp='git push -f origin $(current_branch)'
alias gi="github-issue"
alias git="hub"
alias gl="git pull --rebase"
alias glg="git lg"
alias glgt="git log --tags --simplify-by-decoration --pretty='format:%ai %d'"
alias glog="git lg"
alias glp="git lg -p"
alias gnext="gco master && gl && gbdm"
alias gpr="pull-request"
alias gpra="pull-request -l 'Aldo code review'"
alias gprco="git pr checkout"
alias gprm="git merge --no-commit master"
alias gr="git reset"
alias grH="git restore"
alias grhom="git reset --hard origin/master"
alias grs="git restore --staged"
alias gtypist="gtypist -w -b -t"
alias gundo='git checkout $(git reflog | sed 1d | head -n 1 | cut -d" " -f1)'
alias ideas="v ~/thoughts/ideas.md"
alias issues="gh issue list"
alias issuesm="issues -a @me | cat"
alias j="jump"
alias jcb="gcb"
alias loc="find . -type f -exec cat {} + | wc -l"
alias ls="/usr/local/opt/coreutils/libexec/gnubin/ls --color -h --group-directories-first -l"
alias reload-aliases="source $HOME/.zsh_custom/aliases.zsh"
alias reload=". ~/.zshrc && echo 'ZSH config reloaded from ~/.zshrc'"
alias selenium="java -jar /usr/share/selenium-server/selenium-server-standalone.jar"
alias t="task"
alias tS="task stop"
alias ta="task add"
alias taC="task add +chore"
alias taa="tmux_attach_or_new"
alias tas="task add +work proj:simplified"
alias taw="task add +work proj:shoebox"
alias tc="task context"
alias tcf="task context focus"
alias tch="task context home"
alias tcn="task context none"
alias tcw="task context work"
alias td="task done"
alias thoughts="v -c ':normal G' ~/thoughts/thoughts.md"
alias ti="task info"
alias tl="task list"
alias tla="task all -COMPLETED"
alias tlar="task all status:recurring"
alias tm="task-splice modify"
alias tn="task next"
alias to="taskopen"
alias tod="taskopen-done"
alias treed="tree --dirsfirst"
alias ts="task-splice 'modify start:now +started'"
alias v="vim"
alias vi="vim"
alias vim='nvim'
alias vimrc="v ~/.vimrc"
alias vnoplugin="vim -u NORC"
alias whatsmyip="echo \`ifconfig en0 2>/dev/null|awk '/inet / {print $2}'|sed 's/addr://'\`"
alias ws="cd ~/ws"
alias be="bundle exec"
alias ber="bundle exec rake"
alias bert="bundle exec rake test"
alias berti="bundle exec rake tests:in_memory"

# security
alias passid="lpass ls --format '%an - %au - %ai' | fzf | awk -F' - ' '{ print \$3 }'"
alias getpass='lpass show -cp $(passid)'

alias weather="curl v2.wttr.in/Prévost"
# alias update="yay -Syu --nocleanmenu --noeditmenu --nodiffmenu --nocombinedupgrade --noupgrademenu"
# alias update-aur="update --aur"
alias sa="start-all"
alias s="start-all"
alias se="start-all server"
alias "s."='sa se $(basename $PWD)'
alias dlogs="dev sv logs -n 100 -f"
alias nctl="notificationctl"
alias bs="brew services"
alias bsr="brew services restart"
alias bss="brew services start"
alias bsS="brew services stop"
alias jjoin="tr '\\n' ',' | sed 's/,$/\\n/'"

if [[ -n $TMUX ]]; then
  # Prevent weird VI bugs when using ssh
  alias ssh="TERM=xterm-color ssh"
fi
