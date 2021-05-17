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
  " colorscheme solarized
catch /^Vim\%((\a\+)\)\=:E185/
  " deal with it
endtry

" OS specific configurations
if g:os == "Darwin"
  let g:EditorConfig_exec_path = '/usr/local/bin/editorconfig'
  let g:EditorConfig_core_mode = 'external_command'
  " let g:python_host_prog = '/usr/bin/python2'
  let g:python3_host_prog = '/usr/local/bin/python3'
  let g:netrw_browsex_viewer = '/usr/bin/open'

  " osx keymaps
  nmap Ó :tab help<space>
  nmap ˙ :Help<cr>
  vnoremap ç "+y
  map gx :!open <cfile><cr><cr>
  map g<cr> :!open <cfile><cr><cr>
  set backspace=2 " make backspace work like most other apps"

  " Linux
elseif g:os == "Linux"
  " let g:EditorConfig_exec_path = '/usr/bin/editorconfig'
  let g:EditorConfig_exec_path = '~/.local/bin/editorconfig'
  let g:EditorConfig_core_mode = 'external_command'
  let g:python_host_prog = '/usr/bin/python2'
  let g:python3_host_prog = '/usr/bin/python3'

  " open url in browser
  let g:netrw_browsex_viewer = "/usr/bin/chromium"

  vmap <a-c> "+y
  nmap <a-s-h> :tab help<space>
  nmap <a-h> :Help<cr>
endif

if has('nvim')
  let $GIT_EDITOR = 'nvr -cc split --remote-wait'
endif

" options
set textwidth=70
set path+="**"
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
set shell=/bin/bash

" (CoC) Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

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

" vim-instant-markdown
let g:instant_markdown_autostart = 0

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
      \  'maxlinenr': '',
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
let g:airline#extensions#tmuxline#enabled = 0
" let airline#extensions#tmuxline#color_template = 'visual'
let g:tmuxline_preset = {
    \'a'       : '#S',
    \'win'     : '#I #W',
    \'cwin'    : '#I #W',
    \'y'       : '#(~/bin/shoebox-conf)',
    \'z'       : '#H',
    \'options' : {'status-justify' : 'left'}}

" deoplete config
let g:deoplete#enable_at_startup = 0
" call deoplete#custom#source('dictionary', 'matchers', ['matcher_head'])
" " If dictionary is already sorted, no need to sort it again.
" call deoplete#custom#source('dictionary', 'sorters', [])
" " Do not complete too short words
" call deoplete#custom#source('dictionary', 'min_pattern_length', 2)
" call deoplete#custom#option('ignore_sources', {'_': ['around', 'buffer']})
" call deoplete#custom#source('ale', 'rank', 9999)
" call deoplete#custom#source('ale', 'min_pattern_length', 0)

" dispatch.vim options
let g:dispatch_no_tmux_make = 1
let g:dispatch_compilers = {
\ '/opt/dev/bin/dev test': 'dev-test'
\}

" supertab options
let g:SuperTabDefaultCompletionType = '<c-n>'
let g:SuperTabContextDefaultCompletionType = '<c-n>'

" Ultisnips
let g:coc_snippet_next="<c-b>"
let g:coc_snippet_prev="<c-z>"
imap <C-b> <Plug>(coc-snippets-expand-jump)
let g:UltiSnipsSnippetsDir="~/.config/nvim/my-snippets"
let g:UltiSnipsSnippetDirectories=["UltiSnips", "my-snippets"]

" w0rp/ale
function! SqlFormatter(buffer) abort
    let l:executable = 'sql-formatter'
    return {
    \   'command': ale#Escape(l:executable)
    \}
endfunction

function! ThemeCheckGetProjectRoot(buffer) abort
  let l:project_root = ale#path#FindNearestFile(a:buffer, '.theme-check.yml')
  return !empty(l:project_root) ? fnamemodify(l:project_root, ':h') : ''
endfunction

call ale#linter#Define('liquid', {
\   'name': 'liquid-server',
\   'lsp': 'stdio',
\   'executable': $HOME . '/bin/theme-check-language-server',
\   'project_root': function('ThemeCheckGetProjectRoot'),
\   'command': '%e',
\})

let g:ale_completion_delay = 50
let g:ale_fixers = {}
let g:ale_fixers.html = ['prettier']
let g:ale_fixers.javascript = ['prettier']
let g:ale_fixers.r = ['styler']
let g:ale_fixers.ruby = ['rubocop', 'sorbet']
let g:ale_fixers.scss = ['prettier']
let g:ale_fixers.sh = ['shfmt']
let g:ale_fixers.sql = ['SqlFormatter']
let g:ale_fixers.typescript = ['prettier']
let g:ale_hover_cursor = 0
let g:ale_hover_to_preview = 1
let g:ale_javascript_eslint_suppress_missing_config = 1
let g:ale_lint_on_enter = 0
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_linters = {}
let g:ale_linters.javascript = ['eslint', 'tsserver']
let g:ale_linters.json = ['jsonlint']
let g:ale_linters.liquid = ['liquid-server']
let g:ale_linters.ruby = ['rubocop', 'sorbet']
let g:ale_linters.scss = ['stylelint']
let g:ale_linters.typescript = ['eslint', 'tsserver', 'tslint']
let g:ale_set_quickfix = 0
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'

" NERDTree config
let NERDTreeIgnore = ['\.pyc$', 'lib/', 'node_modules/', 'influx-data']
let NERDTreeCaseSensitiveSort = 1
let NERDTreeMinimalUI = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeWinSize = 41
let NERDTreeQuitOnOpen = 1
let g:NERDTreeHijackNetrw = 0

" ranger
let g:ranger_map_keys = 0
let g:ranger_replace_netrw = 1

let g:surround_{char2nr('p')} = "(\n\t\r\n)"
let g:surround_{char2nr('P')} = "{\n\t\r\n}"
let g:surround_{char2nr('S')} = "[\n\t\r\n]"

" editorconfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'term://.*']
let g:EditorConfig_verbose = 1

" vim-jsx
let g:jsx_ext_required = 0

" vim-javascript
let g:javascript_plugin_jsdoc = 1

" vim-jsonpath
let g:jsonpath_register = '+'

" define mappings for json buffers
au FileType json noremap <buffer> <silent> <expr> <leader>pp jsonpath#echo()
au FileType json noremap <buffer> <silent> <expr> <leader>g jsonpath#goto()

" vim-node
let g:vim_node#node_path = []
let g:node#suffixesadd = ['.js', '.json', '.ts', '.tsx']
let g:node_filetypes = ['javascript', 'json', 'jsx', 'typescript', 'tsx']

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

" goyo
let g:goyo_linenr = 1

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

" bclose
let g:no_plugin_maps=1

" fzf
let g:fzf_layout = { 'down': '20%' }
let g:fzf_preview_window = ''
let g:fzf_action = {
  \ 'ctrl-q': 'bdelete!',
  \ 'ctrl-n': 'NERDTreeFind',
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" man page fix with projectionist
" https://github.com/neovim/neovim/issues/8939
let g:projectionist_ignore_man=1

" quick-scope
" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" split join
let g:splitjoin_trailing_comma = 1

" nvim-r
let R_assign_map = '<c-->'
let R_buffer_opts = "winfixheight"
let R_rconsole_height = 10
let R_min_editor_width = 200
let g:r_indent_align_args = 0

highlight jsFuncCall ctermfg=White
highlight clear SpellBad
highlight SpellBad ctermfg=Red
highlight SpellCap ctermfg=Red
highlight SpellRare ctermfg=Red
highlight SpellLocal ctermfg=Red
highlight Comment cterm=italic

" press f10 to know highligh group under cursor
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" whitespace
let g:better_whitespace_filetypes_blacklist = ['qf', 'html']
let g:AutoPairsMapSpace = 0

if exists('g:started_by_firenvim')
  set guifont=Monaco:h18
  let g:airline_powerline_fonts = 0
  let g:airline_symbols.linenr = 'L'
  let g:airline_symbols.colnr = 'C'

  set wrap
  set linebreak
  set tw=1000
  set nonu
  set rnu

  let g:firenvim_config = {
        \  'globalSettings': {
        \    '<C-n>': 'default',
        \    '<D-v>': 'default',
        \  },
        \  'localSettings': {
        \    '(docs|meet)\.google\.com.*': {
        \      'takeover': 'never',
        \    },
        \    'codepen\.io': {
        \      'takeover': 'never',
        \    },
        \    '(messenger|excalidraw)\.com': {
        \      'takeover': 'never',
        \    },
        \  },
        \}
  au BufEnter github.com_*.txt set filetype=markdown

  " add text sync
  " let g:dont_write = v:false
  " function! SyncText(timer) abort
  "   let g:dont_write = v:false
  "   write
  " endfunction
  "
  " function! ThrottledSyncText() abort
  "   if g:dont_write
  "     return
  "   end
  "   let g:dont_write = v:true
  "   call timer_start(1000, 'SyncText')
  " endfunction
  "
  " au TextChanged * ++nested call ThrottledSyncText()
  " au TextChangedI * ++nested call ThrottledSyncText()
endif
