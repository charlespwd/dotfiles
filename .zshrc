# For switching configs
OS=$(uname -s)

# remove file permissions to everyone else by default
umask go-rwx

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="avit"

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
  plugins=(git node npm vi-mode jump cp)
elif [ "$OS" = "Darwin" ]; then
  plugins=(git osx vagrant node npm rbenv be rake rails vi-mode jump brew heroku cp autoenv)
fi

# Load oh-my-zsh
source $ZSH/oh-my-zsh.sh

# User configuration

# Add $scr variable
export scr="$HOME/.scripts"

# Change your path
export PATH="$HOME/.scripts:$PATH"

# Load os specific config
[ "$OS" = "Linux" ] && source ~/dotfiles/arch.sh
[ "$OS" = "Darwin" ] && source ~/dotfiles/osx.sh

# Default editor
export EDITOR='nvim'

# CONFIG HOME (neovim)
export XDG_CONFIG_HOME='$HOME/dotfiles/.config'

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
export FZF_DEFAULT_COMMAND='ag -l -g ""' # follow .git_ignore
export FZF_TMUX=1
export FZF_TMUX_HEIGHT="50%"

# Prioritize utilization of locally installed scripts
export PATH="node_modules/.bin:$PATH"

# push new branch
gpn(){
	git push --set-upstream origin "$(git rev-parse --abbrev-ref HEAD)" $@
}

### make PRs like a boss
# push and open a page compare on GitHub
pr() {
    if [ $# -lt 1 ]; then
        echo "Usage: pr [target branch name] [target repo, default to outbox]"
        return
    fi
    local curbranch=`git rev-parse --abbrev-ref HEAD`
    gpn && sleep 4
    url=`hub compare -u ${2:-outbox}:${1}...${3:-cpclermont}:$curbranch`
    echo "$url"
    echo "$url" | xclip -i -sel clipboard
    echo "Compare url copied to clipboard"
    hub compare ${2:-outbox}:${1}...${3:-cpclermont}:$curbranch
}
alias gpr=pr
