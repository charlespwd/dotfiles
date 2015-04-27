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

  " Clojure
  Plug 'guns/vim-sexp', { 'for': 'clojure' }
  Plug 'tpope/vim-sexp-mappings-for-regular-people', { 'for': 'clojure' }
  Plug 'guns/vim-clojure-highlight', { 'for': 'clojure' }
  Plug 'raymond-w-ko/vim-niji', { 'for': 'clojure' }
  Plug 'guns/vim-clojure-static', { 'for': 'clojure' }
  Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
  Plug 'tpope/vim-leiningen', { 'for': 'clojure' }
  Plug 'vim-scripts/paredit.vim', { 'for': 'clojure' }
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

" set color scheme
set background=light
colorscheme solarized

" options
syntax enable
filetype plugin indent on
set backspace=2 " make backspace work like most other apps"
set cursorline " highlight current line
set diffopt+=vertical
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
set synmaxcol=200
set tabstop=2
set ttimeoutlen=100 "decrease timeout for faster insert with O
set undolevels=1000
set wildmenu " enable bash style autocompletion
set wildmode=list:longest,full

highlight Comment cterm=italic
let g:evervim_devtoken='S=s317:U=3053e55:E=152db06748f:C=14b835546f8:P=1cd:A=en-devtoken:V=2:H=ec596ec2f664beb7f387da9b0262cb1a'
let g:evervim_splitoption=''
let g:user_emmet_install_global = 0
let g:better_whitespace_filetypes_blacklist=[]
let g:vim_markdown_frontmatter=1
let g:vim_markdown_folding_disabled=1
let g:limelight_conceal_ctermfg = 'cyanbright'

" open url in browser
let g:netrw_browsex_viewer = "open"

" enable airline powerline fonts
let g:airline_powerline_fonts = 1

" Add wordcount to airline buffer
" let g:airline_section_z='%{WordCount()}w %3p%% %{g:airline_symbols.linenr}%#__accent_bold#%4l%#__restore__#:%3v'

" ctrlp config
let g:ctrlp_map = '<leader>f'
let g:ctrlp_max_height = 30
let g:ctrlp_working_path_mode = 0
let g:ctrlp_match_window_reversed = 0

" use silver searcher for ctrlp
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

" ycm settings
let g:ycm_key_list_select_completion = ['<TAB>', '<Down>']
let g:ycm_key_list_previous_completion = ['<S-TAB>', '<Up>']

" Trigger configuration.
imap ® <nop>
let g:UltiSnipsExpandTrigger="®"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsSnippetsDir="~/.vim/my-snippets"
let g:UltiSnipsSnippetDirectories=["UltiSnips", "my-snippets"]

" ============================================================ " = MAPPINGS
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

" remap alt-l to nohl
nnoremap <silent> ¬ :nohl<cr>:normal! <c-l><cr>

" can't be bothered to understand <c-c>, replace with esc
imap <c-c> <esc>
map <c-c> <esc>

" Switch to previous (opened) buffer
map \\ :CtrlPBuffer<cr><cr>

map [g :Gstatus<cr>
map ]g :Gstatus<cr>q
map [h :highlight ExtraWhitespace ctermbg=darkred guibg=#382424<cr>
map ]h :highlight clear ExtraWhiteSpace<cr>
map [w :NERDTreeToggle<cr>:set relativenumber<cr>
map ]w :NERDTree<cr>:set relativenumber<cr>

" Create a file from path under the cursor
map <silent> <leader>cf :call writefile([], expand("<cfile>"), "t")<cr>

" Smarter j and k, go up visiually in soft wrap mode.
map j gj
map k gk

" search for visual selection
vnorem // y/<c-r>"<cr>

" PLUGS
map <Plug>Ritual <leader>d<cr>3 things I'm grateful for:<cr><cr>3 things that would make today great:<cr><cr>2 daily affirmations (I am great because):<cr><cr>What am I doing today that brings me closer to launching my own product?<cr><cr>What are you going to do that is EPIC?<esc>{{{{zz:PencilOff<cr>
map <Plug>Journal <leader>d<cr><cr>## Brain dump<cr><cr>## Did I move towards the resistance?<cr><cr>## Did I do something that scared me?<cr><cr>## What's the biggest mistake I made?<cr><cr>## Why didn't I achieve what I set out to achieve?<cr><cr>## What 1 thing I did was right and how can I do better?<cr><cr>## What's the least valuable thing I did last week?<cr><cr>## What can I outsource?<cr><esc>7{zz

" MACROS
map <leader>"" :ToggleEducate<cr>
map <leader>.a :e ~/.oh-my-zsh/custom/aliases.zsh<cr>Gzz
map <leader>.b :e ~/thoughts/
map <leader>.j :e ~/thoughts/thoughts.md<cr>G
map <leader>.l :e ~/.lein/profiles.clj<cr>
map <leader>.p :e ~/Dropbox/process/
map <leader>.t :e ~/.tmux.conf<cr>
map <leader>.v :e ~/dotfiles/.vimrc<cr>
map <leader>.z :e ~/.zshrc<cr>
map <leader>G :G
map <leader>T :Tabularize<space>/
map <leader>aW :Ag! "\b<C-r>=expand('<cWORD>')<CR>\b"
map <leader>aa :Ag!<space>
map <leader>ag :Ag! "<C-r>=expand('<cword>')<CR>"
map <leader>am :e ~/.vimrc<cr>gg/" MACROS<cr>zz:nohl<cr>o<esc>^S
map <leader>aw :Ag! "\b<C-r>=expand('<cword>')<CR>\b"
map <leader>b :CtrlPBuffer<cr>
map <leader>bgd :set background=dark<cr>
map <leader>bgl :set background=light<cr>
map <leader>d !!today<cr>I#<space><esc>o
map <leader>ev :EvervimSearchByQuery<space>
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
map <leader>glg :Git lg -20<cr>
" map <leader>gof :let @f = expand('%:h')<cr>:let @F = expand('<cword>')<cr>:e <c-r>f
map <leader>gp :let @a=fugitive#head()<cr>:Gpush origin <c-r>a
map <leader>gri :Git rebase -i<space>
map <leader>gs :Gstatus<cr>gg<c-n>
map <leader>gwip :Git commit -a -m 'Wip'<cr>
map <leader>ic :set ignorecase!<cr>
map <leader>jd :e ~/thoughts/debug.md<cr>
map <leader>journal <Plug>Journal
map <leader>m :CtrlPMixed<cr>
map <leader>pc :PlugClean!<cr>
map <leader>pi :PlugInstall<cr>
map <leader>po :PencilOff<cr>
map <leader>pp :set paste!<cr>
map <leader>pt :PencilToggle<cr>
map <leader>pu :PlugUpdate<cr>
map <leader>q :bd<cr>
map <leader>rf :%s/\v(<<c-r><c-w>>)/
map <leader>ritual <Plug>Ritual
map <leader>rm :call delete(expand('%')) <bar> bdelete!<cr>
map <leader>rn :set relativenumber!<cr>
map <leader>rs :call ReloadAllSnippets()<cr>
map <leader>sg 1z=
map <leader>snip :UltiSnipsEdit<cr>
map <leader>snr :echo ReloadAllSnippets()<cr>
map <leader>so "kyy:<c-r>k<backspace><cr>
map <leader>sr :call SearchAndReplace()<cr>
map <leader>ss :Ag<space>
map <leader>st 0v}b$:sort<cr>
map <leader>sv :source ~/.vimrc<cr>
map <leader>sw :set tw=1000<cr>
map <leader>wc :echo system('diffword')<cr>
map <leader>wg :!write-good %
map <leader>wis :e ~/Dropbox/wisdom.md<cr>Go
map <leader>wq :w<bar>bd<cr>
map <leader>ws :StripWhitespace<cr>
map <leader>wt :set textwidth=70<cr>
map <leader>ww :!wc -w %<cr>
map <leader>x :ccl<cr>
nmap <leader>## 70i#<esc>o<esc>
nmap <leader>;; 70i;<esc>o<esc>
nmap <leader>== 70i=<esc>o<esc>
nmap ˙ :h<space>
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

function! WordCount()
  let s:old_status = v:statusmsg
  let position = getpos(".")
  exe ":silent normal g\<c-g>"
  let stat = v:statusmsg
  let s:word_count = 0
  if stat != '--No lines in buffer--'
    let s:word_count = str2nr(split(v:statusmsg)[11])
    let v:statusmsg = s:old_status
  end
  call setpos('.', position)
  return s:word_count
endfunction

" ft specific foo
" =========================================================

" PROSE OPTIONS
let g:pencil#autoformat = 1
let g:pencil#conceallevel = 3
autocmd Filetype markdown set filetype=mkd
autocmd FileType mkd,tex call SetProseOptions()
function! SetProseOptions()
  call pencil#init()
  call lexical#init()
endfunction

" LATEX OPTIONS
let g:tex_flavor='latex'
autocmd BufReadPre,FileReadPre *.tex set filetype=tex
autocmd Filetype tex call SetTexOptions()
function! SetTexOptions()
  PencilOff
  setlocal foldenable
  setlocal grepprg=grep\ -nH\ $*
  setlocal shellslash
  setlocal textwidth=70
  let g:AutoPairs={'$':'$', '(':')', '[':']', '{':'}'}
  let g:surround_{char2nr('q')} = "``\r''"
  let g:surround_{char2nr('m')} = "\\texttt{\r}"
  let g:surround_{char2nr('i')} = "\\textit{\r}"
  let g:surround_{char2nr('e')} = "\\textbf{\r}"
endfunction

" CLOJURE OPTIONS
" This should enable Emacs like indentation
let g:clojure_fuzzy_indent=1
let g:clojure_align_multiline_strings = 1
" Add some words which should be indented like defn etc: Compojure/compojure-api, midje and schema stuff mostly.
let g:clojure_fuzzy_indent_patterns=['^GET', '^POST', '^PUT', '^DELETE', '^ANY', '^HEAD', '^PATCH', '^OPTIONS', '^def', '^apply', '^add-watch', '^context']
let g:niji_light_colors =  [['brown', 'RoyalBlue3'],
                          \ ['Darkblue', 'SeaGreen3'],
                          \ ['darkgray', 'DarkOrchid3'],
                          \ ['darkgreen', 'firebrick3'],
                          \ ['darkcyan', 'RoyalBlue3']]
let g:paredit_electric_return=1
let g:paredit_smartjump=1
let g:paredit_leader = '<Space>'
autocmd Filetype clojure call SetClojureOptions()
function! SetClojureOptions()
  setlocal textwidth=70
  let b:AutoPairs={'"':'"'}
  " repl mappings
  imap <buffer> <c-\> <esc>cpp
  nnoremap <buffer> w w
  map <Plug>LintEastwood :vnew<bar>0read !lein eastwood<cr><cr>:g/\v(\=\= Lin)<bar>(Subprocess failed)<bar>(\=\= Eastwood)<bar>(Entering directory)<bar>(Directories scanned)/d<cr>
  map <Plug>Pprint va)S)aclojure.pprint/pprint <esc>
  map <buffer> <leader>pp <Plug>Pprint
  map <buffer> <leader>lint <Plug>LintEastwood
  map <buffer> <c-\> cpp
  map <buffer> cpR :RunAllTests<cr>
  map <buffer> <c-]> :Eval<cr>
  map <buffer> <c-[> ]<C-D>
  map <buffer> \r :Require!<cr>
  command! Piggie :Piggieback (cemerick.austin/exec-env)
  command! Biggie :Piggieback (cemerick.austin/exec-env :exec-cmds ["open" "-ga" "/Applications/Google Chrome.app"])
  command! Wiggie :Piggieback (weasel.repl.websocket/repl-env :ip "0.0.0.0" :port 9001)
endfunction

" JAVASCRIPT OPTIONS
let g:javascript_conceal_function   = "λ"
let g:javascript_conceal_null       = "ø"
let g:javascript_conceal_this       = "@"
let g:javascript_conceal_NaN        = "ℕ"
let g:javascript_conceal_prototype  = "¶"
let g:javascript_conceal_static     = "•"
let g:javascript_conceal_super      = "Ω"
autocmd BufReadPre,FileReadPre *.es6 set filetype=javascript
autocmd Filetype javascript call SetJavascriptOptions()
function! SetJavascriptOptions()
  set conceallevel=2
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

" RUBY OPTIONS
autocmd Filetype ruby call SetRubyOptions()
function! SetRubyOptions()
  let g:rspec_command = "!rspec --format documentation --color {spec}"
  setlocal ts=2 sts=2 sw=2 expandtab
  map <buffer> <leader>L :call RunAllSpecs()<CR>
  map <buffer> <leader>S :call RunNearestSpec()<CR>
  map <buffer> <leader>T :call RunCurrentSpecFile()<CR>
endfunction
autocmd Filetype eruby call SetERubyOptions()
function! SetERubyOptions()
  EmmetInstall
  inoremap <buffer> <C-\> </<C-X><C-O>
  let b:AutoPairs={'$':'$', '(':')', '[':']', '{':'}', '"':'"', '%':'%', '<':'>'}
  setlocal ts=4 sts=4 sw=4 expandtab
endfunction

" MARKDOWN OPTIONS
autocmd BufNewFile,BufRead *.md,*.markdown setlocal filetype=mkd.markdown tw=66
autocmd Filetype mkd call SetMarkdownOptions()
function! SetMarkdownOptions()
  call textobj#quote#init()
  let g:surround_{char2nr('8')}="**\r**"
  iabbrev <buffer> -- —
endfunction

" HTML OPTIONS
autocmd Filetype html setlocal ft=htmldjango
autocmd Filetype html,scss,css,htmldjango call SetHtmlOptions()
autocmd Filetype html,htmldjango setlocal ts=4 sts=4 sw=4 expandtab
function! SetHtmlOptions()
  EmmetInstall
  inoremap <buffer> <C-\> </<C-X><C-O>
  map <buffer> <Plug>DeInline ^:s/\v[{;}]/\0\r/g<cr>ddk=a}:nohl<cr>
  map <buffer> <leader>il <Plug>DeInline
  let g:surround_{char2nr('8')}="{% block \r %}\n{% endblock %}"
  let b:AutoPairs={'(':')', '[':']', '{':'}', '"':'"', '%':'%', '<':'>'}
endfunction

autocmd FileType ruby,tex,clojure,mkd,md,html,javascript,css,scss,vim autocmd BufWritePre <buffer> StripWhitespace
autocmd Filetype java setlocal ts=4 sts=4 sw=4 expandtab
autocmd Filetype python setlocal ts=4 sts=4 sw=4 expandtab
autocmd BufReadPre,FileReadPre help set relativenumber
autocmd BufNewFile,BufRead *.raml setlocal filetype=yaml
autocmd BufNewFile,BufRead *.scss setlocal filetype=scss.css

let NERDTreeIgnore = ['\.pyc$']
let NERDTreeCaseSensitiveSort = 1
