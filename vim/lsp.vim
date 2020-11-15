" Configuration for vim-lsp
let g:lsp_signs_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:airline#extensions#lsp#enabled = 1
" Make sure gopls is in the path
if !executable('gopls')
  if has_key(environ(), 'GOBIN') && executable($GOBIN . '/gopls')
    let $PATH = $PATH . ':' . $GOBIN
  elseif has_key(environ(), 'GOPATH') && executable($GOPATH . '/bin/gopls')
    let $PATH = $PATH . ':' . ':' . $GOPATH . '/bin'
  elseif has_key(environ(), 'HOME') && executable($HOME . '/go/bin/gopls')
    let $PATH = $PATH . ':' . $HOME . '/go/bin'
  endif
endif

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=number
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    " gd normally goes to definition
    nmap <buffer> gd <plug>(lsp-definition)
    " C-W C-] normally splits and jumps to tag, still available w/ C-W ]
    nmap <buffer> <C-W><C-]> <plug>(lsp-peek-definition)
    " gr normally does visual replace for tsv
    nmap <buffer> gr <plug>(lsp-references)
    " gI normally inserts at column 1
    nmap <buffer> gI <plug>(lsp-implementation)
    " gt normally goes to the next tab, consider gY or something
    nmap <buffer> gt <plug>(lsp-type-definition)
    " gR normally does R in visual replace mode for tsv
    nmap <buffer> gR <plug>(lsp-rename)
    "nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <Plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <Plug>(lsp-next-diagnostic)
    setlocal keywordprg=:LspHover
    "nmap <buffer> K <plug>(lsp-hover)
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for langs with registered server
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
