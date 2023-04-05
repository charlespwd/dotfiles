# For switching configs
OS=$(uname -s)

# default umask
umask 022

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=10000000
export SAVEHIST=10000000
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
setopt HIST_BEEP                 # Beep when accessing nonexistent history.

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="cp"

# Bash compatible completion
autoload bashcompinit
bashcompinit

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=~/.zsh_custom

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
if [ "$OS" = "Linux" ]; then
  plugins=(git node vi-mode jump cp)
elif [ "$OS" = "Darwin" ]; then
  plugins=(git macos vagrant node npm rbenv rake rails vi-mode jump brew)
fi

# Load oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Load os specific config
[ "$OS" = "Linux" ] && source ~/dotfiles/os-linux.sh
[ "$OS" = "Darwin" ] && source ~/dotfiles/os-darwin.sh

# Enable c-x,c-e command line editing
autoload -U edit-command-line
zle -N edit-command-line
bindkey '\C-x\C-e' edit-command-line

# Enable command editing in editor with c-x,c-e
autoload -U edit-command-line
zle -N edit-command-line
bindkey '\C-x\C-e' edit-command-line

# Bindings (fuzzy autocomplete)
bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward
bindkey '^P' history-search-backward
bindkey '^N' history-search-forward

# FZF config
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --follow --glob "!.git/*"'

# load nvm
[[ -s "$BIN/load-node.sh" ]] && . "$BIN/load-node.sh"

unsetopt nomatch

# _complete_yarn() {
#   if [[ -e package.json ]]; then
#     reply=($(cat package.json | jq -S -r '.scripts | keys | .[]'))
#     # reply=($(cat package.json | jq -S -r '.scripts | to_entries | map("\(.key)[\(.value|tostring)]") | .[]'))
#   fi
# }
#
# compctl -K _complete_yarn -X _complete_yarn_desc yarn

_complete_yarn_2() {
  local -a keyValues
  if ! [[ -f $PWD/package.json ]]; then
    exit 0;
  fi
  # turn scripts into `${key}:${value}` pairs separated by a line
  filter='.scripts | to_entries | map("\(.key|sub(":"; "\\:"; "g")):\(.value|tostring)") | .[]'
  IFS=$'\n';
  # keyValues will be `${key}:${value}`[]
  keyValues=($(cat $PWD/package.json | jq --sort-keys --raw-output $filter))
  _describe 'command' keyValues
  _arguments '--cwd[cwd]:filename:_files'
}

compdef _complete_yarn_2 yarn

# _complete_compare() {
#   folders=$(find $HOME/tmp -maxdepth 1 -type d | egrep -v '9409661|achat|accounting' | xargs -n 1 basename | grep -v 'tmp' | sort | awk '{ print $1.":hello" }')
#   IFS=$'\n'
#   keyValues=($folders)
#   _describe 'command' folders
# }
#
# compdef _complete_compare() comparebuilds

_complete_compare() {
  reply=($(find $HOME/tmp -maxdepth 1 -type d | egrep -v '9409661|achat|accounting' | xargs -n 1 basename | grep -v 'tmp' | sort))
}

compctl -K _complete_compare comparebuilds
compctl -K _complete_compare shoebox-perf

_complete_tags() {
  reply=($(git tag))
}

compctl -K _complete_tags release
compctl -K _complete_tags git-delete-tag

_complete_tempo() {
  IFS=$'\n';
  keyValues=($($BIN/tempo -h | sed 's#\t#:#g'))
  _describe 'command' keyValues
}

compdef _complete_tempo tempo

_complete_eod() {
  # example of option completion, see optspec
  # optspec=[]:varname: means can't really complete argument but
  # should not try to complete it either.
  _arguments -s \
    {-V,--version}'[output the version number]' \
    {-1,--sod}'[print start of day]' \
    {-r,--remote}'[set remote]' \
    {-e,--early}'[set might finish before 3]' \
    {-l,--skip-lunch}'[set skip lunch]' \
    {-s,--start}'=[set start of day]:time:' \
    --set'=[set and persist start of day]:time:' \
    {-p,--plus}'=[add time]:plus:' \
    {-m,--minus}'=[sub time]:minus:' \
    {-w,--worked}'[print hours worked since sod]' \
    {-h,--help}'=[output usage information]'
}

compdef _complete_eod eod

_complete_switch_config() {
  # example of option completion, see optspec
  # optspec=[]:varname: means can't really complete argument but
  # should not try to complete it either.
  _arguments -n \
    '*:env:(dev3 qa3 perf prod)'
  _arguments -s \
    {-p,--project}'[project]:project:(all aldoshoes callitspring globoshoes)' \
    {-c,--config}'[config]:config:(all hybris firebase contentful)'
}

compdef _complete_switch_config switch-config

_complete_make() {
  targets=($(cat $PWD/makefile | egrep -io '^[^:\t]*:' | tr -d ':'))

  # man zshcompsys /_arguments for more info
  _arguments ":target:($targets)"
}

compdef _complete_make make

_complete_start_all() {
  targets=($(find $HOME/src/github.com/Shopify -maxdepth 1 -type d | xargs -n 1 basename | grep -v '\.\.'))
  _arguments -n "1:project:(server core simplified)"
  _arguments -n "2:server:(kill $targets)"
}

compdef _complete_start_all start-all

if command -v gh &>/dev/null; then
  eval $(gh completion --shell $(basename $SHELL))
fi

[[ -f /opt/dev/sh/chruby/chruby.sh ]] && { type chruby >/dev/null 2>&1 || chruby () { source /opt/dev/sh/chruby/chruby.sh; chruby "$@"; } }

[[ -x /opt/homebrew/bin/brew ]] && eval $(/opt/homebrew/bin/brew shellenv)

[ -f /opt/dev/dev.sh ] && source /opt/dev/dev.sh
