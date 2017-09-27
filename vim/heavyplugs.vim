" Plugins with major functionality or significant dependencies

" TlistOpen for function/tag overview, requires exuberant ctags
Plug 'vim-scripts/taglist.vim'
" Show positional tags, requires exuberant ctags
Plug 'majutsushi/tagbar'
" :Bck [options] pattern to ack the tree, default <cword>
Plug 'mihaifm/Bck', { 'on': 'Bck' }
" :GundoToggle tree replacement for :undolist
Plug 'sjl/gundo.vim', { 'on': 'GundoToggle' }
" ConqueTerm command output in a buffer
Plug 'basepi/vim-conque', { 'on': 'ConqueTerm' }
" Interactive command execution
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
" TypeScript omnicomplete, symbol jumps, make, etc; needs vimproc
if v:version >= 704
  Plug 'Quramy/tsuquyomi'
endif
" ShellTerminal, Shell asynchronous comand output to a window
" Needs vim 7.3, patchset 569
if exists('*pyeval')
  Plug 'troydm/shellasync.vim'
endif
