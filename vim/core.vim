filetype plugin indent on
syntax on
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
" force case sensitivity with \C
"set ignorecase
set smartcase
" tab completion more like a shell, but still cycle
set wildmode=longest,full
set wildmenu
" C-A/C-X can increment letters
set nrformats+=alpha
" Delete comment markers when joining lines
" Not in vim 73
"set formatoptions+=j
" automatically reload after external changes in clean buffers
set autoread

" faster than :set paste, insert, :set nopaste
set pastetoggle=<F2>

" make non-active splits less prominent
"hi StatusLineNC ctermbg=Gray guibg=Gray

" change directory to current file location
command! Cdf cd %:h

" compare with saved version
command! DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
    \ | wincmd p | diffthis

" Settings for airline plugin
" Don't show signs for git changes; turn on with \gt
let g:signify_disable_by_default = 1
" Only show git change info if there is any
let g:airline#extensions#hunks#non_zero_only = 1
" Show the column name when editing a CSV file
let g:airline#extensions#csv#column_display = 'Name'
" Only show file encoding and format if it's not utf-8[unix]
call airline#parts#define_condition('ffenc', '\&fileformat != "unix" || \&fileencoding != "utf-8" \&\& \&fileencoding != ""')

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif
