execute pathogen#infect()

execute "Helptags"

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

" highlight the status bar when in insert mode
if version >= 700
  au InsertEnter * hi StatusLine ctermfg=235 ctermbg=2
  au InsertLeave * hi StatusLine ctermbg=240 ctermfg=12
endif

" HARDMODE
let g:hardtime_default_on = 1
let g:hardtime_showmsg = 1
let g:list_of_normal_keys = ["h", "j", "k", "l", "-", "+", "<UP>", "<DOWN>", "<LEFT>", "<RIGHT>", "}", "{"]

" rspec options
let g:rspec_command = "!rspec --format documentation --color {spec}"

" open url in browser
let g:netrw_browsex_viewer = "open"

" enable airline powerline fonts
let g:airline_powerline_fonts = 1

" style checkers
let g:syntastic_javascript_checkers = ['jscs', 'jshint']
let g:syntastic_matlab_mlint_exec = '/Applications/MATLAB_R2014a.app/bin/maci64/mlint'

" ctrlp config
let g:ctrlp_map = '<leader>f'
let g:ctrlp_max_height = 30
let g:ctrlp_working_path_mode = 0
let g:ctrlp_match_window_reversed = 0

" use silver searcher for ctrlp
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

" ============================================================
" = Neocomplcache settings
" ============================================================
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_max_list = 100
let g:neocomplcache_enable_fuzzy_completion = 1

" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  " For no inserting <CR> key.
  return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" AutoComplPop like behavior.
let g:neocomplcache_enable_auto_select = 1

" ============================================================
" = MAPPINGS
" ============================================================
" set leader key to comma
let mapleader = ","

" toggle spell check with <F5>
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

" clojure repl
autocmd Filetype clojure imap <buffer> <c-\> <esc>cpp
autocmd Filetype clojure map <buffer> <c-\> cpp
autocmd Filetype clojure map <buffer> \r :Require!<cr>

" Unfold an inline : `keyword () { (blob;)* }`
autocmd Filetype javascript map <buffer> <leader>J ^f{a<cr><esc>:s/;/;\r/g<cr>v%=:nohl<cr>

" js: turn a name: function() definition into a function name()
autocmd Filetype javascript map <buffer> <leader>:f ^cxw2wcxwbbx$%/,$<cr>:s///g<cr>

" unwrap something, e.g. |console.log(foo(bar)) => foo(bar)
map <leader>uw "_dt("_ds)

map [g :Gstatus<cr>
map ]g :Gstatus<cr>q
map [h :highlight ExtraWhitespace ctermbg=darkred guibg=#382424<cr>
map ]h :highlight clear ExtraWhiteSpace<cr>
map [w :NERDTreeToggle<cr>
map ]w :NERDTree<cr>:set relativenumber<cr>

" MACROS
autocmd Filetype javascript map <buffer> <leader>rj :TernRename<cr>
autocmd Filetype ruby map <buffer> <leader>L :call RunAllSpecs()<CR>
autocmd Filetype ruby map <buffer> <leader>S :call RunNearestSpec()<CR>
autocmd Filetype ruby map <buffer> <leader>T :call RunCurrentSpecFile()<CR>
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
let g:tex_flavor='latex'

autocmd Filetype clojure let b:AutoPairs={'(':')', '[':']', '{':'}', '"':'"'}
autocmd Filetype clojure setlocal textwidth=70
autocmd Filetype clojure highlight clear ExtraWhiteSpace
autocmd Filetype clojure let g:neocomplcache_force_overwrite_completefunc=1

" This should enable Emacs like indentation
let g:clojure_fuzzy_indent=1
let g:clojure_align_multiline_strings = 1

" Add some words which should be indented like defn etc: Compojure/compojure-api, midje and schema stuff mostly.
let g:clojure_fuzzy_indent_patterns=['^GET', '^POST', '^PUT', '^DELETE', '^ANY', '^HEAD', '^PATCH', '^OPTIONS', '^def']

autocmd Filetype htmldjango EmmetInstall
autocmd Filetype java setlocal ts=4 sts=4 sw=4 expandtab
autocmd Filetype mac setlocal ff=dos
autocmd Filetype python setlocal ts=4 sts=4 sw=4 expandtab
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype tex setlocal grepprg=grep\ -nH\ $*
autocmd Filetype tex setlocal shellslash
autocmd Filetype tex setlocal filetype=tex textwidth=70
autocmd Filetype tex let b:AutoPairs={'$':'$', '(':')', '[':']', '{':'}', '"':'"'}

" m = mono(tt), i = italics, e = emph(bf)
autocmd Filetype tex let b:surround_109 = "\\texttt{\r}"
autocmd Filetype tex let b:surround_105 = "\\textit{\r}"
autocmd Filetype tex let b:surround_101 = "\\textbf{\r}"

let g:user_emmet_install_global = 0
autocmd Filetype html,css EmmetInstall

augroup markdown
  au!
  au BufNewFile,BufRead *.md,*.markdown setlocal filetype=markdown tw=66
  au BufNewFile,BufRead *.md,*.markdown let g:neocomplcache_disable_auto_complete=1
augroup END

let NERDTreeIgnore = ['\.pyc$']
let NERDTreeCaseSensitiveSort = 1
