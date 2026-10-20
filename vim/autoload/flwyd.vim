" Echo some syntax attributes about the current cursor position.
function! flwyd#showCurSyntax() abort
  for l:id in synstack(line('.'), col('.'))
    let l:tr = synIDtrans(l:id)
    let l:parts = [printf('%s=%s', l:id, synIDattr(l:id, 'name'))]
    for l:a in ['name', 'fg', 'bg', 'ul']
      let l:parts = add(l:parts, printf('%s=%s', l:a, synIDattr(l:tr, l:a)))
    endfor
    for l:a in ['bold', 'italic', 'reverse', 'standout', 'underline', 'undercurl', 'strike', 'nocombine']
      if synIDattr(l:tr, l:a)
        let l:parts = add(l:parts, l:a)
      endif
    endfor
    echom join(l:parts, ' ')
  endfor
endfunction

" Read a file with `abbr=abbreviated.text` lines and run `abbreviate` for each
" entry.  This saves typing for common paths or identifiers.  A line like
" `cedpf=com/example/division/project/feature` allows `:e cedpf/User.java` in
" vim.  Abbreviations are available in both insert and command mode.  The
" abbreviation file format is meant to be sourced from a shell to create
" variables, so whitespace and variable references can be used if the whole
" right side is in double quotes: `lipsum="Lorem ipsum dolor sit amet" or
" `hvau="${HOME}/.vim/autoload` to refer to the HOME environment variable.
" Variables can refer to previously defined abbreviations:
" `cedp=com/example/division/project cepdf="$cepd/feature"`
" Single quotes can be used to allow whitespace but not variable expansion.
" Single or double quotes need to enclose the whole right side.  It's
" sometimes useful to have short abbreviations for the shell, e.g.
" `nm=node_modules` enabling `less $nm/mylib/index.js` but since Vim
" abbreviations are bare, this would disrupt commands like like `nmap`, so if
" the abbreviation is shorter than four characters, a `#` character is added
" to the end: `:e nm#/mylib/index.js`  This is a simple heuristic, so longer
" abbreviations should be chosen to avoid words or commands that are likely to
" be typed in a real session.  ^V can be used after the abbreviation to
" prevent expansion.
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

" Show location list in fzf popup, jump to selected item.
function flwyd#fzfLocations() abort
  call s:fzfQfs('ll', 'location', getloclist(0))
endfunction

" Show quickfix list in fzf popup, jump to selected item.
function flwyd#fzfQuickfix() abort
  call s:fzfQfs('cc', 'quickfix', getqflist())
endfunction

function s:fzfQfs(cmd, description, qfs) abort
  if empty(a:qfs)
    echo 'Empty' a:description 'list'
    return
  endif
  let l:lines = mapnew(a:qfs, {i, q -> printf('(%d) %s', i+1, s:qfToString(q))})
  call fzf#run(#{source: l:lines, sink: {q -> s:goQfString(a:cmd, q)}})
endfunction

function s:qfToString(qf) abort
  let l:bufs = getbufinfo(a:qf.bufnr)
  if empty(bufs) || empty(bufs[0].name)
    let l:name = '[No Name]'
  else
    let l:name = bufs[0].name
  endif
  return printf('%s:%d %s', l:name, a:qf.lnum, a:qf.text)
endfunction

function s:goQfString(cmd, str) abort
  if !empty(a:str)
    let l:num = substitute(a:str, '\v^\((\d+)\).*', '\1', '')
    exec l:num .. a:cmd
  endif
endfunction

" Expand the GUI to show the gutter and the full text.
function flwyd#maybeAdjustColumns() abort
  if has('gui')
    let l:want = flwyd#desiredColumns()
    if l:want > &columns
      let &columns = l:want
    endif
  endif
endfunction

" Computes the desired value of &columns to show all window text plus gutter.
function flwyd#desiredColumns() abort
  return max([&columns] + map(getwininfo(), {_, w -> s:desiredWindowWidth(w)}))
endfunction

function s:desiredWindowWidth(wininfo) abort
  let l:buf = a:wininfo.bufnr
  let l:gutter = get(a:wininfo, 'textoff', -1)
  if l:gutter == -1
    " textoff property was added around vim 8.3, fallback computation:
    if getbufvar(l:buf, '&number')
      let l:lines = line('$')
      " vim always has space for at least 3-digit line numbers plus a space
      let l:numw = l:lines < 1000 ? 4 : float2nr(log10(l:lines)) + 2
    else
      let l:numw = 0
    endif
    let l:foldw = getbufvar(l:buf, '&foldcolumn')
    let l:signw = 0
    let l:signcol = getbufvar(l:buf, '&signcolumn')
    if l:signcol == 'yes' ||
          \ (l:signcol == 'auto' && !empty(sign_getplaced(l:buf)[0].signs))
      let signw = 2
    endif
    let l:gutter = l:numw + l:foldw + l:signw
    echom 'gutter' l:gutter 'numw' l:numw 'foldw' l:foldw 'signw' l:signw 'signcol' l:signcol
  endif
  let l:textw = getbufvar(l:buf, '&textwidth')
  let l:colcol =  getbufvar(l:buf, '&colorcolumn')
  if l:colcol =~ '+-'
    let l:colcolw = 0
  else
    let l:colcolw = str2nr(l:colcol)
  endif
  let l:content = max([l:textw, l:colcolw, 80])
  return l:gutter + l:content
endfunction
