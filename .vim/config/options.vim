if exists('g:solarized_contrast')
  let g:solarized_contrast = "high"
  if ("LIGHT" == $BACKGROUND)
    let g:solarized_contrast = "high"
    set background=light
  else
    let g:solarized_contrast = "normal"
    set background=dark
  endif
  colorscheme solarized
endif

if exists('g:gruvbox_bold')
  set background=dark
  let g:gruvbox_termcolors=16
  let g:gruvbox_hls_cursor="green"
  let g:gruvbox_sign_column="bg0"
  let g:gruvbox_invert_selection=0
  let g:gruvbox_invert_tabline=1
  let g:gruvbox_invert_signs=0
  let g:gruvbox_improved_strings=0
  colorscheme gruvbox
endif

" options
set backspace=2 " make backspace work like most other apps"
set nocursorline " don't highlight current line
set nocursorcolumn "
set scrolljump=5
set lazyredraw
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
set rtp+=~/.fzf " add fzf
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

let g:better_whitespace_filetypes_blacklist=[]
let g:evervim_devtoken='S=s317:U=3053e55:E=152db06748f:C=14b835546f8:P=1cd:A=en-devtoken:V=2:H=ec596ec2f664beb7f387da9b0262cb1a'
let g:evervim_splitoption=''
let g:jsdoc_default_mapping = '<leader>doc'
let g:limelight_conceal_ctermfg = 'cyanbright'
let g:macdict_window_size = 'botright 12split'
let g:user_emmet_install_global = 0
let g:vim_markdown_folding_disabled=1
let g:vim_markdown_frontmatter=1
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

" Add wordcount to airline buffer
" let g:airline_section_z='%{WordCount()}w %3p%% %{g:airline_symbols.linenr}%#__accent_bold#%4l%#__restore__#:%3v'

" use silver searcher for ctrlp
let g:ctrlp_user_command = {
      \   'types': {
      \     1: ['.git', 'ag %s -l --nocolor -g ""'],
      \   },
      \   'ignore': 1
      \ }

" ycm settings
let g:ycm_key_list_select_completion = ['<TAB>', '<Down>']
let g:ycm_key_list_previous_completion = ['<S-TAB>', '<Up>']
let g:ycm_filetype_blacklist = {
      \ 'mail' : 1,
      \ 'mkd' : 1,
      \ 'notes' : 1,
      \ 'text' : 1,
      \ 'vimwiki' : 1
      \ }

" Trigger configuration.
let g:UltiSnipsExpandTrigger="<C-space>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsSnippetsDir="~/.vim/my-snippets"
let g:UltiSnipsSnippetDirectories=["UltiSnips", "my-snippets"]

" Syntastic
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"
let g:syntastic_auto_jump = 0

let NERDTreeIgnore = ['\.pyc$']
let NERDTreeCaseSensitiveSort = 1
let NERDTreeMinimalUI = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeWinSize = 41
let NERDTreeQuitOnOpen = 1
