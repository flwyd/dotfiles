function! flwyd#readAbbreviations(filename) abort
  if !a:filename->filereadable()
    echoerr "Can't read abbreviations file" a:filename
    return
  endif
  let l:abbrevs = {}
  for l:line in readfile(a:filename)
    if l:line =~? '^\w\+=.\+'
      let l:lhs = l:line[:stridx(l:line, '=')-1]
      let l:rhs = l:line[stridx(l:line, '=')+1:]
      if l:rhs =~? "^'.*'$"
        let l:rhs = l:rhs[1:-2]
      elseif l:rhs =~? '^".*"$'
        let l:rhs = substitute(l:rhs[1:-2], '\${\?\(\w\+\)}\?',
            \ {m -> s:resolveVariable(l:abbrevs, m[1])}, 'g')
      else
      endif
      if len(l:lhs) < 4
        " don't abbreviate all 'js' occurrences to 'javascript'
        let l:lhs = l:lhs . '#'
      endif
      let l:abbrevs[l:lhs] = l:rhs
    else
    endif
  endfor
  for [l:lhs, l:rhs] in l:abbrevs->items()
    execute 'abbreviate' l:lhs l:rhs
  endfor
endfunction

function s:resolveVariable(dict, varname) abort
  if a:dict->has_key(a:varname)
    return a:dict[a:varname]
  endif
  if a:varname->getenv() !=# v:null
    return a:varname->getenv()
  endif
  return '$' . a:varname
endfunction
