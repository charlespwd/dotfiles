" load plugins
call plug#begin()
  Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' }
  Plug 'mattn/emmet-vim', { 'for': ['html','htmldjango','css'] }
  Plug 'django.vim', { 'for': 'htmldjango' }
  Plug 'othree/html5.vim', { 'for': 'html' }
  Plug 'kana/vim-textobj-django-template'

  " General editing goodies
  if !has('gui_running')
    Plug 'Valloric/YouCompleteMe', { 'do': './install.sh'  }
  endif
  Plug 'junegunn/vim-easy-align'
  Plug 'godlygeek/tabular'
  Plug 'jiangmiao/auto-pairs'
  Plug 'kana/vim-textobj-user'
  Plug 'vim-scripts/matchit.zip'
  Plug 'tommcdo/vim-exchange'
  Plug 'tomtom/tcomment_vim'
  Plug 'tpope/vim-surround'

  " snipmate
  Plug 'MarcWeber/vim-addon-mw-utils'
  Plug 'tomtom/tlib_vim'
  Plug 'garbas/vim-snipmate'
  Plug 'honza/vim-snippets'

  " Navigation
  Plug 'kien/ctrlp.vim'
  Plug 'scrooloose/nerdtree'

  " Javascript
  Plug 'marijnh/tern_for_vim', { 'for': 'javascript', 'do': 'npm install' }
  Plug 'pangloss/vim-javascript', { 'for': 'javascript' }

  " Clojure
  Plug 'amdt/vim-niji', { 'for': 'clojure' }
  Plug 'guns/vim-clojure-static', { 'for': 'clojure' }
  Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
  Plug 'tpope/vim-leiningen', { 'for': 'clojure' }
  Plug 'guns/vim-clojure-highlight', { 'for': 'clojure' }
  Plug 'vim-scripts/paredit.vim', { 'for': 'clojure' }
  " Plug 'venantius/vim-cljfmt', { 'for': 'clojure' }

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
  Plug 'edkolev/tmuxline.vim'
  Plug 'ntpeters/vim-better-whitespace'
  Plug 'scrooloose/syntastic'

" Plug 'nathanaelkane/vim-indent-guides'
call plug#end()

" set color scheme
set background=light
colorscheme solarized

" options
syntax on
filetype plugin indent on
set backspace=2 " make backspace work like most other apps"
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
set synmaxcol=120
set tabstop=2
set ttimeoutlen=100 "decrease timeout for faster insert with O
set undolevels=1000
set wildmenu " enable bash style autocompletion
set wildmode=list:longest,full

let g:user_emmet_install_global = 0
let g:better_whitespace_filetypes_blacklist=[]

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

" change the snipmate trigger key to meta x
let g:SuperTabKey = '<M-S>'

" ycm settings
let g:ycm_key_list_select_completion = ['<TAB>', '<C-j>', '<Down>']
let g:ycm_key_list_previous_completion = ['<S-TAB>', '<C-k>', '<Up>']

" ============================================================
" = MAPPINGS
" ============================================================
" set leader key to space
map <Space> <nop>
let mapleader = "\<Space>"

" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

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

" snipMate controls
:imap <C-J> <Plug>snipMateNextOrTrigger
:smap <C-J> <Plug>snipMateNextOrTrigger

" Easy window navigation
nmap \h <C-w>h
nmap \j <C-w>j
nmap \k <C-w>k
nmap \l <C-w>l

" Switch to previous (opened) buffer
map \\ :CtrlPBuffer<cr><cr>

map [g :Gstatus<cr>
map ]g :Gstatus<cr>q
map [h :highlight ExtraWhitespace ctermbg=darkred guibg=#382424<cr>
map ]h :highlight clear ExtraWhiteSpace<cr>
map [w :NERDTreeToggle<cr>:set relativenumber<cr>
map ]w :NERDTree<cr>:set relativenumber<cr>

" search for visual selection
vnorem // y/<c-r>"<cr>

" MACROS
map <leader>.a :e ~/.oh-my-zsh/custom/aliases.zsh<cr>Gzz
map <leader>.b :e ~/thoughts/
map <leader>.j :e ~/thoughts/thoughts.md<cr>G
map <leader>.p :e ~/Dropbox/process/
map <leader>.t :e ~/.tmux.conf<cr>
map <leader>.v :e ~/dotfiles/.vimrc<cr>
map <leader>.z :e ~/.zshrc<cr>
map <leader>G :G
map <leader>T :Tabularize<space>/
map <leader>aa :Ag!<space>
map <leader>ad <C-W>l:w<cr><C-W>k-
map <leader>ag :Ag! "<C-r>=expand('<cword>')<CR>"
map <leader>am :e ~/.vimrc<cr>gg/" MACROS<cr>zz:nohl<cr>o<esc>^S
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
map <leader>p :set paste!<cr>
map <leader>q :bd<cr>
map <leader>rf :%s/\v(<<c-r><c-w>>)/
map <leader>ritual <leader>d<cr>3 things I'm grateful for:<cr><cr>3 things that would make today great:<cr><cr>2 daily affirmations (I am great because):<cr><cr>What am I doing today that brings me closer to launching my own product?<esc>{{{
map <leader>rm :call delete(expand('%')) <bar> bdelete!<cr>
map <leader>rn :set relativenumber!<cr>
map <leader>rs :call ReloadAllSnippets()<cr>
map <leader>sg 1z=
map <leader>snip :let @0=&ft<cr>:e ~/.vim/plugged/snipmate.vim/snippets/<c-r>0.snippets<cr>
map <leader>snr :echo ReloadAllSnippets()<cr>
map <leader>so "kyy:<c-r>k<backspace><cr>
map <leader>sr :call SearchAndReplace()<cr>
map <leader>st 0v}b$:sort<cr>
map <leader>sv :source ~/.vimrc<cr>
map <leader>sw :set tw=1000<cr>
map <leader>twc :!wc -w %<cr>
map <leader>wc :echo system('diffword')<cr>
map <leader>wg :!write-good %
map <leader>wis :e ~/Dropbox/wisdom.md<cr>Go
map <leader>wq :w<bar>bd<cr>
map <leader>ws :StripWhitespace<cr>
map <leader>wt :set textwidth=70<cr>
map <leader>x :x<cr>
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

highlight Comment cterm=italic

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
command! -nargs=0 -bar Ritual normal <leader>ritual<cr>

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
let g:tex_flavor='latex'
au BufReadPre,FileReadPre *.tex set filetype=tex
au Filetype tex call SetTexOptions()
function! SetTexOptions()
  setlocal grepprg=grep\ -nH\ $*
  setlocal shellslash
  setlocal textwidth=70
  let g:AutoPairs={'$':'$', '(':')', '[':']', '{':'}', '"':'"'}
  let g:surround_{char2nr('m')} = "\\texttt{\r}"
  let g:surround_{char2nr('i')} = "\\textit{\r}"
  let g:surround_{char2nr('e')} = "\\textbf{\r}"
endfunction

" Clojure options
au Filetype clojure call SetClojureOptions()
function! SetClojureOptions()
  ClojureHighlightReferences
  setlocal textwidth=70
  let b:AutoPairs={'"':'"'}
  " This should enable Emacs like indentation
  let g:clojure_fuzzy_indent=1
  let g:clojure_align_multiline_strings = 1
  " Add some words which should be indented like defn etc: Compojure/compojure-api, midje and schema stuff mostly.
  let g:clojure_fuzzy_indent_patterns=['^GET', '^POST', '^PUT', '^DELETE', '^ANY', '^HEAD', '^PATCH', '^OPTIONS', '^def', '^apply']
  " repl mappings
  imap <buffer> <c-\> <esc>cpp
  map <buffer> <c-\> cpp
  map <buffer> <c-]> :Eval<cr>
  map <buffer> \r :Require!<cr>
endfunction

" Javascript options
au Filetype javascript call SetJavascriptOptions()
function! SetJavascriptOptions()
  let g:syntastic_javascript_checkers = ['jscs', 'jshint']
  map <buffer> <leader>rj :TernRename<cr>
  " wrap line by console.log()
  map <buffer> <leader>c ^vt;S)iconsole.log<esc>^
  " unwrap console.log
  map <buffer> <leader>C ^"_dt("_ds)
  " Unfold an inline : `keyword () { (blob;)* }`
  map <buffer> <leader>J ^f{a<cr><esc>:s/;/;\r/g<cr>v%=:nohl<cr>
  " turn a name: function() definition into a function name()
  map <buffer> <leader>:f ^cxw2wcxwbbx$%/,$<cr>:s///g<cr>
  " turn a function name() into a name: function()
  map <buffer> <leader>f: ^cxewcxe^ea:<esc>f{=a}f{%a,<esc>
  " unwrap something, e.g. |console.log(foo(bar)) => foo(bar)
  map <leader>uw "_dt("_ds)
  let g:surround_{char2nr('c')} = "console.log(\r)"
endfunction

" Ruby options
au Filetype ruby call SetRubyOptions()
function! SetRubyOptions()
  let g:rspec_command = "!rspec --format documentation --color {spec}"
  setlocal ts=2 sts=2 sw=2 expandtab
  map <buffer> <leader>L :call RunAllSpecs()<CR>
  map <buffer> <leader>S :call RunNearestSpec()<CR>
  map <buffer> <leader>T :call RunCurrentSpecFile()<CR>
endfunction

" Markdown options
au BufNewFile,BufRead *.md,*.markdown setlocal filetype=markdown tw=66
au Filetype markdown call SetMarkdownOptions()
function! SetMarkdownOptions()
  let g:surround_{char2nr('8')}="**\r**"
  iabbrev <buffer> -- —
endfunction

" Html options
au Filetype html,css,htmldjango call SetHtmlOptions()
function! SetHtmlOptions()
  EmmetInstall
  inoremap <buffer> <C-\> </<C-X><C-O>
  let g:surround_{char2nr('8')}="{% block \r %}\n{% endblock %}"
  let b:AutoPairs={'$':'$', '(':')', '[':']', '{':'}', '"':'"', '%':'%', '<':'>'}
endfunction

autocmd FileType tex,clojure,markdown,md,html,javascript,css,scss,vim autocmd BufWritePre <buffer> StripWhitespace
autocmd Filetype java setlocal ts=4 sts=4 sw=4 expandtab
autocmd Filetype python setlocal ts=4 sts=4 sw=4 expandtab
autocmd BufReadPre,FileReadPre help set relativenumber

let NERDTreeIgnore = ['\.pyc$']
let NERDTreeCaseSensitiveSort = 1
