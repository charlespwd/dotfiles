" load plugins
call plug#begin()
  Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' }
  Plug 'django.vim', { 'for': 'htmldjango' }
  Plug 'hail2u/vim-css3-syntax', { 'for': 'css' }
  Plug 'kana/vim-textobj-django-template', { 'for': 'htmldjango' }
  Plug 'mattn/emmet-vim', { 'for': ['html','htmldjango','css','eruby','scss','sass'] }
  Plug 'othree/html5.vim', { 'for': 'html' }

  " General editing goodies
  if !has('gui_running')
    Plug 'Valloric/YouCompleteMe', { 'do': './install.sh'  }
  endif
  Plug 'godlygeek/tabular'
  Plug 'jiangmiao/auto-pairs'
  Plug 'kana/vim-textobj-user'
  Plug 'tommcdo/vim-exchange'
  Plug 'tomtom/tcomment_vim'
  Plug 'tpope/vim-surround'
  Plug 'vim-scripts/matchit.zip'

  " Writing
  Plug 'beloglazov/vim-online-thesaurus'
  Plug 'modsound/macdict-vim', { 'for': ['mkd', 'tex'], 'do': 'cd autoload && make' }
  Plug 'reedes/vim-lexical', { 'for': ['mkd', 'tex'] }
  Plug 'reedes/vim-pencil', { 'for': ['mkd', 'tex'] }
  Plug 'reedes/vim-textobj-quote', { 'for': ['mkd', 'tex'] }
  Plug 'reedes/vim-wordy', { 'for': ['mkd', 'tex'] }

  " snipmate
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'

  " Navigation
  Plug 'Shougo/unite.vim'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install'  }
  Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

  " Javascript
  Plug 'heavenshell/vim-jsdoc', { 'for': 'javascript' }
  Plug 'marijnh/tern_for_vim', { 'for': 'javascript', 'do': 'npm install' }
  Plug 'moll/vim-node', { 'for': 'javascript' }
  Plug 'pangloss/vim-javascript', { 'for': 'javascript' }

  " Clojure
  " Plug 'venantius/vim-cljfmt', { 'for': 'clojure' }
  Plug 'christoph-frick/vim-fireplace', { 'for': 'clojure' }
  Plug 'guns/vim-clojure-highlight', { 'for': 'clojure' }
  Plug 'guns/vim-clojure-static', { 'for': 'clojure' }
  Plug 'guns/vim-sexp', { 'for': 'clojure' }
  Plug 'guns/vim-slamhound', { 'for': 'clojure' }
  Plug 'honza/vim-clojure-conceal', { 'for': 'clojure' }
  Plug 'raymond-w-ko/vim-niji', { 'for': 'clojure' }
  Plug 'tpope/vim-leiningen', { 'for': 'clojure' }
  Plug 'tpope/vim-sexp-mappings-for-regular-people', { 'for': 'clojure' }
  Plug 'vim-scripts/paredit.vim', { 'for': 'clojure' }

  " Ruby
  Plug 'nelstrom/vim-textobj-rubyblock', { 'for': 'ruby' }
  Plug 'thoughtbot/vim-rspec', { 'for': 'ruby' }
  Plug 'tpope/vim-endwise', { 'for': 'ruby' }
  Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }

  " Misc
  Plug 'airblade/vim-gitgutter'
  Plug 'benmills/vimux'
  Plug 'kakkyz81/evervim', { 'on', 'EvervimSearchByQuery' }
  Plug 'plasticboy/vim-markdown', { 'for': ['markdown', 'mkd'] }
  Plug 'rking/ag.vim'
  Plug 'tpope/vim-classpath'
  Plug 'tpope/vim-dispatch'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-unimpaired'

  " Git
  Plug 'esneider/YUNOcommit.vim'
  Plug 'tpope/vim-fugitive'

  " Style
  Plug 'altercation/vim-colors-solarized'
  Plug 'bling/vim-airline'
  Plug 'edkolev/tmuxline.vim'
  Plug 'ntpeters/vim-better-whitespace'
  Plug 'scrooloose/syntastic'
  Plug 'nathanaelkane/vim-indent-guides'
call plug#end()
