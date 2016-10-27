# Add yourself some shortcuts to projects you often work on
# Example:
# brainstormr=/Users/robbyrussell/Projects/development/planetargon/brainstormr

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
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
alias dev:stats="j server && n dev && j app && n dev"
alias fetchupstream="git stash && git checkout master && git fetch upstream && git reset --hard upstream/master && git push -f origin master"
alias firefox="/Applications/Firefox.app/Contents/MacOS/firefox"
alias fitocracy="java -jar ~/.scripts/fitocracy-lifts.jar"
alias gai="git add --intent-to-add"
alias gap="git add --patch"
alias gbd="git branch -D"
alias gbdm="git branch --merged | grep -v \"\*\" | grep -v master | grep -v dev | xargs -n 1 git branch -d"
alias gbuild="git add dist && git commit -m [Build]"
alias gcb="git checkout -b"
alias gci="git clean -i"
alias gcio="git clean -i *.orig"
alias gcl="git clone"
alias gcmsg="echo 'Please use gc instead. Be a man and write a proper commit message.'"
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
alias ls="gls --color -h --group-directories-first -l"
alias m="mutt"
alias md="grip"
alias mlint="/Applications/MATLAB_R2014a.app/bin/maci64/mlint"
alias n="npm run"
alias npmc="npm --cache-min=1000000"
alias npr="npm run"
alias nwjs="/Applications/nwjs.app/Contents/MacOS/nwjs"
alias o="open"
alias onsight="cd ~/ws/onsight/webapp"
alias papi80="jump papi && tmux rename-window 'api' && sudo bundle exec rails server -b 0.0.0.0 -p 80"
alias papi="jump papi && tmux rename-window 'api' && bundle exec rake db:migrate && bundle exec rails server -p 3111"
alias pas="j pier-authors && tmux rename-window 'authors-server' && b serve"
alias pimount="sshfs rpi.local: ~/ws/pi"
alias piunmount="umount ~/ws/pi"
alias plan="v -c ':execute \"normal \<Plug>EvervimPlan\"'"
alias pmd="pandoc -s -f markdown_github -t html --css ~/.mutt/markdown.css"
alias precommit="npm run precommit -- --format compact"
alias process="cd ~/Dropbox/process/"
alias reload=". ~/.zshrc && echo 'ZSH config reloaded from ~/.zshrc'"
alias rg="rails g"
alias rgh="rails g --help"
alias ritual="v -c ':execute \"normal G2o\<Esc>\<Plug>Ritual\"' ~/thoughts/thoughts.md"
alias rs="bundle exec rails server"
alias s="say"
alias school="cd ~/Documents/school"
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
