" ============================================================
" == Functions
" ============================================================

" hint to keep lines short
highlight ColorColumn ctermbg=lightGray
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

" Project wide search and replace on steroids. I made this. Ugly, but I am pride.
function! SearchAndReplace()
  let search = input('Ggrep (-P:perl): ')
  if len(search) > 0
    execute 'Ggrep '.search
    let results = QuickfixFilenames()
    if len(results) > 0
      let vsearch = input('Pattern: ')
      if len(vsearch) > 0
        let replace = input('Replace by: ')
        execute 'Qargs | argdo %s/'.vsearch.'/'.replace.'/gc | update'
      endif
    else
      echo 'No results found.'
    endif
  endif
endfunction

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

