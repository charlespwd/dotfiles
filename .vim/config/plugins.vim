" load plugins
call plug#begin()
  " html stuff
  Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' }
  Plug 'django.vim', { 'for': 'htmldjango' }
  Plug 'hail2u/vim-css3-syntax', { 'for': 'css' }
  Plug 'mattn/emmet-vim', { 'for': ['html','htmldjango','css','eruby','scss','sass'] }
  Plug 'othree/html5.vim', { 'for': 'html' }

  " Autocomplete engine
  if !has('gui_running')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  endif

  " Autocomplete helper (use tab instead of <c-n> and <c-p>)
  Plug 'ervandew/supertab'

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
  Plug 'moll/vim-node', { 'for': 'javascript' }
  Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
  Plug 'mxw/vim-jsx', { 'for': 'javascript' }
  Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
  Plug 'Shougo/vimproc.vim', { 'for': 'typescript', 'do': 'make -f make_mac.mak' }
  Plug 'Quramy/tsuquyomi', { 'for': 'typescript' }

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
  " Plug 'godlygeek/tabular'

  " grepping
  Plug 'rking/ag.vim'
  Plug 'mhinz/vim-grepper'

  " requires brew install python
  Plug 'editorconfig/editorconfig-vim'

  " Git
  Plug 'tpope/vim-fugitive'
  Plug 'AndrewRadev/linediff.vim'

  " Style
  Plug 'bling/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'edkolev/tmuxline.vim'
  Plug 'ntpeters/vim-better-whitespace'

  " linting vim
  if !has('nvim')
    Plug 'scrooloose/syntastic', { 'for': ['javascript'] }
  endif

  " linting nvim
  if has('nvim')
    Plug 'neomake/neomake'
  endif

  " Plug 'nathanaelkane/vim-indent-guides'
  Plug 'morhetz/gruvbox'
call plug#end()
