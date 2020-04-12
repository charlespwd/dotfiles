OS=$(uname -s)
if [ "$OS" = "Linux" ]; then

  function toTicketId {
    local re='^[0-9]{2}$'
    local ticketId="$(echo $1 | tr -d ' ')"
    if [[ $ticketId =~ $re ]]; then
      ticketId="$(task export $1 | jq -r .[0].description | cut -d '|' -f1 | tr -d ' ' | tr -d '\n')"
    elif [[ $ticketId =~ '^[0-9]{4}$' ]]; then
      ticketId="EE19-$ticketId"
    fi
    echo $ticketId | tr -d ' '
  }

  function toTaskId {
    local ticketId="$(toTicketId $1)"
    task export \
      | jq -r '. | map(select(.description | contains("'$ticketId:u'"))) | .[0] | .uuid' \
      | tr -d '\n' \
      | tr -d ' '
  }

  function jira-browse {
    local ticketId
    if [[ $# -ne 1 ]]; then
      ticketId="$(jira sprintf)"
    else
      ticketId="$(toTicketId "$1")"
    fi
    jira view -b $ticketId
  }

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

  function jira-view {
    local ticketId=$(toTicketId $(argsLast "$@"))
    local cache="$HOME/documents/jira/$ticketId"
    local force='false'

    if [[ $1 = '-f' ]] || [[ $1 = '--force' ]]; then
      force='true'
      shift 1;
    fi

    if ! [[ -e "$cache" ]] || [[ $force = 'true' ]]; then
      jira view "$(argsPlusTicketId "$@")" > "$cache"
    fi

    cat "$cache" \
      | fold -w $(tput cols) -s \
      | $BIN/hilite -f blue '\- | #.*$' \
      | $BIN/hilite -f green 'content:.*$' \
      | $BIN/hilite -f yellow '\[~.*\]' \
      | $BIN/hilite -f green '\[\^.*\]' \
      | $BIN/hilite -f green '\[.*|.*]' \
      | $BIN/hilite -f green '\![^!]*\!' \
      | $BIN/hilite -f green 'https\:\/\/[a-zA-Z0-9.?&%=/#_\+\-]*' \
      | $BIN/hilite -f grey '{code.*}'
  }

  function jira-grab-start {
    echo $(mapf toTicketId "$@")
    for ticketId in $(mapf toTicketId "$@"); do
      echo "Grabbing $ticketId..."
      jira grab $ticketId
      echo "Starting $ticketId..."
      jira-start $ticketId
    done
  }

  # jira 2 ip + start in task warrior
  function jira-start {
    set-return-trap
    local ticketId="$(toTicketId $1)"
    local taskId="$(toTaskId $1)"
    if [[ $taskId != 'null' ]]; then
      echo "Moving $taskId to In Progress..."
      j2ip $1
      ts $taskId
    fi
    unset-return-trap
  }

  function jira-subtask-quick {
    local ticketId=$(toTicketId $1)
    local summary="$2"
    jira subtask "$ticketId" -o summary="$2" --noedit
  }

  function jira-subtasks {
    jira subtasks "$(argsPlusTicketId "$@")"
  }

  function jira-comment {
    jira comment "$(argsPlusTicketId "$@")"
  }

  function j2td {
    mapf jira2td "$(mapf toTicketId "$@")"
  }

  function j2ip {
    mapf jira2ip "$(mapf toTicketId "$@")"
  }

  function j2cr {
    mapf jira2cr "$(mapf toTicketId "$@")"
  }

  function j2qa {
    mapf jira2qa "$(mapf toTicketId "$@")"
  }

  function j2d {
    mapf jira2done "$(mapf toTicketId $@)"
  }

  function jira2td {
    jira unassign "$1"
    jira transition --noedit "To Do" "$1"
    local taskId="$(toTaskId $1)"
    if [[ $taskId != 'null' ]]; then
      task $taskId done
    fi
  }

  function jira2ip {
    jira transition --noedit "In Progress" "$(toTicketId $1)"
  }

  function jira2cr {
    set-return-trap
    local ticketId=$(toTicketId $1)
    local taskId=$(toTaskId $1)
    jira transition --noedit "Code Review" "$ticketId"
    if [[ $taskId != 'null' ]]; then
      task $taskId modify +cr
      task $taskId stop
    fi
    unset-return-trap
  }

  function jira2qa {
    set-return-trap
    local ticketId="$(toTicketId $1)"
    jira transition --noedit "QA" $ticketId
    jira unassign $ticketId
    local taskId="$(toTaskId $1)"
    if [[ $taskId != 'null' ]]; then
      task $taskId done
    fi
    unset-return-trap
  }

  function jira2done {
    set-return-trap

    local ticketId="$(toTicketId $1)"
    local transition="Closed"
    if [[ $(jira view -t json $ticketId | jq .fields.issuetype.subtask) = "true" ]]; then
      transition="Done"
    fi

    jira transition --noedit "$transition" $ticketId
    local taskId=$(task export | jq -r '. | map(select(.description | contains("'$ticketId:u'"))) | .[0] | .uuid' | tr -d '\n' | tr -d ' ' )
    if [[ $taskId != 'null' ]]; then
      task $taskId done
    fi
    unset-return-trap
  }

  function ji2 {
    jira transition --noedit $(argsPlusTicketId $@)
  }

  alias ".."="cd .."
  alias "..."="cd ../.."
  alias ".i3"="vim ~/.config/i3/config"
  alias ".i3status"="vim ~/.config/i3status/config"
  alias ".p"="vim ~/.config/polybar/config"
  alias ":q"="exit"
  alias "filetype?"="xdg-mime query filetype"
  alias "js+"="jira subtask"
  alias "js++"="jira-subtask-quick"
  alias "jsc+"='jira subtask $(jct)'
  alias "jsc++"='jira-subtask-quick $(jct)'
  alias "list-desktop-entries"="default? list-options"
  alias "node-exec"="node-eval"
  alias "set-default"="default? set-application"
  alias "t+"="task next"
  alias "ta+"="task-splice annotate"
  alias "ta+n"="task-add-note"
  alias "ta-"="task-splice denotate"
  alias "tm+"="task-splice append"
  alias "tm-"="task-splice prepend"
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
  alias gtypist="gtypist -w"
  alias hosts="sudoedit /etc/hosts"
  alias jb='jira-browse'
  alias jbc='jira-browse $(jct)'
  alias jc='jira-comment'
  alias jcc='jira-comment $(jct)'
  alias jcs="task +ACTIVE -COMPLETED -DELETED +subtask project.is:shoebox export | jq -r '.[].description' | cut -d'|' -f 1 | head -n 1 | tr -d '\n' | tr -d ' ' 2> /dev/null"
  alias jct="task +ACTIVE -COMPLETED -DELETED -subtask project.is:shoebox export | jq -r '.[].description' | cut -d'|' -f 1 | tail -n 1 | tr -d '\n' | tr -d ' ' 2> /dev/null"
  alias jctl='journalctl'
  alias je="jira edit"
  alias jfs="jira sprintf"
  alias jg="jira grab"
  alias jgs="jira-grab-start"
  alias ji="jira"
  alias jigs="jira-grab-start"
  alias jira="EDITOR=/usr/bin/nvim $HOME/.local/bin/jira"
  alias jis="jira sprint"
  alias jisf="jira sprintf"
  alias journalctl="sudo journalctl"
  alias js="jira-subtasks"
  alias jsc='jira subtasks $(jct)'
  alias jt="jira-task"
  alias jv='jira-view'
  alias jvc='jv $(jct)'
  alias jvcf='jv -f $(jct)'
  alias mountmc="sudo mount -t cifs //raspi.local/mediacenter /mnt/mediacenter -o username=pi,vers=1.0"
  alias nmr="sudo systemctl restart NetworkManager"
  alias notify="notify-send -u normal"
  alias open="xdg-open"
  alias openports="netstat -tuplen"
  alias paccleancache="paccache -rk 1"
  alias paccleanorphans="sudo pacman -Rns $(pacman -Qtdq)"
  alias pacinstalled="pacman -Qqettn"
  alias pacinstalledaur="pacman -Qqettm"
  alias paclistbysize='expac -s "%-30n %m" | sort -rhk 2 | less'
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
  alias tas="task add +work proj:simplified"
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
alias gbdm='git branch --merged | grep -v "\*" | grep -v "master" | xargs -n 1 git branch -d'
alias gbdmerged='git branch | grep "^\s*merge" | xargs -n 1 git branch -d'
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
alias grs="git restore --staged"
alias grH="git restore"
alias grhom="git reset --hard origin/master"
alias gundo='git checkout $(git reflog | sed 1d | head -n 1 | cut -d" " -f1)'
alias ideas="v ~/thoughts/ideas.md"
alias j="jump"
alias jcb="gcb"
alias loc="find . -type f -exec cat {} + | wc -l"
alias ls="ls --color -h --group-directories-first -l"
alias nvim="/usr/bin/nvim"
alias reload-aliases="source $HOME/.zsh_custom/aliases.zsh"
alias reload=". ~/.zshrc && echo 'ZSH config reloaded from ~/.zshrc'"
alias selenium="java -jar /usr/share/selenium-server/selenium-server-standalone.jar"
alias taa="tmux_attach_or_new"
alias thoughts="v -c ':normal G' ~/thoughts/thoughts.md"
alias treed="tree --dirsfirst"
alias v="vim"
alias vi="vim"
alias vim='nvim'
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
alias weather="curl v2.wttr.in/Prévost"
alias update="yay -Syu --nocleanmenu --noeditmenu --nodiffmenu --nocombinedupgrade --noupgrademenu"
alias update-aur="update --aur"
alias loyalty="jira-sprint -q 'project = EE19 AND labels = Loyalty_E2E_Bugs AND status != Closed AND status != QA AND (assignee = currentUser() OR assignee is EMPTY) ORDER BY status DESC, priority DESC' -t table"
alias sa="start-all"

if [[ -n $TMUX ]]; then
  # Prevent weird VI bugs when using ssh
  alias ssh="TERM=xterm-color ssh"
fi
