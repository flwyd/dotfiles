" Highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
augroup WhitespaceMatch
  " Remove autocommands for the group
  autocmd!
  autocmd BufWinEnter * let w:whitespace_match=matchadd('ExtraWhitespace', '\s\+$')
  autocmd InsertEnter * call s:ToggleWhitespaceMatch('i')
  autocmd InsertLeave * call s:ToggleWhitespaceMatch('n')
augroup END
function! s:ToggleWhitespaceMatch(mode)
  let pattern = (a:mode == 'i') ? '\s\+\%#\@<!$' : '\s\+$'
  if exists('w:whitespace_match')
    call matchdelete(w:whitespace_match)
    call matchadd('ExtraWhitespace', pattern, 10, w:whitespace_match)
  else
    " Something went wrong, try to be graceful.
    let w:whitespace_match = matchadd('ExtraWhitespace', pattern)
  endif
endfunction
