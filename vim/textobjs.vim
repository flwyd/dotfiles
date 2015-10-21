" Settings for text objects

" Quotes
" % jumps to matching curly quotes
let g:textobj#quote#matchit = 1
map <silent> <Leader>q` <Plug>ReplaceWithCurly
map <silent> <Leader>q' <Plug>ReplaceWithStraight
" Load smart quote support by default for text formats.
augroup TextobjQuote
  autocmd!
  autocmd FileType markdown call textobj#quote#init()
  autocmd FileType text call textobj#quote#init({'educate': 0})
augroup END
