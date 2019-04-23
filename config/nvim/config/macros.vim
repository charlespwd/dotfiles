" Set leader key to space
map <Space> <nop>
let mapleader = "\<Space>"

" toggle spell check
map <F5> :setlocal spell! spelllang=en_us<cr>
imap <F5> <ESC>:setlocal spell! spelllang=en_us<cr>

map <F6> :setlocal spell! spelllang=fr<cr>
imap <F6> <ESC>:setlocal spell! spelllang=fr<cr>

" enter in Normal mode <cr> should add a new line
" nnoremap <cr> o<esc>0"_d$

" can't be bothered to understand <c-c>, replace with esc
imap <c-c> <esc>
map <c-c> <esc>
map [g :Gstatus<cr>
map ]g :Gstatus<cr>q
map [0 :GundoShow<cr>
map ]0 :GundoHide<cr>
map [h :highlight ExtraWhitespace ctermbg=darkred guibg=#382424<cr>
map ]h :highlight clear ExtraWhiteSpace<cr>
map [w :NERDTreeToggle<cr>:set relativenumber<cr>
map ]w :NERDTree<cr>:set relativenumber<cr>

" toggle background color solarized.
if exists("g:solarized_contrast")
  call togglebg#map("<leader>cc")
endif

" logical Y
map Y y$

" Smarter j and k, go up visiually in soft wrap mode.
map j gj
map k gk

" search for visual selection
vnorem // y/<c-r>"<cr>

if has('nvim')
  nnoremap <silent> <BS> :TmuxNavigateLeft<cr>
endif

" Disable ex-mode
map Q <Nop>

" If text is selected, save it in the v buffer and send that buffer it to tmux
vmap <Plug>SendToTmux "vy:call VimuxSlime()<CR>

" PLUGS
map <Plug>DeleteEmptyLinesInTag() vit:g/\v^\s*$/d<cr>:nohl<cr>
map <Plug>SurroundTagsWithEnter() :s/\v(\<[^>]*\>)/\r&\r/g<cr>
map <Plug>IndentInTagAndRemoveBoundaries() kJ^=itkJ=it:StripWhitespace<cr>
map <Plug>ExpandHTML <Plug>SurroundTagsWithEnter()<Plug>IndentInTagAndRemoveBoundaries()<Plug>DeleteEmptyLinesInTag()
map <Plug>PrettyAttrs :s/[a-z\-0-9]\{-}="[^"]\{-}"/\r&/g<cr>=a>Jvi>:s/\v $//g<cr>
map <Plug>MostRecentBuffer :e #<cr>
map <Plug>NextDiff :Gstatus<cr>/not staged<cr>/modified<cr>WD:pclose<cr>
map <Plug>QfreplaceFromRegisterK :cdo s#<c-r>k##ge<bar>w<left><left><left><left><left>
map <Plug>ToggleTextObjQuotes :ToggleEducate<cr>
map <SID>SearchFromRegisterK :GrepperAg "<c-r>k"<cr>
map <SID>SearchFromRegisterKWithBounds :GrepperAg "\b<c-r>k\b"<cr>

" Scratchpads
map <Plug>GetTmpFile() :let @t=system('mktemp /tmp/XXXXX.js')<cr>
map <Plug>EditTmpFile() <Plug>GetTmpFile():e <c-r>t<cr>
map <Plug>SplitTmpFile() <Plug>GetTmpFile():sp <c-r>t<cr>
map <Plug>VSplitTmpFile() <Plug>GetTmpFile():vs <c-r>t<cr>

" `:SS some/text` will search for `some/text` in the file (escapes all special characters)
command! -nargs=1 SS let @/ = '\V'.escape(<q-args>, '/\')|normal! /<C-R>/<CR>

" not sure let's see just how I like it
imap jj <esc>

"This allows for change paste motion cp{motion}
nmap <silent> cp :set opfunc=ChangePaste<CR>g@
function! ChangePaste(type, ...)
    silent exe "normal! `[v`]\"_c"
    silent exe "normal! p"
endfunction

" Search for slected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

" ABBREVS
call SetupCommandAlias('at', 'AirlineTheme')
call SetupCommandAlias('T', 'Tabularize')
call SetupCommandAlias('NM', 'NeomakeSh')
call SetupCommandAlias('NMS', 'NeomakeSh')
call SetupCommandAlias('NSH', 'NeomakeSh')
call SetupCommandAlias('ZON', 'ZenModeOn')
call SetupCommandAlias('ZOFF', 'ZenModeOff')
" call SetupCommandAlias('eod', eodcmd)
call SetupCommandAlias('eods', 'w !send-summary')
call SetupCommandAlias('eodsy', 'w !send-summary 1')
call SetupCommandAlias('wf', 'w !sudo tee %')
call SetupCommandAlias('setx', '!chmod u+x %')
call SetupCommandAlias('script', 'w\|set ft=sh\|!chmod u+x %')
call SetupCommandAlias('re!', 'Redir !')
call SetupCommandAlias('RE!!', 'Redir !%')
call SetupCommandAlias('qf', 'QFilter')
call SetupCommandAlias('qf!', 'QFilter!')

" to imgur image link
map <leader>2i :let @a=system('imgur', expand('<cfile>'))<cr>^C![alt](<c-r>a<bs>)<esc>

" MACROS
" map <leader>ww :!wc -w %<cr>
" nmap <leader>== 70i=<esc>o<esc>
" tmap <Esc> <C-\><C-n>
map <leader>"" <Plug>ToggleTextObjQuotes
map <leader># :let @+=system('sed -e "s#^[^/]*/##" -e "s#\(/index\)*.js\$##" -e "s#/home/charles/ws/aldo/shoebox/##"', resolve(expand('%')))<CR>
map <leader>% :let @+=expand('%')<CR>
map <leader>,. :lopen<cr>
map <leader>,t :if exists('g:do_lint_js') && g:do_lint_js <bar> let g:do_lint_js=0 <bar> else <bar> let g:do_lint_js=1 <bar> endif <bar> echo g:do_lint_js<cr>
map <leader>.. :Dispatch<cr>
map <leader>.P :e ~/.config/polybar/config<cr>
map <leader>.a :e ~/dotfiles/.zsh_custom/aliases.zsh<cr>Gzz
map <leader>.c :e ~/.config/nvim/config/ft/clojure.vim<cr>
map <leader>.d :e ~/.config/i3/startup.sh<cr>
map <leader>.ff :e ~/dotfiles/.config/nvim/config/ft.vim<cr>
map <leader>.fj :e ~/dotfiles/.config/nvim/config/ft/javascript.vim<cr>
map <leader>.fn :e ~/dotfiles/.config/nvim/config/functions.vim<cr>
map <leader>.ft :let @k=&ft<cr>:e ~/.config/nvim/config/ft/<c-r>k.vim<cr>
map <leader>.i :e ~/.config/i3/config<cr>
map <leader>.j :e ~/thoughts/thoughts.md<cr>G
map <leader>.l :e ~/.lein/profiles.clj<cr>
map <leader>.m :e ~/dotfiles/.config/nvim/config/macros.vim<cr>/" MACROS<cr>:nohl<cr>
map <leader>.o :e ~/dotfiles/.config/nvim/config/options.vim<cr>
map <leader>.p :e ~/dotfiles/.config/nvim/config/plugins.vim<cr>
map <leader>.s :e ~/.config/i3status/config<cr>
map <leader>.t :e ~/.tmux.conf<cr>
map <leader>.v :e ~/dotfiles/.config/nvim/init.vim<cr>
map <leader>.w :e ~/thoughts/new-words.md<cr>
map <leader>.x :e ~/dotfiles/.Xresources<cr>
map <leader>.z :e ~/.zshrc<cr>
map <leader>;; :%s/;//g<cr>
map <leader>F :Files ~/<cr>
map <leader>G :G
map <leader>R :redraw!<cr>
map <leader>U :GundoToggle<cr>
map <leader>V "+p
map <leader>aa :Grepper -tool rg<cr>
map <leader>am :e ~/.vim/config/macros.vim<cr>gg/" MACROS<cr>zz:nohl<cr>o<esc>^S
map <leader>aw :Grepper -tool rg -cword -noprompt<cr>
map <leader>b :Buffers<cr>
map <leader>c :Commands<cr>
map <leader>dd !!today<cr>I#<space><esc>o
map <leader>extract ?function<cr>vf{%"fdiplaceholder<esc><cr><cr>"fpf(i<space>placeholder<esc>*
map <leader>f :Files<cr>
map <leader>g<space> :Git<space>
map <leader>ga <c-l>:Gwrite<cr>
map <leader>gawip :Git commit --amend -a --reuse-message=HEAD<cr>
map <leader>gb :Gblame<cr>
map <leader>gbd :Git branch -D<space>
map <leader>gcA :Gcommit -v --amend --reuse-message=HEAD<cr>
map <leader>gca :Gcommit -v --amend<cr>
map <leader>gcb :Git checkout -b<space>
map <leader>gcc :Gcommit -v<cr>
map <leader>gco :Git checkout<space>
map <leader>gd :Gdiff<cr>
map <leader>gfp :let @a=fugitive#head()<cr>:Gpush -f origin <c-r>a
map <leader>ggp :let @a=fugitive#head()<cr>:Gpush origin <c-r>a
map <leader>ggt :GitGutterToggle<cr>
map <leader>glg :Git lg -20<cr>
map <leader>gp :let @a=fugitive#head()<cr>:Gpush origin <c-r>a
map <leader>gri :Git rebase -i<space>
map <leader>gs :Gstatus<cr>gg<c-n>
map <leader>gsta :Git stash
map <leader>gstp :Git stash pop
map <leader>gwip :Git commit -a -m 'Wip'<cr>
map <leader>hr :let @"='<C-r>%:<C-r>=line('.')+1<cr>'<cr>
map <leader>ic :set ignorecase!<cr>
map <leader>ii <Plug>PrettyAttrs
map <leader>il <Plug>ExpandHTML
map <leader>jd :e ~/thoughts/debug.md<cr>
map <leader>journal <Plug>Journal
map <leader>md :InstantMarkdownPreview<CR>
map <leader>mv :Rename<space>
map <leader>nd <Plug>NextDiff
map <leader>nf :NERDTreeFind<cr>
map <leader>pc :PlugClean!<cr>
map <leader>pi :PlugInstall<cr>
map <leader>po :PencilToggle<cr>
map <leader>pp "+p
map <leader>pu :PlugUpdate<cr>
map <leader>ra :RangerAppend<cr>
map <leader>rf :%s/\v(<<c-r><c-w>>)/
map <leader>ritual <Plug>Ritual
map <leader>rm :call delete(expand('%')) <bar> bdelete!
" map <leader>rn :set relativenumber!<cr>
map <leader>rr :%s//
map <leader>rs :call ReloadAllSnippets()<cr>
map <leader>sR <leader>aW<Plug>QfreplaceFromRegisterK
map <leader>scc :SyntasticCheck<cr>
map <leader>scr :SyntasticReset<cr>
map <leader>sct :SyntasticToggleMode<cr>
map <leader>sg 1z=
map <leader>snip :UltiSnipsEdit<cr>
map <leader>snr :echo ReloadAllSnippets()<cr>
map <leader>so "kyy:<c-r>k<backspace><cr>
map <leader>sr :let @k=expand('<cword>')<cr><leader>aw<Plug>QfreplaceFromRegisterK
map <leader>ss :let @k=Input("Search: ")<cr><sid>SearchFromRegisterK()<Plug>QfreplaceFromRegisterK
map <leader>st 0v}b$:sort<cr>
map <leader>sv :source ~/.vimrc<cr>
map <leader>sw :StripWhitespace<cr>
map <leader>t- i- [ ]<space>
map <leader>t/ :Tabularize<space>/
map <leader>te <Plug>EditTmpFile()
map <leader>tsp <Plug>SplitTmpFile()
map <leader>tvs <Plug>VSplitEditTmpFile()
map <leader>vs :vs <c-r>%<c-w><c-w>
map <leader>x :cclose<cr>:lclose<cr>
map <silent> <leader>Q :bn<bar>bd #<cr>
map <silent> <leader>q :call CloseBuffer()<cr>
map <silent> <leader>x :ccl<cr>:lcl<cr>
map \\ <Plug>MostRecentBuffer
nmap <leader>a/ 16a/<esc><cr>k==
vmap <leader>C "+y
vmap <leader>V "+p
vmap <leader>aa "ky<sid>SearchFromRegisterK()
vmap <leader>aw "ky<sid>SearchFromRegisterKWithBounds()
vmap <leader>ld :Linediff<cr>
vmap <leader>rf *:%s//
vmap <leader>s "ky:%s/\v(<<C-R>k>)/
vmap <leader>ss "ky<sid>SearchFromRegisterK()<Plug>QfreplaceFromRegisterK
vmap <leader>sw "ky<sid>SearchFromRegisterKWithBounds()<Plug>QfreplaceFromRegisterK
vmap <leader>vy <Plug>SendToTmux

function! CloseBuffer()
  if (&ft == 'qf' || &ft == 'gitcommit' || &ft == 'help' || &ft == 'nerdtree' || &ft == 'fugitiveblame' || &ft == 'fugitive' || &diff == 1 || (exists('w:scratch') && w:scratch == 1))
    quit
  else
    echom 'BDELETE?'
    Bdelete
  endif
endfunction

" coc mappings
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap gd <Plug>(coc-definition)
nmap gy <Plug>(coc-type-definition)
nmap gi <Plug>(coc-implementation)
nmap gr <Plug>(coc-references)

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)

function! s:show_documentation()
  if (&ft == 'javascript' || &ft == 'javascript.jsx' || &ft == 'typescript')
    call CocAction('doHover')
  else
    execute &keywordprg.' '.expand('<cword>')
  endif
endfunction

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Code action
nmap <leader>ca <Plug>(coc-codeaction)

" Remap for format selected region
" vmap gq <Plug>(coc-format-selected)
" nmap gq <Plug>(coc-format-selected)

" terminal bindings
tnoremap <c-c> <c-\><c-n>
tnoremap <c-h> <C-\><C-N><C-w>h
tnoremap <c-j> <C-\><C-N><C-w>j
tnoremap <c-k> <C-\><C-N><C-w>k
tnoremap <c-l> <C-\><C-N><C-w>l

" arch keymap specific stuff...
vmap <a-c> "+y
nmap <a-s-h> :tab help<space>
nmap <a-h> :h<space>

" osx keymaps
" nmap Ó :tab help<space>
" nmap ˙ :h<space>
" vmap ç "+y

map <leader>mct OCompleted:<esc>:read !my-commits-today<cr><c-v>?Completed:<cr>jI- <esc>:g/--wip--/d<cr>

" remap nohl (arch)
nnoremap <silent> <a-l> :nohl<cr>:normal! <c-l><cr>
nnoremap <silent> <a-o> :nohl<cr>:normal! <c-l><cr>

" remap alt-l to nohl (osx)
" nnoremap <silent> ¬ :nohl<cr>:normal! <c-l><cr>

map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
