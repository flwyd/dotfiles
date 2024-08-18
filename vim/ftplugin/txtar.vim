set foldexpr=s:TxtarFold()
set foldmethod=expr

function! s:TxtarFold() abort
  return getline(v:lnum) =~ '^-- .* --$' ? '>1' : '='
endfunction

