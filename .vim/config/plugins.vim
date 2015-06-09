" load plugins
call plug#begin()
  Plug 'hail2u/vim-css3-syntax', { 'for': 'css' }
  Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' }
  Plug 'mattn/emmet-vim', { 'for': ['html','htmldjango','css','eruby','scss'] }
  Plug 'django.vim', { 'for': 'htmldjango' }
  Plug 'othree/html5.vim', { 'for': 'html' }
  Plug 'kana/vim-textobj-django-template'

  " General editing goodies
  if !has('gui_running')
    Plug 'Valloric/YouCompleteMe', { 'do': './install.sh'  }
  endif
  Plug 'godlygeek/tabular'
  Plug 'jiangmiao/auto-pairs'
  Plug 'kana/vim-textobj-user'
  Plug 'vim-scripts/matchit.zip'
  Plug 'tommcdo/vim-exchange'
  Plug 'tomtom/tcomment_vim'
  Plug 'tpope/vim-surround'

  " Writing
  Plug 'reedes/vim-pencil', { 'for': ['mkd', 'tex'] }
  Plug 'reedes/vim-wordy', { 'for': ['mkd', 'tex'] }
  Plug 'reedes/vim-lexical', { 'for': ['mkd', 'tex'] }
  Plug 'reedes/vim-textobj-quote', { 'for': ['mkd', 'tex'] }

  " snipmate
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'

  " Navigation
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'kien/ctrlp.vim'
  Plug 'scrooloose/nerdtree'

  " Javascript
  Plug 'marijnh/tern_for_vim', { 'for': 'javascript', 'do': 'npm install' }
  Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
  Plug 'moll/vim-node', { 'for': 'javascript' }

  " Clojure
  Plug 'guns/vim-sexp', { 'for': 'clojure' }
  Plug 'tpope/vim-sexp-mappings-for-regular-people', { 'for': 'clojure' }
  Plug 'guns/vim-clojure-highlight', { 'for': 'clojure' }
  Plug 'raymond-w-ko/vim-niji', { 'for': 'clojure' }
  Plug 'guns/vim-clojure-static', { 'for': 'clojure' }
  Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
  Plug 'tpope/vim-leiningen', { 'for': 'clojure' }
  Plug 'vim-scripts/paredit.vim', { 'for': 'clojure' }
  Plug 'honza/vim-clojure-conceal', { 'for': 'clojure' }
  Plug 'guns/vim-slamhound', { 'for': 'clojure' }
  " Plug 'venantius/vim-cljfmt', { 'for': 'clojure' }

  " Ruby
  Plug 'nelstrom/vim-textobj-rubyblock', { 'for': 'ruby' }
  Plug 'thoughtbot/vim-rspec', { 'for': 'ruby' }
  Plug 'tpope/vim-endwise', { 'for': 'ruby' }
  Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }

  " Misc
  Plug 'tpope/vim-classpath'
  Plug 'plasticboy/vim-markdown'
  Plug 'rking/ag.vim'
  Plug 'tpope/vim-dispatch'
  Plug 'tpope/vim-unimpaired'
  Plug 'kakkyz81/evervim'
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-repeat'

  " Git
  Plug 'esneider/YUNOcommit.vim'
  Plug 'tpope/vim-repeat'

  " Style
  Plug 'altercation/vim-colors-solarized'
  Plug 'bling/vim-airline'
  Plug 'edkolev/tmuxline.vim'
  Plug 'ntpeters/vim-better-whitespace'
  Plug 'scrooloose/syntastic'

  Plug 'nathanaelkane/vim-indent-guides'
call plug#end()


