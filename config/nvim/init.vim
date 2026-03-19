let $NVIM_COC_LOG_LEVEL='trace'

syntax enable
filetype plugin indent on

if !exists("g:os")
  if has("win64") || has("win32") || has("win16")
    let g:os = "Windows"
  else
    let g:os = substitute(system('uname'), '\n', '', '')
  endif
endif

" allow project specific nvim configs (.exrc)
" set exrc
" set secure

if exists('g:vscode')
  source $HOME/.config/nvim/config/plugins_vscode.vim
else
  source $HOME/.config/nvim/config/plugins.vim
endif
source $HOME/.config/nvim/config/options.vim
source $HOME/.config/nvim/config/functions.vim
source $HOME/.config/nvim/config/macros.vim
source $HOME/.config/nvim/config/ft.vim
