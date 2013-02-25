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
" automatically reload after external changes in clean buffers
set autoread

" faster than :set paste, insert, :set nopaste
set pastetoggle=<F2>

" make non-active splits less prominent
hi StatusLineNC ctermbg=Gray guibg=Gray

" change directory to current file location
command! Cdf cd %:h

" compare with saved version
command! DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
    \ | wincmd p | diffthis

" Directory navigation shortcuts
" browse directory of current file
nnoremap <Leader>df :NERDTree %<CR>
" browse parent directory of current file
nnoremap <Leader>du :NERDTree %:h:h<CR>
" browse current working directory
nnoremap <Leader>dd :NERDTree .<CR>
" browse parent of current working directory
nnoremap <Leader>dD :NERDTree ..<CR>
" hide/show directory browser
nnoremap <Leader>dx :NERDTreeToggle<CR>
" edit file in current file's directory
nnoremap <Leader>de :e %:h/

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif
