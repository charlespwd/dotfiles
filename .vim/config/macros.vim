" Set leader key to space
map <Space> <nop>
let mapleader = "\<Space>"

" toggle spell check
map <F7> :setlocal spell! spelllang=en_us<cr>
imap <F7> <ESC>:setlocal spell! spelllang=en_us<cr>

map <F6> :setlocal spell! spelllang=fr<cr>
imap <F6> <ESC>:setlocal spell! spelllang=fr<cr>

" enter in Normal mode <cr> should add a new line
nnoremap <cr> o<esc>0"_d$

" remap alt-l to nohl
nnoremap <silent> ¬ :nohl<cr>:normal! <c-l><cr>

" can't be bothered to understand <c-c>, replace with esc
imap <c-c> <esc>
map <c-c> <esc>
map [g :Gstatus<cr>
map ]g :Gstatus<cr>q
map [h :highlight ExtraWhitespace ctermbg=darkred guibg=#382424<cr>
map ]h :highlight clear ExtraWhiteSpace<cr>
map [w :NERDTreeToggle<cr>
map ]w :NERDTree<cr>

" toggle background color solarized.
call togglebg#map("<leader>cc")

" Smarter j and k, go up visiually in soft wrap mode.
map j gj
map k gk

" search for visual selection
vnorem // y/<c-r>"<cr>

" Disable ex-mode
nmap Q <Nop>

" If text is selected, save it in the v buffer and send that buffer it to tmux
vmap <Plug>SendToTmux "vy:call VimuxSlime()<CR>

" Function to open recent buffers.
function! s:buflist()
  redir => ls
  silent ls
  redir END
  return split(ls, '\n')
endfunction

function! s:bufopen(e)
  execute 'buffer' matchstr(a:e, '^[ 0-9]*')
endfunction

" SCRIPTS
nnoremap <Plug>RecentBuffers :call fzf#run({
      \   'source':  reverse(<sid>buflist()),
      \   'sink':    function('<sid>bufopen'),
      \   'options': '+m',
      \   'down':    len(<sid>buflist()) + 2
      \ })<CR>

" PLUGS
map <Plug>EvervimJournal <leader>evjournal<cr>/Journal<cr><cr>G<cr><cr><Plug>Journal<esc><c-k><leader>q<c-j><leader>q
map <Plug>EvervimPlan <leader>evplan<cr>/Plan<cr><cr>G<cr><cr><leader>dd<esc><c-k><leader>q<c-j><leader>q
map <Plug>Journal <leader>dd<cr><cr>## Brain dump<cr><cr>## Did I move towards the resistance?<cr><cr>## Did I do something that scared me?<cr><cr>## What's the biggest mistake I made?<cr><cr>## Why didn't I achieve what I set out to achieve?<cr><cr>## What 1 thing I did was right and how can I do better?<cr><cr>##What am I doing right now that doesn't make me feel "Fuck Yes"?<cr><cr>## What's the least valuable thing I did last week?<cr><cr>## What can I outsource?<cr><esc>7{zz
map <Plug>MostRecentBuffer :e #<cr>
map <Plug>NextDiff :Gstatus<cr>/not staged<cr>/modified<cr>WD:pclose<cr>
map <Plug>QfreplaceFromRegisterK :Qfdo s/<c-r>k//gce<bar>w<left><left><left><left><left><left>
map <Plug>Ritual <leader>dd<cr>3 things I'm grateful for:<cr><cr>3 things that would make today great:<cr><cr>2 daily affirmations (I am great because):<cr><cr>What am I doing today which will bring me closer to having 20 clients?<cr><cr>What are you going to do that is EPIC?<cr><cr>What is today's ONE thing such that if it is done, everything else is going to be easier or unnecessary?<esc>{{{{{zz:PencilOff<cr>
map <Plug>ToggleTextObjQuotes :ToggleEducate<cr>
map <SID>SearchFromRegisterK :Ag! "<c-r>k"<cr>
map <SID>SearchFromRegisterKWithBounds :Ag! "\b<c-r>k\b"<cr>

" not sure let's see just how I like it
imap jj <esc>

" MACROS
" map <leader>ss :let @k=input("")<bar>normal <Plug>QfreplaceFromRegisterK
map <leader>"" <Plug>ToggleTextObjQuotes
map <leader>.a :e ~/.zsh_custom/aliases.zsh<cr>Gzz
map <leader>.b :e ~/thoughts/
map <leader>.c :e ~/.vim/config/ft/clojure.vim<cr>
map <leader>.ff :e ~/.vim/config/ft.vim<cr>
map <leader>.ft :let @k=&ft<cr>:e ~/.vim/config/ft/<c-r>k.vim<cr>
map <leader>.j :e ~/thoughts/thoughts.md<cr>G
map <leader>.l :e ~/.lein/profiles.clj<cr>
map <leader>.m :e ~/.vim/config/macros.vim<cr>
map <leader>.o :e ~/.vim/config/options.vim<cr>
map <leader>.p :e ~/.vim/config/plugins.vim<cr>
map <leader>.t :e ~/.tmux.conf<cr>
map <leader>.v :e ~/dotfiles/.vimrc<cr>
map <leader>.w :e ~/thoughts/new-words.md<cr>
map <leader>.z :e ~/.zshrc<cr>
map <leader>/ :Unite line<cr>i
map <leader>?m :Unite mapping<cr>i
map <leader>F :FZF ~/<cr>
map <leader>G :G
map <leader>R :redraw!<cr>
map <leader>T :Tabularize<space>/
map <leader>aW :let @k=expand('<cWORD>')<cr><sid>SearchFromRegisterKWithBounds()
map <leader>aa :Ag!<space>
map <leader>ag :Ag! "<C-r>=expand('<cword>')<CR>"
map <leader>am :e ~/.vim/config/macros.vim<cr>gg/" MACROS<cr>zz:nohl<cr>o<esc>^S
map <leader>aw :let @k=expand('<cword>')<cr><sid>SearchFromRegisterKWithBounds()
map <leader>b <Plug>RecentBuffers
map <leader>bgd :set background=dark<cr>
map <leader>bgl :set background=light<cr>
map <leader>dd !!today<cr>I#<space><esc>o
map <leader>ejournal <Plug>EvervimJournal
map <leader>eplan <Plug>EvervimPlan
map <leader>ev :EvervimSearchByQuery<space>
map <leader>f :FZF<cr>
map <leader>g<space> :Git<space>
map <leader>ga <c-l>:Gwrite<cr>
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
map <leader>nd <Plug>NextDiff
map <leader>pc :PlugClean!<cr>
map <leader>pi :PlugInstall<cr>
map <leader>po :PencilToggle<cr>
map <leader>pp "+p
map <leader>pu :PlugUpdate<cr>
map <leader>q :bd<cr>
map <leader>rf :%s/\v(<<c-r><c-w>>)/
map <leader>ritual <Plug>Ritual
map <leader>rm :call delete(expand('%')) <bar> bdelete!<cr>
map <leader>rn :set relativenumber!<cr>
map <leader>rs :call ReloadAllSnippets()<cr>
map <leader>sR <leader>aW<Plug>QfreplaceFromRegisterK
map <leader>sg 1z=
map <leader>snip :UltiSnipsEdit<cr>
map <leader>snr :echo ReloadAllSnippets()<cr>
map <leader>so "kyy:<c-r>k<backspace><cr>
map <leader>sr <leader>aw<Plug>QfreplaceFromRegisterK
map <leader>st 0v}b$:sort<cr>
map <leader>sv :source ~/.vimrc<cr>
map <leader>sw :set tw=1000<cr>
map <leader>th :OnlineThesaurusCurrentWord<cr>
map <leader>wc :echo system('diffword')<cr>
map <leader>wg :!write-good %
map <leader>wis :e ~/Dropbox/wisdom.md<cr>Go
map <leader>wq :w<bar>bd<cr>
map <leader>ws :StripWhitespace<cr>
map <leader>wt :set textwidth=70<cr>
map <leader>ww :!wc -w %<cr>
map <silent> <leader>x :ccl<cr>:lcl<cr>
map \\ <Plug>MostRecentBuffer
nmap <leader>## 70i#<esc>o<esc>
nmap <leader>;; 70i;<esc>o<esc>
nmap <leader>== 70i=<esc>o<esc>
nmap <leader>a/ 16a/<esc><cr>k==
nmap ˙ :h<space>
vmap <leader>aa "ky<sid>SearchFromRegisterK()
vmap <leader>aw "ky<sid>SearchFromRegisterKWithBounds()
vmap <leader>s "ky:%s/\v(<<C-R>k>)/
vmap <leader>ss "ky<sid>SearchFromRegisterK()<Plug>QfreplaceFromRegisterK
vmap <leader>sw "ky<sid>SearchFromRegisterKWithBounds()<Plug>QfreplaceFromRegisterK
vmap <leader>vy <Plug>SendToTmux
