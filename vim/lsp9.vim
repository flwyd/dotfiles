vim9script

g:airline#extensions#vim9lsp#enabled = 1
# TODO revisit when working on a real Rust project
g:lsp_settings = {
  'bacon-ls': {disabled: 1},
}
const lspOptions = {
  autoComplete: false,
  omniComplete: true,
}

augroup lsp_setup
  autocmd!
  autocmd User LspSetup call LspOptionsSet(lspOptions)
  autocmd User LspAttached call OnLspAttached()
  autocmd User LspDetached call OnLspDetached()
augroup END

def OnLspAttached()
  final oldlocals = get(b:, 'lsp9_old_locals', {})
  # Already handled via lspOptions
  # oldlocals['omnifunc'] = &omnifunc
  # setlocal omnifunc=g:LspOmniFunc
  oldlocals['tagfunc'] = &tagfunc
  setlocal tagfunc=lsp#lsp#TagFunc
  oldlocals['signcolumn'] = &signcolumn
  setlocal signcolumn=number
  # K does LspHover
  oldlocals['keywordprg'] = &keywordprg
  setlocal keywordprg=:LspHover
  b:lsp9_old_locals = oldlocals
  # gd normally goes to local definition
  nmap <buffer> <silent> gd <cmd>LspGotoDefinition<CR>
  # gD normally goes to global definition
  nmap <buffer> <silent> gD <cmd>LspPeekDefinition<CR>
  # gr normally does visual replace for tsv
  nmap <buffer> <silent> gr <cmd>LspShowReferences<CR>
  # gR normally does R in visual replace mode for tsv
  nmap <buffer> <silent> gR <cmd>LspRename<CR>
  # gI normally inserts at column 1
  nmap <buffer> <silent> gI <cmd>LspGotoImpl<CR>
  # gy and gY aren't yet defined by vim
  nmap <buffer> <silent> gy <cmd>LspGotoTypeDef<CR>
  nmap <buffer> <silent> gY <cmd>LspPeekTypeDef<CR>
  # gA is not yet defined by vim
  nmap <buffer> <silent> gA <cmd>LspCodeAction<CR>
  # [g and ]g aren't yet defined by vim
  nmap <buffer> <silent> [g <cmd>LspDiag prev<CR>
  nmap <buffer> <silent> ]g <cmd>LspDiag next<CR>
  # g? normally does rot13 encoding of motion, use it for 'what error?'
  nmap <buffer> <silent> g? <cmd>LspDiag current<CR>
  # \f mappings for fuzzy search
  nmap <buffer> <silent> <Leader>fs <cmd>LspSymbolSearch<CR>
enddef

def OnLspDetached()
  final oldlocals = get(b:, 'lsp9_old_locals', {})
  if !empty(oldlocals)
    # setlocal omnifunc=oldlocals['omnifunc']
    setlocal tagfunc=oldlocals['tagfunc']
    setlocal signcolumn=oldlocals['signcolumn']
  endif
  silent! unmap <buffer> gd
  silent! unmap <buffer> gD
  silent! unmap <buffer> gr
  silent! unmap <buffer> gR
  silent! unmap <buffer> gI
  silent! unmap <buffer> gy
  silent! unmap <buffer> gY
  silent! unmap <buffer> gA
  silent! unmap <buffer> [g
  silent! unmap <buffer> ]g
  silent! unmap <buffer> g?
  silent! unmap <buffer> <Leader>fs
enddef
