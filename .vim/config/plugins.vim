" load plugins
call plug#begin()
  Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' }
  Plug 'django.vim', { 'for': 'htmldjango' }
  Plug 'hail2u/vim-css3-syntax', { 'for': 'css' }
  Plug 'mattn/emmet-vim', { 'for': ['html','htmldjango','css','eruby','scss','sass'] }
  Plug 'othree/html5.vim', { 'for': 'html' }

  " General editing goodies
  if !has('gui_running')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  endif

  " Autocomplete helper
  Plug 'ervandew/supertab'

  " Plug 'godlygeek/tabular'
  Plug 'Raimondi/delimitMate'
  Plug 'kana/vim-textobj-user'
  Plug 'tommcdo/vim-exchange'
  Plug 'tomtom/tcomment_vim'
  Plug 'tpope/vim-surround'
  Plug 'vim-scripts/matchit.zip'
  Plug 'jpalardy/vim-slime'

  " Writing
  Plug 'plasticboy/vim-markdown', { 'for': ['markdown'] }

  " snipmate (REQUIRES brew install python)
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'

  " Navigation
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install'  }
  Plug 'junegunn/fzf.vim'
  Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

  " Javascript
  " Plug 'ternjs/tern_for_vim', { 'for': 'javascript', 'do': 'npm install' }
  " Plug 'millermedeiros/vim-esformatter', { 'for': 'javascript' }
  Plug 'moll/vim-node', { 'for': 'javascript' }
  Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
  Plug 'mxw/vim-jsx', { 'for': 'javascript' }

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

  " Misc
  Plug 'tpope/vim-projectionist'
  Plug 'rking/ag.vim'
  Plug 'tpope/vim-classpath'
  Plug 'tpope/vim-dispatch'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-unimpaired'
  Plug 'christoomey/vim-sort-motion'

  " requires brew install python
  Plug 'editorconfig/editorconfig-vim'

  " Git
  Plug 'tpope/vim-fugitive'
  Plug 'AndrewRadev/linediff.vim'

  " Style
  Plug 'bling/vim-airline'
  Plug 'edkolev/tmuxline.vim'
  Plug 'ntpeters/vim-better-whitespace'

  "linting
  if !has('nvim')
    Plug 'scrooloose/syntastic', { 'for': ['javascript'] }
  endif

  if has('nvim')
    Plug 'neomake/neomake'
  endif

  " Plug 'nathanaelkane/vim-indent-guides'
  Plug 'morhetz/gruvbox'
call plug#end()
