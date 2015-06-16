" set color scheme
let g:solarized_contrast = "high"
set background=light
colorscheme solarized

" options
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
let g:ctrlp_custom_ignore = '\v.*bower_components.*'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip           " tmp and zips
set wildignore+=*.woff*,*.eot,*.ttf,*/fonts/*.svg  " fonts

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

" Trigger configuration.
imap ® <nop>
let g:UltiSnipsExpandTrigger="®"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsSnippetsDir="~/.vim/my-snippets"
let g:UltiSnipsSnippetDirectories=["UltiSnips", "my-snippets"]

let NERDTreeIgnore = ['\.pyc$']
let NERDTreeCaseSensitiveSort = 1
