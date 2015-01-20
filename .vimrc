" load plugins
call plug#begin()
  Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' }
  Plug 'mattn/emmet-vim', { 'for': 'html' }
  Plug 'othree/html5.vim', { 'for': 'html' }

  " General editing goodies
  Plug 'Valloric/YouCompleteMe', { 'do': './install.sh'  }
  Plug 'godlygeek/tabular'
  Plug 'jiangmiao/auto-pairs'
  Plug 'kana/vim-textobj-user'
  Plug 'msanders/snipmate.vim'
  Plug 'takac/vim-hardtime'
  Plug 'tommcdo/vim-exchange'
  Plug 'tomtom/tcomment_vim'
  Plug 'tpope/vim-surround'

  " Navigation
  Plug 'kien/ctrlp.vim'
  Plug 'scrooloose/nerdtree'

  " Javascript
  Plug 'marijnh/tern_for_vim', { 'for': 'javascript' }
  Plug 'pangloss/vim-javascript', { 'for': 'javascript' }

  " Clojure
  Plug 'amdt/vim-niji', { 'for': 'clojure' }
  Plug 'guns/vim-clojure-static', { 'for': 'clojure' }
  Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
  Plug 'tpope/vim-leiningen', { 'for': 'clojure' }
  Plug 'vim-scripts/paredit.vim', { 'for': 'clojure' }

  " Ruby
  Plug 'nelstrom/vim-textobj-rubyblock', { 'for': 'ruby' }
  Plug 'thoughtbot/vim-rspec', { 'for': 'ruby' }
  Plug 'tpope/vim-endwise', { 'for': 'ruby' }
  Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }

  " Misc
  Plug 'gabrielelana/vim-markdown', { 'for': 'markdown' }
  Plug 'rking/ag.vim'
  Plug 'tpope/vim-dispatch'
  Plug 'tpope/vim-unimpaired'

  " Git
  Plug 'esneider/YUNOcommit.vim'
  Plug 'tpope/vim-fugitive'

  " Style
  Plug 'altercation/vim-colors-solarized'
  Plug 'bling/vim-airline'
  Plug 'bronson/vim-trailing-whitespace'
  Plug 'scrooloose/syntastic'

" Plug 'nathanaelkane/vim-indent-guides'
call plug#end()

" set color scheme
set background=light
colorscheme solarized

" options
syntax on
filetype plugin indent on
set cursorline " highlight current line
set expandtab
set history=1000
set hlsearch " highlight search
set incsearch " show search as typed
set laststatus=2	" always show the status bar
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:< " character representations
set nobackup
set nofoldenable
set noswapfile
set nowrap " don't wrap text
set relativenumber
set ruler " show row and column in footer
set shiftwidth=2
set softtabstop=2
set splitright " when you split vertically, open new window to the right
set tabstop=2
set ttimeoutlen=100 "decrease timeout for faster insert with O
set undolevels=1000
set wildmenu " enable bash style autocompletion
set wildmode=list:longest,full

let g:user_emmet_install_global = 0

" HARDMODE
let g:hardtime_allow_different_key = 1
let g:hardtime_default_on = 1
let g:hardtime_showmsg = 1
let g:list_of_normal_keys = ["h", "j", "k", "l", "-", "+", "<UP>", "<DOWN>", "<LEFT>", "<RIGHT>", "}", "{"]

" open url in browser
let g:netrw_browsex_viewer = "open"

" enable airline powerline fonts
let g:airline_powerline_fonts = 1

" ctrlp config
let g:ctrlp_map = '<leader>f'
let g:ctrlp_max_height = 30
let g:ctrlp_working_path_mode = 0
let g:ctrlp_match_window_reversed = 0

" use silver searcher for ctrlp
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

" ============================================================
" = MAPPINGS
" ============================================================
" set leader key to space
let mapleader = " "

" toggle spell check
map <F7> :setlocal spell! spelllang=en_us<cr>
imap <F7> <ESC>:setlocal spell! spelllang=en_us<cr>

map <F6> :setlocal spell! spelllang=fr<cr>
imap <F6> <ESC>:setlocal spell! spelllang=fr<cr>

" enter in Normal mode should add a new line
nnoremap <cr> o<esc>0"_d$

" remap ctrl l to nohl
nnoremap <silent> <c-l> :nohl<cr><c-l>

" can't be bothered to understand <c-c>, replace with esc
imap <c-c> <esc>
map <c-c> <esc>

" Easy window navigation
nmap \h <C-w>h
nmap \j <C-w>j
nmap \k <C-w>k
nmap \l <C-w>l

" Switch to previous (opened) buffer
map \\ :CtrlPBuffer<cr><cr>

highlight clear ExtraWhiteSpace
map [g :Gstatus<cr>
map ]g :Gstatus<cr>q
map [h :highlight ExtraWhitespace ctermbg=darkred guibg=#382424<cr>
map ]h :highlight clear ExtraWhiteSpace<cr>
map [w :NERDTreeToggle<cr>:set relativenumber<cr>
map ]w :NERDTree<cr>:set relativenumber<cr>

" MACROS
map <leader>.a :e ~/.oh-my-zsh/custom/aliases.zsh<cr>Gzz
map <leader>.p :e ~/Dropbox/process/
map <leader>.t :e ~/.tmux.conf<cr>
map <leader>.b :e ~/thoughts/
map <leader>.j :e ~/thoughts/thoughts.md<cr>G
map <leader>.v :e ~/.vimrc<cr>
map <leader>.z :e ~/.zshrc<cr>
map <leader>G :G
map <leader>T :Tabularize<space>/
map <leader>aa :Ag!<space>
map <leader>ad <C-W>l:w<cr><C-W>k-
map <leader>ag :Ag! "<C-r>=expand('<cword>')<CR>"
map <leader>am :e ~/.vimrc<cr>/\^" MACROS<cr>zz:nohl<cr>jO
map <leader>aw :Ag! "\b<C-r>=expand('<cword>')<CR>\b"
map <leader>b :CtrlPBuffer<cr>
map <leader>d !!today<cr>I#<space><esc>o
map <leader>g<space> :Git<space>
map <leader>ga :Git add %<cr>
map <leader>gawip :Git commit --amend -a --reuse-message=HEAD<cr>
map <leader>gbd :Git branch -D<space>
map <leader>gcb :Git checkout -b<space>
map <leader>gco :Git checkout<space>
map <leader>gd :Gdiff<cr>
map <leader>gfp :let @a=fugitive#head()<cr>:Gpush -f origin <c-r>a
map <leader>ggp :let @a=fugitive#head()<cr>:Gpush origin <c-r>a
map <leader>gi :Git add --intent-to-add %<cr>
map <leader>glg :Git lg<cr>
map <leader>gof :let @f = expand('%:h')<cr>:let @F = expand('<cword>')<cr>:e <c-r>f
map <leader>gp :let @a=fugitive#head()<cr>:Gpush origin <c-r>a
map <leader>gri :Git rebase -i<space>
map <leader>gs :Gstatus<cr>gg<c-n>
map <leader>gwip :Git commit -a -m 'Wip'<cr>
map <leader>m :CtrlPMixed<cr>
map <leader>q :bd<cr>
map <leader>rf :%s/\v(<<c-r><c-w>>)/
map <leader>rm :call delete(expand('%')) <bar> bdelete!<cr>
map <leader>rn :set relativenumber!<cr>
map <leader>rs :call ReloadAllSnippets()<cr>
map <leader>sg 1z=
map <leader>snip :let @0=&ft<cr>:e ~/.vim/bundle/snipmate.vim/snippets/<c-r>0.snippets<cr>
map <leader>snr :echo ReloadAllSnippets()<cr>
map <leader>so "kyy:<c-r>k<backspace><cr>
map <leader>sp :set paste!<cr>
map <leader>sr :call SearchAndReplace()<cr>
map <leader>st 0v}b$:sort<cr>
map <leader>sv :source ~/.vimrc<cr>
map <leader>wc :echo system('diffword')<cr>
map <leader>wis :e ~/Dropbox/wisdom.md<cr>Go
map <leader>wq :w<bar>bd<cr>
map <leader>ws :FixWhitespace<cr>
map <leader>wt :set textwidth=70<cr>
nmap <C-H> :h<space>
nmap <leader>## 70i#<esc>o<esc>
nmap <leader>;; 70i;<esc>o<esc>
nmap <leader>== 70i=<esc>o<esc>
vmap <leader>s "ky:%s/\v(<<C-R>k>)/

" Disable ex-mode
nmap Q <Nop>

" ============================================================
" == Functions
" ============================================================

" hint to keep lines short
highlight ColorColumn ctermbg=lightGray
call matchadd('ColorColumn', '\%81v', 100)

" automatically create dirs for files if they don't exist:
function! s:MkNonExDir(file, buf)
  if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
    let dir=fnamemodify(a:file, ':h')
    if !isdirectory(dir)
      call mkdir(dir, 'p')
    endif
  endif
endfunction
augroup BWCCreateDir
  autocmd!
  autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END

" Project wide find and replace. See Vimcasts for info.
command! -nargs=0 -bar Qargs execute 'args' QuickfixFilenames()
function! QuickfixFilenames()
  " Building a hash ensures we get each buffer only once
  let buffer_numbers = {}
  for quickfix_item in getqflist()
    let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
  endfor
  return join(map(values(buffer_numbers), 'fnameescape(v:val)'))
endfunction

" Project wide search and replace on steroids. I made this. Ugly, but I am pride.
function! SearchAndReplace()
  let search = input('Ggrep (-P:perl): ')
  if len(search) > 0
    execute 'Ggrep '.search
    let results = QuickfixFilenames()
    if len(results) > 0
      let vsearch = input('Pattern: ')
      if len(vsearch) > 0
        let replace = input('Replace by: ')
        execute 'Qargs | argdo %s/'.vsearch.'/'.replace.'/gc | update'
      endif
    else
      echo 'No results found.'
    endif
  endif
endfunction

" ft specific foo
" =========================================================

" Latex options
au Filetype tex call SetTexOptions()
function! SetTexOptions()
  setlocal grepprg=grep\ -nH\ $*
  setlocal shellslash
  setlocal filetype=tex textwidth=70
  let b:tex_flavor='latex'
  let b:AutoPairs={'$':'$', '(':')', '[':']', '{':'}', '"':'"'}
  let b:surround_{char2nr('m')} = "\\texttt{\r}"
  let b:surround_{char2nr('i')} = "\\textit{\r}"
  let b:surround_{char2nr('e')} = "\\textbf{\r}"
endfunction

" Clojure options
au Filetype clojure call SetClojureOptions()
function! SetClojureOptions()
  setlocal textwidth=70
  let b:AutoPairs={'"':'"'}
  " This should enable Emacs like indentation
  let b:clojure_fuzzy_indent=1
  let b:clojure_align_multiline_strings = 1
  " Add some words which should be indented like defn etc: Compojure/compojure-api, midje and schema stuff mostly.
  let b:clojure_fuzzy_indent_patterns=['^GET', '^POST', '^PUT', '^DELETE', '^ANY', '^HEAD', '^PATCH', '^OPTIONS', '^def']
  " repl mappings
  imap <buffer> <c-\> <esc>cpp
  map <buffer> <c-\> cpp
  map <buffer> \r :Require!<cr>
endfunction

" Javascript options
au Filetype javascript call SetJavascriptOptions()
function! SetJavascriptOptions()
  let b:syntastic_javascript_checkers = ['jscs', 'jshint']
  map <buffer> <leader>rj :TernRename<cr>
  " Unfold an inline : `keyword () { (blob;)* }`
  map <buffer> <leader>J ^f{a<cr><esc>:s/;/;\r/g<cr>v%=:nohl<cr>
  " js: turn a name: function() definition into a function name()
  map <buffer> <leader>:f ^cxw2wcxwbbx$%/,$<cr>:s///g<cr>
  " unwrap something, e.g. |console.log(foo(bar)) => foo(bar)
  map <leader>uw "_dt("_ds)
endfunction

" Ruby options
au Filetype ruby call SetRubyOptions()
function! SetRubyOptions()
  let b:rspec_command = "!rspec --format documentation --color {spec}"
  setlocal ts=2 sts=2 sw=2 expandtab
  map <buffer> <leader>L :call RunAllSpecs()<CR>
  map <buffer> <leader>S :call RunNearestSpec()<CR>
  map <buffer> <leader>T :call RunCurrentSpecFile()<CR>
endfunction

autocmd Filetype java setlocal ts=4 sts=4 sw=4 expandtab
autocmd Filetype python setlocal ts=4 sts=4 sw=4 expandtab
autocmd Filetype html,css,htmldjango EmmetInstall

au BufNewFile,BufRead *.md,*.markdown setlocal filetype=markdown tw=66

let NERDTreeIgnore = ['\.pyc$']
let NERDTreeCaseSensitiveSort = 1
