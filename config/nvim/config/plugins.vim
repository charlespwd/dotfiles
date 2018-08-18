let g:vimwiki_map_prefix = '<Leader>ww'
let g:vimwiki_list = [
 \ {'path': '~/documents/wiki/'},
 \ {'path': '~/documents/outbox/'}
 \ ]
let g:vimwiki_folding = 'syntax'
" load plugins
call plug#begin($XDG_CONFIG_HOME . '/nvim/plugged')
  " html stuff
  Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' }
  Plug 'hail2u/vim-css3-syntax', { 'for': 'css' }
  " Plug 'mattn/emmet-vim'
  Plug 'othree/html5.vim', { 'for': 'html' }
  " Plug 'tpope/vim-liquid'
  " Plug 'AndrewRadev/splitjoin.vim'
  " Plug 'othree/xml.vim'

  "" Autocomplete engine
  if !has('gui_running')
    " nvim-completion-manager stuff
    " Plug 'roxma/nvim-completion-manager'
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    " this is for javascript tern completion
    Plug 'roxma/nvim-cm-tern',  {'do': 'npm install' }
    " this is for typescript and stuff
    Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }
  endif

  " Autocomplete helper (use tab instead of <c-n> and <c-p>)
  Plug 'ervandew/supertab'

  " Writing
  Plug 'plasticboy/vim-markdown', { 'for': ['markdown'] }
  " Plug 'vimwiki/vimwiki'

  "" snipmate (REQUIRES brew install python)
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'

  "" Navigation "
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install'  }
  Plug 'junegunn/fzf.vim'
  Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
  Plug 'danro/rename.vim'
  Plug 'sjl/gundo.vim'

  "" Ranger
  Plug 'francoiscabrol/ranger.vim'
  Plug 'rbgrouleff/bclose.vim'

  " golang
  " Plug 'nsf/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }
  " Plug 'fatih/vim-go'

  " Javascript & typescript
  Plug 'charlespwd/vim-node'
  Plug 'heavenshell/vim-jsdoc', { 'for': ['javascript', 'typescript'] }
  Plug 'flowtype/vim-flow', { 'for': ['javascript'] }

  " Javascript syntax
  " Plug 'neoclide/vim-jsx-improve', { 'for': ['javascript'] }
  Plug 'pangloss/vim-javascript'
  Plug 'mxw/vim-jsx'

  " typescript syntax
  Plug 'leafgarland/typescript-vim', { 'for': ['typescript'] }
  Plug 'MaxMEllon/vim-jsx-pretty', { 'for': ['typescript'] }
  "
  " Plug 'mhartington/nvim-typescript'
  " Plug 'Shougo/vimproc.vim'
  " Plug 'Quramy/tsuquyomi'

  " Clojure
  " " Plug 'venantius/vim-cljfmt', { 'for': 'clojure' }
  " Plug 'christoph-frick/vim-fireplace', { 'for': 'clojure' }
  " Plug 'guns/vim-clojure-highlight', { 'for': 'clojure' }
  " Plug 'guns/vim-clojure-static', { 'for': 'clojure' }
  " Plug 'guns/vim-slamhound', { 'for': 'clojure' }
  " " Plug 'honza/vim-clojure-conceal', { 'for': 'clojure' }
  " Plug 'raymond-w-ko/vim-niji', { 'for': 'clojure' }
  " Plug 'tpope/vim-leiningen', { 'for': 'clojure' }
  " Plug 'guns/vim-sexp', { 'for': ['clojure'] }
  " Plug 'tpope/vim-sexp-mappings-for-regular-people', { 'for': ['clojure'] }
  " Plug 'tpope/vim-classpath', { 'for': ['clojure'] }
  " Plug 'vim-scripts/paredit.vim', { 'for': ['clojure'] }
  "
  " " for clojurescript doc I needed this and the cider nrepl plugin
  " Plug 'tpope/vim-salve', { 'for': ['clojure'] }
  "
  " async jobs with vim, also used by clojure, otherwise use neomake
  Plug 'tpope/vim-dispatch', { 'for': ['clojure', 'go', 'javascript', 'typescript'] }

  " Misc
  Plug 'nathanaelkane/vim-indent-guides'
  Plug 'morhetz/gruvbox'
  Plug 'tpope/vim-projectionist'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-unimpaired'
  Plug 'christoomey/vim-sort-motion'
  Plug 'kana/vim-textobj-user'
  Plug 'tommcdo/vim-exchange'
  Plug 'tomtom/tcomment_vim'
  Plug 'tpope/vim-surround'
  Plug 'vim-scripts/matchit.zip'
  " Plug 'jpalardy/vim-slime'
  Plug 'godlygeek/tabular'
  " Plug 'tpope/vim-cucumber'

  "" Autoclosing parens
  " Plug 'Raimondi/delimitMate'
  Plug 'jiangmiao/auto-pairs'

  " grepping
  " Plug 'rking/ag.vim'
  Plug 'mhinz/vim-grepper'

  " requires python (and python-editorconfig on arch)
  Plug 'editorconfig/editorconfig-vim'

  " Git
  " Plug 'idanarye/vim-merginal'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rhubarb'
  Plug 'AndrewRadev/linediff.vim'

  " Style
  Plug 'bling/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'edkolev/tmuxline.vim'
  Plug 'ntpeters/vim-better-whitespace'

  " linting
  Plug 'w0rp/ale'
call plug#end()
