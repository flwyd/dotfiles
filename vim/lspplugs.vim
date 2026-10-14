" Language Server Protocol support
Plug 'prabirshrestha/vim-lsp'
" Automatic configuration for vim-lsp
Plug 'mattn/vim-lsp-settings'
" :CheckHealth to see what's up with vim-lsp
if !has('nvim')
  Plug 'rhysd/vim-healthcheck'
endif
