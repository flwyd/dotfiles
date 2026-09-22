" txtar Text Archive format documented at
" https://pkg.go.dev/golang.org/x/tools/txtar#hdr-Txtar_format
" Some additional features to support Go test scripts in the file comment:
" https;//pkg.go.dev/github.com/rogpeppe/go-internal/testscript

if exists('b:did_ftplugin')
  finish
endif
let b:did_ftplugin = 1
let s:cpo_save = &cpo
set cpo&vim

" TODO check has('folding') && get(g:, 'txtar_folding')
" Fold each file
setlocal foldmethod=syntax
" Go testscript uses octothorpe comments
setlocal commentstring=#\ %s

" Text objects: a file, inside file
onoremap <buffer> <silent>af <Cmd>call txtar#FileTextobj(0)<CR>
onoremap <buffer> <silent>if <Cmd>call txtar#FileTextobj(1)<CR>
xnoremap <buffer> <silent>af <Cmd>call txtar#FileTextobj(0)<CR>
xnoremap <buffer> <silent>if <Cmd>call txtar#FileTextobj(1)<CR>

" Move between files, like vi builtins but without curly braces:
" [[ previous file header
" ]] next file header
" [] last line of previous file
" ][ last line of next file
" findFile indirection avoids complication of \| used in both pattern and map
nnoremap [[ <Cmd>call <SID>findFile(1, 0)<CR>
nnoremap ]] <Cmd>call <SID>findFile(0, 0)<CR>
nnoremap [] <Cmd>call <SID>findFile(1, 1)<CR>
nnoremap ][ <Cmd>call <SID>findFile(0, 1)<CR>

function! s:findFile(back, end) abort
  let l:pat = '^-- .* --$\|\%' . (a:back ? '^' : '$')
  if a:end
    let l:pat = '\n' . l:pat
  endif
  let l:flags = a:back ? 'bW' : 'W'
  call search(l:pat, l:flags)
endfunction

let b:undo_ftplugin = 'setlocal commentstring< foldmethod<'
      \ .. '| ounmap af | ounmap if | xunmap af | xunmap if'
      \ .. '| ounmap [[ | ounmap ]] | xunmap [] | xunmap ]['

let &cpo = s:cpo_save
unlet s:cpo_save
