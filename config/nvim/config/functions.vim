" ============================================================
" == Functions
" ============================================================

" hint to keep lines short
highlight ColorColumn ctermbg=black
call matchadd('ColorColumn', '\%81v', 100)

" automatically create dirs for files if they don't exist:
function! s:MkNonExDir(file, buf)
  if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
    let dir=fnamemodify(a:file, ':h')
    if !isdirectory(dir)
      call mkdir(dir, 'p')
    endif
  endif
endfunction
augroup BWCCreateDir
  autocmd!
  autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END

" Project wide find and replace. See Vimcasts for info.
command! -nargs=0 -bar Qargs execute 'args' QuickfixFilenames()
command! -nargs=0 -bar Ritual normal <leader>ritual<cr>

function! QuickfixFilenames()
  " Building a hash ensures we get each buffer only once
  let buffer_numbers = {}
  for quickfix_item in getqflist()
    let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
  endfor
  return join(map(values(buffer_numbers), 'fnameescape(v:val)'))
endfunction

" .vim/plugin/qfdo.vim
" Run a command on each line in the Quickfix buffer.
" Qfdo! uses the location list instead.
" Author: Christian Brabandt
" Author: Douglas
" See: http://vim.1045645.n5.nabble.com/execute-command-in-vim-grep-results-td3236900.html
" See: http://efiquest.org/2009-02-19/32/
" Usage:
"     :Qfdo s#this#that#
"     :Qfdo! s#this#that#
"     :Qfdofile %s#this#that#
"     :Qfdofile! %s#this#that#

" Christian Brabandt runs the command on each *file*
" I have mapped Qfdo to line-by-line below
function! QFDo(bang, command)
   let qflist={}
   if a:bang
      let tlist=map(getloclist(0), 'get(v:val, ''bufnr'')')
   else
      let tlist=map(getqflist(), 'get(v:val, ''bufnr'')')
   endif
   if empty(tlist)
      echomsg "Empty Quickfixlist. Aborting"
      return
   endif
   for nr in tlist
      let item=fnameescape(bufname(nr))
      if !get(qflist, item,0)
            let qflist[item]=1
      endif
   endfor
   execute 'argl ' .join(keys(qflist))
   execute 'argdo ' . a:command
endfunction

" Run the command on each *line* in the Quickfix buffer (or location list)
" My own crack at it, based on Pavel Shevaev on efiquest
function! QFDo_each_line(bang, command)
   try
      if a:bang
         silent lrewind
      else
         silent crewind
      endif
      while 1
         echo bufname("%") line(".")
         execute a:command
         if a:bang
            silent lnext
         else
            silent cnext
         endif
      endwhile
   catch /^Vim\%((\a\+)\)\=:E\%(553\|42\):/
   endtry
endfunction

" Qfdo and such
command! -nargs=1 -bang Qfdo :call QFDo_each_line(<bang>0,<q-args>)
command! -nargs=1 -bang Qfdofile :call QFDo(<bang>0,<q-args>)

function! FEditMode()
  " GitGutterEnable
  SyntasticToggleMode
  SyntasticCheck
endfunction

function! FHackMode()
  " GitGutterDisable
  SyntasticToggleMode
  SyntasticReset
endfunction

command! -nargs=0 HackMode :call FHackMode()
command! -nargs=0 HM :call FHackMode()
command! -nargs=0 EditMode :call FEditMode()
command! -nargs=0 EM :call FEditMode()

function! FZenModeOn()
  set wrap
  set linebreak
  DisableWhitespace
  " GitGutterDisable
  " SyntasticReset
endfunction

function! FZenModeOff()
  set nowrap
  EnableWhitespace
  " GitGutterEnable
  " SyntasticCheck
endfunction

" ZenMode for writing prose without the backspace and such
command! -nargs=0 ZenMode :call FZenModeOn()
command! -nargs=0 ZenModeOn :call FZenModeOn()
command! -nargs=0 ZenModeOff :call FZenModeOff()

function! WordCount()
  let s:old_status = v:statusmsg
  let position = getpos(".")
  exe ":silent normal g\<c-g>"
  let stat = v:statusmsg
  let s:word_count = 0
  if stat != '--No lines in buffer--'
    let s:word_count = str2nr(split(v:statusmsg)[11])
    let v:statusmsg = s:old_status
  end
  call setpos('.', position)
  return s:word_count
endfunction

" Locate file on the system
command! -nargs=1 Locate call fzf#run(
      \ {'source': 'locate <q-args>', 'sink': 'e', 'options': '-m'})

" Helper to send commands to a repl
function! VimuxSlime()
  call VimuxSendText(@v)
  call VimuxSendKeys("Enter")
endfunction

function! Input(prompt)
    call inputsave()
    let text = input(a:prompt)
    call inputrestore()
    return text
endfunction

function! SetupCommandAlias(from, to)
  exec 'cnoreabbrev <expr> '.a:from
        \ .' ((getcmdtype() is# ":" && getcmdline() is# "'.a:from.'")'
        \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfun

function! SchemaCommands(host, hostname)
  call SetupCommandAlias(a:host, '!rm -f /tmp/' . a:host . '.schema.json && scp ' . a:hostname . ':schema.json /tmp/' . a:host . '.schema.json')
  call SetupCommandAlias('e'.a:host, 'e /tmp/' . a:host . '.schema.json')
  call SetupCommandAlias('w'.a:host, '!scp /tmp/'.a:host.'.schema.json '.a:hostname.':~/'.a:host.'.schema.json')
endfun

function! OpenJsx()
  let str = getline('.')
  let output = s:OpenJsxStr(str)
  let jsx = matchstr(str, '\v\zs\<.*/?\>')
  execute 'normal! ddO  '.output
  sleep 100m
  execute 'normal =a>'
  execute 'normal =a>'
endfunction

function! s:OpenJsxStr(str)
  let jsx = matchstr(a:str, '\v\zs\<.*/?\>')

  if empty(jsx)
    echom "This line is not a jsx node"
  endif

  let name = matchlist(jsx, '\v\<(\w*)')[1]
  let attrs = substitute(jsx, '<'.name.' ', '', '')
  let attrs = substitute(attrs, '\v( /)?\>', '', '')
  let output = '<'.name

  while 1
    let attr = matchstr(attrs, '\v\w*\=(\{.{-}\}|".{-}")')
    if empty(attr)
      break
    endif
    let output = output."\r  ".attr
    let attrs = substitute(attrs, attr, '', '')
  endwhile

  let closing = matchstr(jsx, '\v/?\>', '', '')
  let output = output."\r".closing

  " for debugging, uncomment below
  " echom output

  return output
endfunc

call s:OpenJsxStr('<SeatPickerPopover viewId={this.viewId} addToCart={this.addToCart} closePopover={this.onClosePopover} />')
call s:OpenJsxStr('<SeatPickerPopover viewId={this.viewId} addToCart={this.addToCart} closePopover={this.onClosePopover}>')
call s:OpenJsxStr('<SeatPickerPopover style={{ backgroundColor: 1 }} addToCart={this.addToCart} closePopover={this.onClosePopover}>')
call s:OpenJsxStr('<iframe attr="some-key" />')

function! s:FilterQuickfixList(bang, pattern)
  let cmp = a:bang ? '!~#' : '=~#'
  call setqflist(filter(getqflist(), "bufname(v:val['bufnr']) " . cmp . " a:pattern"))
endfunction
command! -bang -nargs=1 -complete=file QFilter call s:FilterQuickfixList(<bang>0, <q-args>)

" Usage:
" 	:Redir hi ............. show the full output of command ':hi' in a scratch window
" 	:Redir !ls -al ........ show the full output of command ':!ls -al' in a scratch window
function! Redir(cmd)
	for win in range(1, winnr('$'))
		if getwinvar(win, 'scratch')
			execute win . 'windo close'
		endif
	endfor
  let cmd = substitute(a:cmd, '%', expand('%'), '')
	if a:cmd =~ '^!'
		execute "let output = system('" . substitute(cmd, '^!', '', '') . "')"
	else
		redir => output
		execute cmd
		redir END
	endif
	vnew
	let w:scratch = 1
	setlocal nobuflisted buftype=nofile bufhidden=wipe noswapfile
	call setline(1, split(output, "\n"))
endfunction

command! -nargs=1 -complete=command Redir silent call Redir(<f-args>)
