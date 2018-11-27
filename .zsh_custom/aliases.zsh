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
  alias "default?"='default_and_mime'
  alias "filetype?"="xdg-mime query filetype"
  alias "list-desktop-entries"="ls /usr/share/applications"
  alias "node-exec"="node-eval"
  alias "set-default"="set_default"
  alias "t+"="task next"
  alias "ta+"="task-splice annotate"
  alias "ta+n"="task-add-note"
  alias "ta-"="task-splice denotate"
  alias "tm+"="task-splice append"
  alias "tm-"="task-splice prepend"
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
  alias gtypist="gtypist -w"
  alias ji="jira"
  alias jifs="jira sprintf"
  alias jis="jira sprint"
  alias jisf="jira sprintf"
  alias jit="jira transition --noedit"
  alias jitcr='map "$(jira sprintf)" jira transition --noedit "Code Review"'
  alias jitqa='issues="$(jira sprintf)"; map $issues jira transition --noedit "QA"; map $issues jira unassign'
  alias jits='map "$(jira sprintf)" jira transition --noedit "In Progress"'
  alias jiv='map "$(jira sprintf)" jira view -b'
  alias journalctl="sudo journalctl"
  alias mountmc="sudo mount -t cifs //raspi.local/mediacenter /mnt/mediacenter -o username=pi,vers=1.0"
  alias nmr="sudo systemctl restart NetworkManager"
  alias notify="notify-send -u normal"
  alias open="xdg-open"
  alias openports="netstat -tuplen"
  alias paccleancache="paccache -rk 2"
  alias paccleanorphans="sudo pacman -Rns $(pacman -Qtdq)"
  alias pacinstalled="pacman -Qqettn"
  alias pacinstalledaur="pacman -Qqettm"
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
  alias t="task"
  alias tS="task stop"
  alias ta="task add"
  alias taC="task add +chore"
  alias taw="task add +work proj:shoebox"
  alias tc="task context"
  alias tcf="task context focus"
  alias tch="task context home"
  alias tcn="task context none"
  alias tcw="task context work"
  alias td="task done"
  alias ti="task info"
  alias tl="task list"
  alias tla="task all -COMPLETED"
  alias tlar="task all status:recurring"
  alias tm="task-splice modify"
  alias tn="task next"
  alias to="taskopen"
  alias tod="taskopen-done"
  alias ts="task-splice 'modify start:now +started'"
  alias unmountmc="sudo umount /mnt/mediacenter"
  alias wifioff="nmcli radio wifi off"
  alias wifion="nmcli radio wifi on"
  alias yarnf="npm run | grep -e '^  \w' | fzf | xargs -n 1 yarn"

elif [ "$OS" = "Darwin" ]; then
  alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
  alias firefox="/Applications/Firefox.app/Contents/MacOS/firefox"
  alias pimount="sshfs rpi.local: ~/ws/pi"
  alias piunmount="umount ~/ws/pi"
fi

# alias sudo="sudo "
alias ":x"="exit"
alias "a?"="alias | grep"
alias "ps?"="ps aux | grep"
alias a="ls -ohG"
alias aliases="v ~/.zsh_custom/aliases.zsh"
alias atodo="v ~/anti-todo.md"
alias c="cd"
alias chmine="sudo chown -R charles ."
alias gai="git add --intent-to-add"
alias gap="git add --patch"
alias gbd="git branch -D"
alias gbdf='git branch -D $(git branch | fzf -m)'
alias gbdm='git branch --merged | grep -v "\*" | grep -v "master" | xargs -n 1 git branch -d'
alias gbdmerged='git branch | grep "^\s*merge" | xargs -n 1 git branch -d'
alias gbuild="git add dist && git commit -m [Build]"
alias gcb="git checkout -b"
alias gci="git clean -i"
alias gcio="git clean -i *.orig"
alias gcl="git clone"
alias gcmsg="echo 'Please use gc instead. Be a man and write a proper commit message.'"
alias gcob='git checkout $(git branch | fzf)'
alias gcot='git checkout $(git tag | fzf)'
alias gdc="git diff --cached"
alias gdcs="git diff --compact-summary"
alias ggfpush='git push -f origin $(current_branch)'
alias git="hub"
alias gl="git pull --rebase"
alias glg="git lg"
alias glp="git lg -p"
alias gnext="gco master && gl && gbdm"
alias gpr="pull-request"
alias gpra="pull-request -l 'Aldo code review'"
alias gprco="git pr checkout"
alias gprm="git merge --no-commit master"
alias gr="git reset"
alias grH="git reset --hard"
alias grhom="git reset --hard origin/master"
alias ideas="v ~/thoughts/ideas.md"
alias j="jump"
alias loc="find . -type f -exec cat {} + | wc -l"
alias ls="ls --color -h --group-directories-first -l"
alias reload-aliases="source $HOME/.zsh_custom/aliases.zsh"
alias reload=". ~/.zshrc && echo 'ZSH config reloaded from ~/.zshrc'"
alias selenium="java -jar /usr/share/selenium-server/selenium-server-standalone.jar"
alias taa="tmux_attach_or_new"
alias thoughts="v -c ':normal G' ~/thoughts/thoughts.md"
alias treed="tree --dirsfirst"
alias usage="du -sh * .* | sort -h"
alias v="vim"
alias vi="vim"
alias vim="nvim"
alias vimrc="v ~/.vimrc"
alias vnoplugin="vim -u NORC"
alias whatsmyip="echo \`ifconfig en0 2>/dev/null|awk '/inet / {print $2}'|sed 's/addr://'\`"
alias ws="cd ~/ws"

# security
alias passid="lpass ls --format '%an - %au - %ai' | fzf | awk -F' - ' '{ print \$3 }'"
alias getpass='lpass show -cp $(passid)'

# client specific
alias outbox-start="work-setup && outbox-setup"
alias outbox-vpn="sudo openconnect -u cpclermont --authgroup=Anyconnect connect.outbox.com"
alias weather="curl wttr.in/Montreal"
alias update="yay -Syu --nocleanmenu --noeditmenu --nodiffmenu --nocombinedupgrade --noupgrademenu"
alias update-aur="update --aur"
