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
  Plug 'mattn/emmet-vim', { 'for': ['html','htmldjango','css','eruby','scss','sass'] }
  Plug 'othree/html5.vim', { 'for': 'html' }

  "" Autocomplete engine
  if !has('gui_running')
    " Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

    " nvim-completion-manager stuff
    Plug 'roxma/nvim-completion-manager'
    Plug 'roxma/python-support.nvim'
    " this is for javascript tern completion
    Plug 'roxma/nvim-cm-tern',  {'do': 'npm install'}
    " this is for typescript and stuff
    Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }
  endif

  " Autocomplete helper (use tab instead of <c-n> and <c-p>)
  Plug 'ervandew/supertab'

  " Writing
  Plug 'plasticboy/vim-markdown', { 'for': ['markdown'] }
  Plug 'vimwiki/vimwiki'

  "" snipmate (REQUIRES brew install python)
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'

  "" Navigation "
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install'  }
  Plug 'junegunn/fzf.vim'
  Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
  Plug 'danro/rename.vim'
  Plug 'sjl/gundo.vim'

  " Javascript
  Plug 'moll/vim-node', { 'for': 'javascript' }
  Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
  Plug 'mxw/vim-jsx', { 'for': 'javascript' }
  Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
  Plug 'Shougo/vimproc.vim', { 'for': 'typescript', 'do': 'make' }
  Plug 'Quramy/tsuquyomi', { 'for': 'typescript' }
  Plug 'heavenshell/vim-jsdoc', { 'for': 'javascript' }

  " Clojure
  " Plug 'venantius/vim-cljfmt', { 'for': 'clojure' }
  Plug 'christoph-frick/vim-fireplace', { 'for': 'clojure' }
  Plug 'guns/vim-clojure-highlight', { 'for': 'clojure' }
  Plug 'guns/vim-clojure-static', { 'for': 'clojure' }
  Plug 'guns/vim-slamhound', { 'for': 'clojure' }
  " Plug 'honza/vim-clojure-conceal', { 'for': 'clojure' }
  Plug 'raymond-w-ko/vim-niji', { 'for': 'clojure' }
  Plug 'tpope/vim-leiningen', { 'for': 'clojure' }
  Plug 'guns/vim-sexp', { 'for': ['clojure'] }
  Plug 'tpope/vim-sexp-mappings-for-regular-people', { 'for': ['clojure'] }
  Plug 'tpope/vim-classpath', { 'for': ['clojure'] }
  Plug 'vim-scripts/paredit.vim', { 'for': ['clojure'] }

  " for clojurescript doc I needed this and the cider nrepl plugin
  Plug 'tpope/vim-salve'

  " async jobs with vim, also used by clojure, otherwise use neomake
  Plug 'tpope/vim-dispatch', { 'for': ['clojure'] }

  " Misc
  Plug 'tpope/vim-projectionist'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-unimpaired'
  Plug 'christoomey/vim-sort-motion'
  Plug 'Raimondi/delimitMate'
  Plug 'kana/vim-textobj-user'
  Plug 'tommcdo/vim-exchange'
  Plug 'tomtom/tcomment_vim'
  Plug 'tpope/vim-surround'
  Plug 'vim-scripts/matchit.zip'
  Plug 'jpalardy/vim-slime'
  Plug 'godlygeek/tabular'
  Plug 'tpope/vim-cucumber'

  " grepping
  Plug 'rking/ag.vim'
  Plug 'mhinz/vim-grepper'

  " requires python (and python-editorconfig on arch)
  Plug 'editorconfig/editorconfig-vim'

  " Git
  " Plug 'idanarye/vim-merginal'
  Plug 'tpope/vim-fugitive'
  Plug 'AndrewRadev/linediff.vim'

  " Style
  Plug 'bling/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'edkolev/tmuxline.vim'
  Plug 'ntpeters/vim-better-whitespace'

  " linting nvim
  if has('nvim')
    Plug 'neomake/neomake'
  endif

  " Plug 'nathanaelkane/vim-indent-guides'
  Plug 'morhetz/gruvbox'
call plug#end()
