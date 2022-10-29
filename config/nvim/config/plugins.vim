let s:wiki_root = g:os == "Darwin" ? "~/Documents" : "~/documents"

let wiki_1 = {'ext': '.md', 'syntax': 'markdown'}
let wiki_1.path = s:wiki_root . '/shopify/'
let wiki_1.diary_rel_path = 'notes/'

let g:vimwiki_list = [wiki_1]
let g:vimwiki_map_prefix = '<Leader>w'
let g:vimwiki_folding = 'custom'
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
let g:node#suffixesadd = ['.js', '.json', '.ts']

" load plugins
call plug#begin($HOME . '/.config/nvim/plugged')
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
    if has('nvim') && !exists('g:started_by_firenvim')
      " Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
      " Plug 'deoplete-plugins/deoplete-dictionary'

      " $HOME/.config/nvim/coc-postinstall
      Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': $HOME . '/.config/nvim/coc-postinstall'}
    endif
  endif

  " Autocomplete helper (use tab instead of <c-n> and <c-p>)
  " Plug 'ervandew/supertab'

  " Writing
  Plug 'plasticboy/vim-markdown', { 'for': ['markdown, vimwiki'] }
  Plug 'vimwiki/vimwiki'
  " Plug 'suan/vim-instant-markdown', { 'do': 'yarn global add instant-markdown-d' }
  Plug 'reedes/vim-textobj-quote', { 'for': ['vimwiki', 'markdown'] }

  "" snipmate (REQUIRES brew install python)
  if !exists('g:started_by_firenvim')
    Plug 'SirVer/ultisnips'
  endif
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
  Plug 'mogelbrod/vim-jsonpath', { 'for': ['json'] }
  Plug 'jparise/vim-graphql', { 'for': ['graphql'] }

  " Javascript syntax
  " Plug 'pangloss/vim-javascript'
  Plug 'mxw/vim-jsx'
  Plug 'evanleck/vim-svelte', { 'branch': 'main' }

  " typescript syntax
  Plug 'leafgarland/typescript-vim', { 'commit': 'ee61b9600e7aac7a72642caedc5948a5a20d8915' }

  " ruby
  " Plug 'tpope/vim-rails', { 'for': ['ruby'] }
  Plug 'vim-ruby/vim-ruby', { 'for': ['ruby'] }
  " Plug 'Shopify/vim-sorbet'
  Plug 'nelstrom/vim-textobj-rubyblock', { 'for': ['ruby'] }
  Plug 'pechorin/any-jump.vim'

  " Clojure
  " Plug 'venantius/vim-cljfmt', { 'for': 'clojure' }
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

  " misc
  Plug 'nfischer/vim-ohm'
  Plug 'vim-scripts/applescript.vim'
  Plug 'arzg/vim-sh'
  Plug 'tpope/vim-endwise'
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
  Plug 'junegunn/goyo.vim'
  Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

  " python
  " Plug 'ambv/black', { 'for': ['python'] }

  " R
  Plug 'jalvesaq/Nvim-R', { 'for': ['r'] }

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

  " coverage
  Plug 'vim-scripts/loremipsum'
call plug#end()

let g:node#suffixesadd = ['.js', '.json', '.ts']

command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, <bang>0)

" run stuff when plugin is done
autocmd! User tmuxline.vim Tmuxline airline
autocmd! User vim-airline Tmuxline airline
