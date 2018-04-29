set background=dark
let g:gruvbox_termcolors=16
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_hls_cursor="green"
" let g:gruvbox_sign_column="bg0"
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
    " let g:EditorConfig_exec_path = '/usr/bin/editorconfig'
    let g:EditorConfig_exec_path = '/home/charles/.local/bin/editorconfig'
    let g:python_host_prog = '/usr/bin/python2'
    let g:python3_host_prog = '/usr/bin/python3'
  endif
endif

" options
set textwidth=70
set path+="**"
"set backspace=2 " make backspace work like most other apps"
set nocursorline " don't highlight current line
set nocursorcolumn
"set lazyredraw
set diffopt+=vertical
set expandtab
set history=10000
"set laststatus=2	" always show the status bar
set listchars=eol:$,tab:>-,trail:~,space:· " character representations
set nobackup
set nofoldenable
set noswapfile
set nowrap " don't wrap text
set relativenumber
set rtp+=~/.fzf " add fzf
set shiftwidth=2
set softtabstop=2
set splitright " when you split vertically, open new window to the right
"set synmaxcol=200
set tabstop=2
"set ttimeoutlen=100 "decrease timeout for faster insert with O
set undolevels=1000
set wildmode=list:longest,full
set nosmarttab
set formatoptions+=t " make sure lines are wrapped with textwidth
set formatoptions+=l " make sure lines don't get wrapped if they are already long
set noshowmode " hide the --insert-- message in menu bar

" Persistent undo tree (even after you trash the buffer)
" You can also setup a cron job that deletes files unused for 90 days
" like this
"
" # m h  dom mon dow   command
"  43 00 *   *   3     find /home/charles/.vim/undo-dir -type f -mtime +90 -delete
if !isdirectory($HOME."/.vim")
    call mkdir($HOME."/.vim", "", 0770)
endif
if !isdirectory($HOME."/.vim/undo-dir")
    call mkdir($HOME."/.vim/undo-dir", "", 0700)
endif
set undodir=~/.vim/undo-dir
set undofile

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
let g:netrw_browsex_viewer = "/usr/bin/chromium"

" enable airline powerline fonts
" let g:onedark_termcolors = 16
let g:airline_powerline_fonts = 1
" let g:airline_left_sep=''
" let g:airline_right_sep=''
" let g:airline_base16_improved_contrast = 1
" let g:airline_theme='base16color'
" let g:airline_theme='onedark'
let g:airline_symbols = {
      \  'linenr': '',
      \  'paste': 'PASTE',
      \  'colnr': '',
      \  'notexists': '∄',
      \  'readonly': '',
      \  'spell': 'SPELL',
      \  'modified': '+',
      \  'space': ' ',
      \  'crypt': '🔒 ',
      \  'branch': '',
      \  'whitespace': '✹'
      \}

let g:airline_section_y = ''
let g:airline_section_z = '%{g:airline_symbols.linenr}%4l/%L %{g:airline_symbols.colnr}%4v'
" let g:airline_section_z = '%#__accent_bold#%{g:airline_symbols.linenr}%4l%#__restore__#%#__accent_bold#/%L#__restore__# :%3v'
let g:tmuxline_powerline_separators = 0
" let airline#extensions#tmuxline#color_template = 'visual'

" deoplete config
let g:deoplete#enable_at_startup = 1
let g:deoplete#file#enable_buffer_path = 1
" call deoplete#custom#set('_', 'min_pattern_length', 1)
" call deoplete#custom#set('file', 'min_pattern_length', 0)
let g:deoplete#auto_complete_delay = 150

" FUCK YOU NCM.
let g:cm_completeopt="menu,menuone,noinsert,noselect"
" let g:cm_completeopt="menu,menuone,noinsert,noselect"

" supertab options
let g:SuperTabDefaultCompletionType = '<c-n>'
let g:SuperTabContextDefaultCompletionType = '<c-n>'

" Ultisnips
let g:UltiSnipsExpandTrigger="<c-space>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsSnippetsDir="~/.config/nvim/my-snippets"
let g:UltiSnipsSnippetDirectories=["UltiSnips", "my-snippets"]

" Linting
" ale
" let g:ale_javascript_eslint_executable = 'eslint_d'
" let g:ale_javascript_eslint_use_global = 1
let g:ale_javascript_eslint_suppress_missing_config = 1
let g:ale_lint_on_enter = 0
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_linters = {'javascript': ['eslint'], 'typescript': ['tslint', 'tsserver']}
let g:ale_set_quickfix = 0
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'

" neomake
let g:neomake_highlight_columns=0
let g:neomake_serialize=0
let g:neomake_warning_sign = {
  \ 'text': '⚠',
  \ 'texthl': 'DiffText',
  \ }
let g:neomake_error_sign = {
  \ 'text': '✗',
  \ 'texthl': 'DiffDelete',
  \ }

" NERDTree config
let NERDTreeIgnore = ['\.pyc$', 'lib/', 'node_modules/', 'influx-data']
let NERDTreeCaseSensitiveSort = 1
let NERDTreeMinimalUI = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeWinSize = 41
let NERDTreeQuitOnOpen = 1

let g:surround_{char2nr('p')} = "(\n\t\r\n)"
let g:surround_{char2nr('P')} = "{\n\t\r\n}"
let g:surround_{char2nr('S')} = "[\n\t\r\n]"

" editorconfig
let g:EditorConfig_core_mode = 'external_command'
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" vim-jsx
let g:jsx_ext_required = 0

" vim-javascript
let g:javascript_plugin_jsdoc = 1

" vim-node
let g:vim_node#node_path = [$HOME.'/ws/aldo/shoebox/packages']

" tsuquyomi (typescript)
let g:tsuquyomi_disable_quickfix=1

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
let g:delimitMate_expand_cr = 0
let g:delimitMate_expand_space = 1

" paredit
let g:paredit_shortmaps = 0
let g:paredit_leader = "<Leader><Leader>"

" grepper
let g:grepper = {}
let g:grepper.quickfix = 1
let g:grepper.tools = ['rg', 'ag', 'grep']
