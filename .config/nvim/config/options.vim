set background=dark
let g:gruvbox_termcolors=16
let g:gruvbox_hls_cursor="green"
let g:gruvbox_sign_column="bg0"
let g:gruvbox_invert_selection=0
let g:gruvbox_invert_tabline=1
let g:gruvbox_invert_signs=1
let g:gruvbox_improved_strings=0

try
  colorscheme gruvbox
catch /^Vim\%((\a\+)\)\=:E185/
  " deal with it
endtry

" OS specific configurations
if has('unix')
  let s:uname = system("uname -s")

  " OSX
  if s:uname == "Darwin"
    let g:EditorConfig_exec_path = '/usr/local/bin/editorconfig'
    let g:python_host_prog = '/usr/local/bin/python2'
    let g:python3_host_prog = '/usr/local/bin/python3'

  " Linux
  else
    let g:EditorConfig_exec_path = '/usr/bin/editorconfig'
    let g:python_host_prog = '/usr/bin/python2'
    let g:python3_host_prog = '/usr/bin/python3'
  endif
endif

" options
set path+="**"
set backspace=2 " make backspace work like most other apps"
set nocursorline " don't highlight current line
set nocursorcolumn "
set scrolljump=5
set lazyredraw
set diffopt+=vertical
set expandtab
set history=10000
set laststatus=2	" always show the status bar
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:< " character representations
set nobackup
set nofoldenable
set noswapfile
set nowrap " don't wrap text
set relativenumber
set rtp+=~/.fzf " add fzf
set ruler " show row and column in footer
set shiftwidth=2
set softtabstop=2
set splitright " when you split vertically, open new window to the right
set synmaxcol=200
set tabstop=2
set ttimeoutlen=100 "decrease timeout for faster insert with O
set undolevels=1000
set wildmode=list:longest,full
set nosmarttab
" better whitespace
let g:better_whitespace_filetypes_blacklist=[]

" emmet
let g:user_emmet_install_global = 0

" vim-markdown
let g:vim_markdown_folding_disabled=1
let g:vim_markdown_frontmatter=1

" sexp
let g:sexp_filetypes = 'clojure,scheme,lisp,timl,javascript,vim'
let g:sexp_enable_insert_mode_mappings = 0
let g:sexp_mappings = {
      \ 'sexp_round_head_wrap_list':      '<Leader>W(',
      \ 'sexp_round_tail_wrap_list':      '<Leader>W)',
      \ 'sexp_square_head_wrap_list':     '<Leader>W[',
      \ 'sexp_square_tail_wrap_list':     '<Leader>W]',
      \ 'sexp_curly_head_wrap_list':      '<Leader>W{',
      \ 'sexp_curly_tail_wrap_list':      '<Leader>W}',
      \ 'sexp_round_head_wrap_element':   '<Leader>w(',
      \ 'sexp_round_tail_wrap_element':   '<Leader>w)',
      \ 'sexp_square_head_wrap_element':  '<Leader>w[',
      \ 'sexp_square_tail_wrap_element':  '<Leader>w]',
      \ 'sexp_curly_head_wrap_element':   '<Leader>w{',
      \ 'sexp_curly_tail_wrap_element':   '<Leader>w}',
      \ 'sexp_insert_at_list_head':       '',
      \ 'sexp_insert_at_list_tail':       '',
      \ 'sexp_raise_list':                '<Leader>O',
      \ 'sexp_raise_element':             '<Leader>s',
      \ 'sexp_splice_list':               '<Leader>S',
      \ }

" netrw options
let g:netrw_banner=0 " hide top message
let g:netrw_liststyle=3 " tree listing by default
let g:netrw_list_hide='.*\.swp$' " hide files via regex
let g:netrw_chgwin=1 " open netrw on different window

" open url in browser
let g:netrw_browsex_viewer = "open"

" enable airline powerline fonts
let g:airline_powerline_fonts = 1
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_theme='base16color'
let g:tmuxline_powerline_separators = 0

" deoplete config
let g:deoplete#enable_at_startup = 1
let g:deoplete#file#enable_buffer_path = 1
" let g:deoplete#enable_refresh_always = 1
call deoplete#custom#set('_', 'min_pattern_length', 1)

" supertab options
let g:SuperTabDefaultCompletionType = '<c-n>'
let g:SuperTabContextDefaultCompletionType = '<c-n>'

" Ultisnips
" <c-@> actually maps to <ctrl-space> why? no f'in clue.
let g:UltiSnipsExpandTrigger="<c-@>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsSnippetsDir="~/.config/nvim/my-snippets"
let g:UltiSnipsSnippetDirectories=["UltiSnips", "my-snippets"]

" neomake
highlight CpErrorMsg ctermbg=1 ctermfg=0
highlight CpWarningMsg ctermbg=3 ctermfg=0
let g:neomake_serialize = 0
let g:neomake_warning_sign = {
  \ 'text': '⚠',
  \ 'texthl': 'CpWarningMsg',
  \ }
let g:neomake_error_sign = {
  \ 'text': '✗',
  \ 'texthl': 'CpErrorMsg',
  \ }

" NERDTree config
let NERDTreeIgnore = ['\.pyc$']
let NERDTreeCaseSensitiveSort = 1
let NERDTreeMinimalUI = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeWinSize = 41
let NERDTreeQuitOnOpen = 1

" editorconfig
let g:EditorConfig_core_mode = 'external_command'
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" vim-jsx
let g:jsx_ext_required = 0

" tsuquyomi (typescript)
let g:tsuquyomi_disable_quickfix=0

" neovim + python
let g:python_host_skip_check=1
let g:python3_host_skip_check=1

" vim-slime
let g:slime_target = "tmux"
let g:slime_no_mappings = 1
" let g:slime_paste_file = "$HOME/.slime_paste"
vmap <c-d><c-d> JV<Plug>SlimeRegionSendu
" nmap <c-d><c-d> V<Plug>SlimeRegionSend

" delimitMate
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1
