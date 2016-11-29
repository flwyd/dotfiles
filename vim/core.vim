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

" highlight cursor word in cyan
let g:quickhl_cword_enable_at_startup = 1
let g:quickhl_cword_hl_command = 'QuickhlCword guibg=LightCyan ctermbg=LightCyan term=reverse'

" configure rainbow parentheses
let g:rainbow_active = 1
let g:rainbow_conf = {
      \ 'ctermfgs': ['Black', 'Gray', 'DarkRed', 'DarkBlue', 'Brown', 'DarkGreen', 'DarkMagenta', 'DarkCyan'],
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

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif
