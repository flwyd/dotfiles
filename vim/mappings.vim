""" General purpose mappings

" Make Y work like D and C, use yy for vi behavior
map Y y$

" Quickly turn off search highlights
nnoremap <silent> <Leader>/ :nohl<CR>

" Allow switching vim windows and deleting a word when SSH is in a Chrome tab
" C-@ can be hit as ctrl-` or ctrl-space; it normally does a repeat insert at
" start of imode
map <unique> <C-@> <C-W>
map! <unique> <C-@> <C-W>

" F3 to format the buffer
noremap <F3> :Autoformat<CR>


""" \d mappings to navigate directories
" browse directory of current file
nnoremap <Leader>df :NERDTree %<CR>
" browse parent directory of current file
nnoremap <Leader>du :NERDTree %:h:h<CR>
" browse current working directory
nnoremap <Leader>dd :NERDTree .<CR>
" browse parent of current working directory
nnoremap <Leader>dD :NERDTree ..<CR>
" show directory browser and move focus there
nnoremap <Leader>dx :NERDTreeFocus<CR>
" edit file in current file's directory
nnoremap <Leader>de :e %:h/
" split file in current file's directory
nnoremap <Leader>ds :sp %:h/
" read file in the current file's directory
nnoremap <Leader>dr :r %:h/
" toggle showing status line always or only with splits
nnoremap <Leader>dS :let &laststatus=(2 == &laststatus ? 1 : 2)<CR>


""" \w mappings for window management
" Open taglist
nnoremap <Leader>wt :TlistToggle<CR>
" Open tagbar
nnoremap <Leader>wT :TagbarToggle<CR>


""" \s mappings to perform common substitutions
" Don't append <CR> so the command can be edited (like prepending %).

" \s: to convert Ruby hash literals from 1.8 to 1.9 syntax.
noremap <Leader>s: :s/\:\([A-Za-z_][A-Za-z0-9_?]*\)\s*=>/\1:/g
" \s| to convert pipe delimited, fixed width columnar output to tabs and delete
" table border lines like +----+----+
noremap <Leader>s<Bar> :%s/^<Bar> // <Bar> %s/ <Bar>$// <Bar> %s/ \+<Bar> \+/<Tab>/g <Bar> g/^+\(-\++\)\+$/d
" \s' and \s" to convert "smart" (left/right) quotes to "dumb" quotes
" U+2018-9 is LEFT/RIGHT SINGLE QUOTATION MARK, 201A-B is LOW-9/HIGH-REVERSED-9
noremap <Leader>s' :s/[\u2018-\u201B]/'/g
" U+201C-D is LEFT/RIGHT DOUBLE QUOTATION MARK, 201E-F is LOW-9/HIGH-REVERSED-9
noremap <Leader>s" :s/[\u201C-\u201F]/"/g


""" Completion mappings (MUcomplete + snipMate)
" Expand snippets on enter, see |mucomplete-compatibility|
inoremap <plug>MyEnter <CR>
imap <silent> <expr> <plug>MyCR (pumvisible()
    \ ? "\<c-y>\<plug>snipMateTrigger"
    \ : "\<plug>MyEnter")
imap <CR> <plug>MyCR
" After activating snipMate, don't let MUcomplete take tabs
imap <silent> <expr> <Tab> (exists('b:snip_state')
    \ ? "\<plug>(snipMateNextOrTrigger)"
    \ : "\<plug>(MUcompleteFwd)")
" Use C-] to insert subsequent words like C-X C-P
inoremap <expr> <C-]> mucomplete#extend_bwd("\<C-]>")


""" \D mappings for drawing; DrawIt defines mappings for
" arrows, shift-arrows, <>^v, space, \<>^v \abefhls \ra-\rz \pa-\pz
" Start drawing
map <Leader>Ds <Plug>DrawItStart
" Stop drawing
map <Leader>Dx <Plug>DrawItStop
" Draw in single-stroke unicode mode
map <Leader>D1 :DIsngl<CR>
" Draw in double-stroke unicode mode
map <Leader>D2 :DIdbl<CR>
" Draw in ascii mode (default)
map <Leader>D0 :DInrml<CR>
