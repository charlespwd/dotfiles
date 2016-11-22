" Set leader key to space
map <Space> <nop>
let mapleader = "\<Space>"

" toggle spell check
map <F7> :setlocal spell! spelllang=en_us<cr>
imap <F7> <ESC>:setlocal spell! spelllang=en_us<cr>

map <F6> :setlocal spell! spelllang=fr<cr>
imap <F6> <ESC>:setlocal spell! spelllang=fr<cr>

" enter in Normal mode <cr> should add a new line
" nnoremap <cr> o<esc>0"_d$

" can't be bothered to understand <c-c>, replace with esc
imap <c-c> <esc>
map <c-c> <esc>
map [g :Gstatus<cr>
map ]g :Gstatus<cr>q
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
map <Plug>QfreplaceFromRegisterK :Qfdo s/<c-r>k//gce<bar>w<left><left><left><left><left><left>
map <Plug>ToggleTextObjQuotes :ToggleEducate<cr>
map <SID>SearchFromRegisterK :GrepperAg "<c-r>k"<cr>
map <SID>SearchFromRegisterKWithBounds :GrepperAg "\b<c-r>k\b"<cr>

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

" Search for selected text, forwards or backwards.
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
call SetupCommandAlias('T', 'Tabularize')
call SetupCommandAlias('NM', 'NeomakeSh npm run start')
call SetupCommandAlias('NMS', 'NeomakeSh npm run start')
call SetupCommandAlias('NSH', 'NeomakeSh npm run start')
call SetupCommandAlias('ZON', 'ZenModeOn')
call SetupCommandAlias('ZOFF', 'ZenModeOff')
call SetupCommandAlias('eod', 'e ~/summary.md')

" MACROS
imap <c-d>0 <esc>:let @d=system('date +"%B %d, %Y"')<cr>"dpkJA
imap <c-d>1 <esc>:let @d=system('date -v+1d +"%B %d, %Y"')<cr>"dpkJA
imap <c-d>2 <esc>:let @d=system('date -v+2d +"%B %d, %Y"')<cr>"dpkJA
imap <c-d>3 <esc>:let @d=system('date -v+3d +"%B %d, %Y"')<cr>"dpkJA
imap <c-d>4 <esc>:let @d=system('date -v+4d +"%B %d, %Y"')<cr>"dpkJA
imap <c-d>5 <esc>:let @d=system('date -v+5d +"%B %d, %Y"')<cr>"dpkJA
imap <c-d>6 <esc>:let @d=system('date -v+6d +"%B %d, %Y"')<cr>"dpkJA
imap <c-d>7 <esc>:let @d=system('date -v+7d +"%B %d, %Y"')<cr>"dpkJA
map <leader>"" <Plug>ToggleTextObjQuotes
map <leader>% :let @*=expand("%")<CR>
map <leader>,, :Neomake<cr>
map <leader>,. :lopen<cr>
map <leader>,t :if exists('g:do_lint_js') && g:do_lint_js <bar> let g:do_lint_js=0 <bar> else <bar> let g:do_lint_js=1 <bar> endif <bar> echo g:do_lint_js<cr>
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
map <leader>.z :e ~/.zshrc<cr>
map <leader>;; :%s/;//g<cr>
map <leader>F :Files ~/<cr>
map <leader>G :G
map <leader>R :redraw!<cr>
map <leader>V "+p
map <leader>aa :Grepper -tool ag<cr>
map <leader>am :e ~/.vim/config/macros.vim<cr>gg/" MACROS<cr>zz:nohl<cr>o<esc>^S
map <leader>aw :Grepper -tool ag -cword -noprompt<cr>
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
map <leader>gi :Git add --intent-to-add %<cr>
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
map <leader>mv :Gmove <c-r>%
map <leader>nd <Plug>NextDiff
map <leader>pc :PlugClean!<cr>
map <leader>pi :PlugInstall<cr>
map <leader>po :PencilToggle<cr>
map <leader>pp "+p
map <leader>pu :PlugUpdate<cr>
map <leader>rf :%s/\v(<<c-r><c-w>>)/
map <leader>ritual <Plug>Ritual
map <leader>rm :call delete(expand('%')) <bar> bdelete!
map <leader>rn :set relativenumber!<cr>
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
map <leader>sw :set tw=1000<cr>
map <leader>t- i- [ ]<space>
map <leader>t/ :Tabularize<space>/
map <leader>wc :echo system('diffword')<cr>
map <leader>wg :!write-good %
map <leader>wq :w<bar>bd<cr>
map <leader>ws :StripWhitespace<cr>
map <leader>wt :set textwidth=70<cr>
map <leader>ww :!wc -w %<cr>
map <silent> <leader>Q :bn<bar>bd #<cr>
map <silent> <leader>q :bd<cr>
map <silent> <leader>x :ccl<cr>:lcl<cr>
map \\ <Plug>MostRecentBuffer
nmap <leader>## 70i#<esc>o<esc>
nmap <leader>== 70i=<esc>o<esc>
nmap <leader>a/ 16a/<esc><cr>k==
vmap <leader>C "+y
vmap <leader>V "+p
vmap <leader>aa "ky<sid>SearchFromRegisterK()
vmap <leader>aw "ky<sid>SearchFromRegisterKWithBounds()
vmap <leader>rf *:%s//
vmap <leader>s "ky:%s/\v(<<C-R>k>)/
vmap <leader>ss "ky<sid>SearchFromRegisterK()<Plug>QfreplaceFromRegisterK
vmap <leader>sw "ky<sid>SearchFromRegisterKWithBounds()<Plug>QfreplaceFromRegisterK
vmap <leader>vy <Plug>SendToTmux

" arch keymap specific stuff...
vmap ã "+y
nmap È :tab help<space>
nmap è :h<space>

" osx keymaps
" nmap Ó :tab help<space>
" nmap ˙ :h<space>
" vmap ç "+y

" remap alt-l to nohl (arch)
nnoremap <silent> ì :nohl<cr>:normal! <c-l><cr>

" remap alt-l to nohl (osx)
" nnoremap <silent> ¬ :nohl<cr>:normal! <c-l><cr>
