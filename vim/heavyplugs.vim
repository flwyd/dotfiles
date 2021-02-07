" Plugins with major functionality or significant dependencies

" TlistOpen for function/tag overview, requires exuberant ctags
Plug 'vim-scripts/taglist.vim'
" Show positional tags, requires exuberant ctags
Plug 'majutsushi/tagbar'
" Automatically generate tags on edit and save
Plug 'ludovicchabant/vim-gutentags'
" :FZF options path to perform a fuzzy search in path
Plug 'junegunn/fzf'
" fzf on :Files :Buffers :Ag :Lines :Tags :History :Commits :Commands :GFiles? …
Plug 'junegunn/fzf.vim'
" :Ack [opts] {pat} [dirs] ack/ag :Ack{FromSearch|Window} :LAck* to locationlist
Plug 'mileszs/ack.vim'
" :Bck [options] pattern to ack the tree, default <cword>
Plug 'mihaifm/Bck', { 'on': 'Bck' }
" Definition jumps: \j ag: s split p preview r refs T group; \ab back \al last
if has('popup')
  Plug 'pechorin/any-jump.vim'
endif
" :GundoToggle tree replacement for :undolist
Plug 'sjl/gundo.vim', { 'on': 'GundoToggle' }
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
