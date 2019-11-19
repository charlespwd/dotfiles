let g:vimwiki_map_prefix = '<Leader>w'
let g:vimwiki_list = [
 \ {'path': '~/documents/wiki/', 'ext': '.md', 'syntax': 'markdown'},
 \ {'path': '~/dnd/Adventure/', 'ext': '.md', 'syntax': 'markdown'},
 \ {'path': '~/dnd/TempleOfDoom/', 'ext': '.md', 'syntax': 'markdown'}
 \ ]
let g:vimwiki_folding = 'syntax'
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
let g:node#suffixesadd = ['.js', '.json', '.ts']

" load plugins
call plug#begin($XDG_CONFIG_HOME . '/nvim/plugged')
  " html stuff
  Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' }
  Plug 'hail2u/vim-css3-syntax', { 'for': 'css' }
  " Plug 'mattn/emmet-vim'
  Plug 'othree/html5.vim', { 'for': 'html' }

  " Plug 'tpope/vim-liquid'
  Plug 'AndrewRadev/splitjoin.vim'
  " Plug 'othree/xml.vim'

  "" Autocomplete engine
  if !has('gui_running')
    if has('nvim')
      Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
      Plug 'deoplete-plugins/deoplete-dictionary'
    endif
    " this is for javascript tern completion
    Plug 'roxma/nvim-cm-tern',  {'do': 'npm install' }

    " " this is for typescript and stuff
    " Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }

    " Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install() }}
  endif

  " Autocomplete helper (use tab instead of <c-n> and <c-p>)
  Plug 'ervandew/supertab'

  " Writing
  Plug 'plasticboy/vim-markdown', { 'for': ['markdown'] }
  Plug 'vimwiki/vimwiki'
  " Plug 'suan/vim-instant-markdown', { 'do': 'yarn global add instant-markdown-d' }

  "" snipmate (REQUIRES brew install python)
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'

  "" Navigation "
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install'  }
  Plug 'junegunn/fzf.vim'
  Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
  Plug 'tpope/vim-eunuch'
  Plug 'sjl/gundo.vim'

  "" Ranger
  Plug 'rafaqz/ranger.vim'
  Plug 'rbgrouleff/bclose.vim'

  " golang
  " Plug 'nsf/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }
  " Plug 'fatih/vim-go'

  " Javascript & typescript
  Plug 'charlespwd/vim-node'
  Plug 'heavenshell/vim-jsdoc', { 'for': ['javascript', 'typescript'] }
  " Plug 'flowtype/vim-flow', { 'for': ['javascript'] }
  Plug 'mogelbrod/vim-jsonpath', { 'for': ['json'] }

  " Javascript syntax
  " Plug 'neoclide/vim-jsx-improve', { 'for': ['javascript'] }
  Plug 'pangloss/vim-javascript'
  Plug 'mxw/vim-jsx'

  " typescript syntax
  Plug 'leafgarland/typescript-vim', { 'for': ['typescript'] }
  " Plug 'MaxMEllon/vim-jsx-pretty', { 'for': ['typescript'] }
  Plug 'HerringtonDarkholme/yats.vim', { 'for': ['typescript', 'javascript'] }
  Plug 'mhartington/nvim-typescript', { 'for': ['typescript', 'javascript'], 'do': './install.sh' }
  " Plug 'Shougo/vimproc.vim', { 'do': 'make' }
  " Plug 'Quramy/tsuquyomi'

  " Clojure
  " " Plug 'venantius/vim-cljfmt', { 'for': 'clojure' }
  Plug 'christoph-frick/vim-fireplace', { 'for': 'clojure' }
  Plug 'guns/vim-clojure-highlight', { 'for': 'clojure' }
  Plug 'guns/vim-clojure-static', { 'for': 'clojure' }
  Plug 'guns/vim-slamhound', { 'for': 'clojure' }
  " " Plug 'honza/vim-clojure-conceal', { 'for': 'clojure' }
  Plug 'raymond-w-ko/vim-niji', { 'for': 'clojure' }
  Plug 'tpope/vim-leiningen', { 'for': 'clojure' }
  Plug 'guns/vim-sexp', { 'for': ['clojure'] }
  Plug 'tpope/vim-sexp-mappings-for-regular-people', { 'for': ['clojure'] }
  Plug 'tpope/vim-classpath', { 'for': ['clojure'] }
  Plug 'vim-scripts/paredit.vim', { 'for': ['clojure'] }
  "
  " " for clojurescript doc I needed this and the cider nrepl plugin
  Plug 'tpope/vim-salve', { 'for': ['clojure'] }
  "
  " async jobs with vim, also used by clojure, otherwise use neomake
  Plug 'tpope/vim-dispatch'

  " octave / matlab
  Plug 'jvirtanen/vim-octave'

  " Misc
  Plug 'nathanaelkane/vim-indent-guides'
  Plug 'morhetz/gruvbox'
  " Plug 'altercation/vim-colors-solarized'
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
  Plug 'unblevable/quick-scope'

  " python
  Plug 'ambv/black', { 'for': ['python'] }

  " Bdelete
  Plug 'moll/vim-bbye'

  "" Autoclosing parens
  Plug 'jiangmiao/auto-pairs'

  " grepping
  Plug 'mhinz/vim-grepper'

  " requires python (and python-editorconfig on arch)
  Plug 'editorconfig/editorconfig-vim'

  " Git
  Plug 'tpope/vim-fugitive'
  Plug 'junegunn/gv.vim'
  Plug 'tpope/vim-rhubarb'
  Plug 'AndrewRadev/linediff.vim'

  " Style
  Plug 'vim-airline/vim-airline', { 'tag': 'v0.10' }
  Plug 'vim-airline/vim-airline-themes'
  Plug 'edkolev/tmuxline.vim'
  Plug 'ntpeters/vim-better-whitespace'

  " linting
  Plug 'w0rp/ale'
call plug#end()

let g:node#suffixesadd = ['.js', '.json', '.ts']
