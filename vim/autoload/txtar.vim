let s:fileHeadPattern = '^-- .* --$'

"" Visually select the file in a txtar buffer nearest the cursor.  If the
" `inside` argument is true, only select file contents (`if` text object).
" If `inside` is false, select the file header too (`af` text object).
function! txtar#FileTextobj(inside) abort
  let l:start = line('.')
  while l:start > 0
    if getline(l:start) =~ s:fileHeadPattern
      break
    endif
    let l:start = l:start - 1
  endwhile
  if l:start == 0
    let l:start = line('.')
    while l:start <= line('$')
      if getline(l:start) =~ s:fileHeadPattern
        break
      endif
      let l:start = l:start + 1
    endwhile
  endif
  if l:start > line('$')
    " no files in the txtar
    return
  endif
  let l:end = l:start + 1
  while l:end <= line('$')
    if getline(l:end) =~ s:fileHeadPattern
      break
    endif
    let l:end = l:end + 1
  endwhile
  if a:inside
    let l:start = l:start + 1
  endif
  if l:end == l:start
    " empty file but want inside, so nothing to select
    return
  endif
  if mode() == 'v'
    " get out of visual mode before entering it
    exec "normal! \<ESC>"
  endif
  call cursor(l:start, 1)
  normal! 0V
  call cursor(l:end - 1, '$')
endfunction

