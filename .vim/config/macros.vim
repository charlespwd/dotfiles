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
map <Plug>Ritual <leader>d<cr>3 things I'm grateful for:<cr><cr>3 things that would make today great:<cr><cr>2 daily affirmations (I am great because):<cr><cr>What am I doing today that brings me closer to launching my own product?<cr><cr>What are you going to do that is EPIC?<cr><cr>What is today's ONE thing such that if it is done, everything else is going to be easier or unnecessary?<esc>{{{{{zz:PencilOff<cr>
map <Plug>Journal <leader>d<cr><cr>## Brain dump<cr><cr>## Did I move towards the resistance?<cr><cr>## Did I do something that scared me?<cr><cr>## What's the biggest mistake I made?<cr><cr>## Why didn't I achieve what I set out to achieve?<cr><cr>## What 1 thing I did was right and how can I do better?<cr><cr>## What's the least valuable thing I did last week?<cr><cr>## What can I outsource?<cr><esc>7{zz
map <Plug>ToggleTextObjQuotes :ToggleEducate<cr>

" MACROS
map <leader>"" <Plug>ToggleTextObjQuotes
map <leader>.a :e ~/.oh-my-zsh/custom/aliases.zsh<cr>Gzz
map <leader>.b :e ~/thoughts/
map <leader>.ft :e ~/.vim/config/ft.vim<cr>
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
map <leader>am :e ~/.vim/config/macros.vim<cr>gg/" MACROS<cr>zz:nohl<cr>o<esc>^S
map <leader>aw :Ag! "\b<C-r>=expand('<cword>')<CR>\b"
map <leader>b :CtrlPBuffer<cr>
map <leader>bgd :set background=dark<cr>
map <leader>bgl :set background=light<cr>
map <leader>d !!today<cr>I#<space><esc>o
map <leader>ev :EvervimSearchByQuery<space>
map <leader>g<space> :Git<space>
map <leader>ga :Gwrite<cr>
map <leader>gawip :Git commit --amend -a --reuse-message=HEAD<cr>
map <leader>gbd :Git branch -D<space>
map <leader>gcA :Gcommit -v --amend --reuse-message=HEAD<cr>
map <leader>gca :Gcommit -v --amend<cr>
map <leader>gcb :Git checkout -b<space>
map <leader>gcc :Gcommit -v<cr>
map <leader>gco :Git checkout<space>
map <leader>gd :Gdiff<cr>
map <leader>gfp :let @a=fugitive#head()<cr>:Gpush -f origin <c-r>a
map <leader>ggp :let @a=fugitive#head()<cr>:Gpush origin <c-r>a
map <leader>gi :Git add --intent-to-add %<cr>
map <leader>glg :Git lg -20<cr>
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