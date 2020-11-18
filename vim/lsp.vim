" Configuration for vim-lsp
let g:lsp_signs_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:airline#extensions#lsp#enabled = 1
" Make sure gopls is in the path
if !executable('gopls')
  if !empty($GOBIN) && executable($GOBIN . '/gopls')
    let $PATH = $PATH . ':' . $GOBIN
  elseif !empty($GOPATH) && executable($GOPATH . '/bin/gopls')
    let $PATH = $PATH . ':' . ':' . $GOPATH . '/bin'
  elseif !empty($HOME) && executable($HOME . '/go/bin/gopls')
    let $PATH = $PATH . ':' . $HOME . '/go/bin'
  endif
endif

function! s:on_lsp_buffer_enabled() abort
  setlocal omnifunc=lsp#complete
  setlocal signcolumn=number
  if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
  " gd normally goes to local definition
  nmap <buffer> gd <plug>(lsp-definition)
  " C-W C-] normally splits and jumps to tag, still available w/ C-W ]
  "nmap <buffer> <C-W><C-]> <plug>(lsp-peek-definition)
  " gD normally goes to global definition
  nmap <buffer> gD <plug>(lsp-peek-definition)
  " gr normally does visual replace for tsv
  nmap <buffer> gr <plug>(lsp-references)
  " gR normally does R in visual replace mode for tsv
  nmap <buffer> gR <plug>(lsp-rename)
  " gI normally inserts at column 1
  nmap <buffer> gI <plug>(lsp-implementation)
  " gy and gY aren't yet defined by vim
  nmap <buffer> gy <plug>(lsp-type-definition)
  nmap <buffer> gY <plug>(lsp-peek-type-definition)
  " [g and ]g aren't yet defined by vim
  nmap <buffer> [g <Plug>(lsp-previous-diagnostic)
  nmap <buffer> ]g <Plug>(lsp-next-diagnostic)
  " K does LspHover
  setlocal keywordprg=:LspHover
endfunction

augroup lsp_install
  au!
  " call s:on_lsp_buffer_enabled only for langs with registered server
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
" Close preview window with <esc>, seems to break popup window though
" autocmd User lsp_float_opened nmap <buffer> <silent> <esc> <plug>(lsp-preview-close)
" autocmd User lsp_float_closed nunmap <buffer> <esc>
