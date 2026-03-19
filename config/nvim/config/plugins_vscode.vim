" load plugins
call plug#begin($HOME . '/.config/nvim/plugged')
  Plug 'AndrewRadev/splitjoin.vim'
  Plug 'reedes/vim-textobj-quote', { 'for': ['vimwiki', 'markdown'] }
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
  Plug 'nelstrom/vim-textobj-rubyblock', { 'for': ['ruby'] }
  Plug 'pechorin/any-jump.vim'
  Plug 'tpope/vim-endwise'
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
  Plug 'godlygeek/tabular'
  Plug 'unblevable/quick-scope'
  Plug 'junegunn/goyo.vim'

  " Bdelete
  Plug 'moll/vim-bbye'

  "" Autoclosing parens
  Plug 'jiangmiao/auto-pairs'

  " requires python (and python-editorconfig on arch)
  Plug 'editorconfig/editorconfig-vim'

  " Git
  Plug 'tpope/vim-fugitive'
  Plug 'junegunn/gv.vim'
  Plug 'tpope/vim-rhubarb'
  Plug 'AndrewRadev/linediff.vim'

  Plug 'ntpeters/vim-better-whitespace'
call plug#end()
