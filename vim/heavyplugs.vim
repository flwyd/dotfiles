" Plugins with major functionality or significant dependencies

" TlistOpen for function/tag overview
Plug 'taglist.vim'
" :Bck [options] pattern to ack the tree, default <cword>
Plug 'mihaifm/Bck', { 'on': 'Bck' }
" :GundoToggle tree replacement for :undolist
Plug 'sjl/gundo.vim', { 'on': 'GundoToggle' }
" ConqueTerm command output in a buffer
Plug 'basepi/vim-conque', { 'on': 'ConqueTerm' }
" ShellTerminal, Shell asynchronous comand output to a window
" Needs vim 7.3, patchset 569
if exists('*pyeval')
  Plug 'troydm/shellasync.vim'
endif
