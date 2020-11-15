filetype plugin indent on
syntax on
" Modeline is dangerous: http://seclists.org/oss-sec/2016/q4/506
set nomodeline
" status display
set ruler
set showcmd
" show as much as will fit on overlfow lines
set display+=lastline
" generic indenting
set smarttab
set shiftround
set smartindent
" search and highlighting
set showmatch
set incsearch
set hlsearch
" backspace over everything
set backspace=indent,eol,start
" force case sensitivity with \C
"set ignorecase
set smartcase
" tab completion more like a shell, but still cycle
set wildmode=longest,full
set wildmenu
" C-A/C-X can increment letters
set nrformats+=alpha
" Use spelling dictionary for ctrl-X-ctrl-K
set dictionary+=spell
" Use https://github.com/vim/vim/files/2634525/thesaurus_pkg.zip from
" https://github.com/vim/vim/issues/629#issuecomment-443293282 ctrl-X-ctrl-T
set thesaurus+=~/.vim/thesaurus.txt
" Detect lists when formatting
set formatoptions+=n
" Delete comment markers when joining lines
if v:version >= 704
  set formatoptions+=j
endif
" automatically reload after external changes in clean buffers
set autoread
" Set color column to one past text width
if exists('+colorcolumn')
  set colorcolumn=+1
endif

" faster than :set paste, insert, :set nopaste
set pastetoggle=<F2>

" F3 to format the buffer
noremap <F3> :Autoformat<CR>

" make non-active splits less prominent
"hi StatusLineNC ctermbg=Gray guibg=Gray

" change directory to current file location
command! Cdf cd %:h

" compare with saved version
command! DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
    \ | wincmd p | diffthis

" context-sensitive tab completion
let g:SuperTabDefaultCompletionType = 'context'

" SnipMate configuration
let g:snips_author = 'Trevor Stone'
let g:snipMate = {}
let g:snipMate.snippet_version = 1
let g:snipMate.description_in_completion = 1

" 250ms delay before showing registers with vim-peekaboo
let g:peekaboo_delay = 250

" highlight cursor word in cyan
let g:quickhl_cword_enable_at_startup = 1
let g:quickhl_cword_hl_command = 'QuickhlCword guibg=LightCyan ctermbg=LightCyan term=reverse'

" configure rainbow parentheses
let g:rainbow_active = 1
let g:rainbow_conf = {
      \ 'ctermfgs': ['Black', 'DarkRed', 'DarkBlue', 'Brown', 'DarkGreen', 'DarkMagenta', 'DarkCyan', 'DarkGray'],
      \ }

" Settings for airline plugin
" dark theme is hard to read on translucent windows
let g:airline_theme = 'papercolor'
" Don't show signs for git changes; turn on with \gt
let g:signify_disable_by_default = 1
" Only show git change info if there is any
let g:airline#extensions#hunks#non_zero_only = 1
" Show buffers in tabline if only one tab is open
let g:airline#extensions#tabline#enabled = 1
" Show the column name when editing a CSV file
let g:airline#extensions#csv#column_display = 'Name'
" I already have git branch name in terminal title
let g:airline#extensions#branch#enabled = 0
" Only show file encoding and format if it's not utf-8[unix]
call airline#parts#define_condition('ffenc', '&fileformat != "unix" || &fileencoding != "utf-8" && &fileencoding != ""')

" TypeScript import preferences
let g:tsuquyomi_single_quote_import = 1
let g:tsuquyomi_shortest_import_path = 1

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

" Use ag rather than ack if it's installed
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
