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

" Interactive EasyAlign with g|
nmap g<Bar> <Plug>(EasyAlign)
xmap g<Bar> <Plug>(EasyAlign)

" F3 to format the buffer
noremap <F3> :Autoformat<CR>

" Use Q/q with vim-surround to replace with smart quotes, e.g. cs"Q
let g:surround_81 = "“\r”"
let g:surround_113 = "‘\r’"

""" \d mappings to navigate directories
" browse directory of current file
nnoremap <Leader>df :NERDTree %<CR>
" browse parent directory of current file
nnoremap <Leader>du :NERDTree %:h:h<CR>
" browse current working directory
nnoremap <Leader>dd :NERDTree .<CR>
" browse parent of current working directory
nnoremap <Leader>dD :NERDTree ..<CR>
" browse directory of word under cursor, but maybe edit it
nnoremap <Leader>dw :NERDTree <C-R>=expand('<cword>')<CR>
" browse directory of WORD under cursor, but maybe edit it
nnoremap <Leader>dW :NERDTree <C-R>=expand('<cWORD>')<CR>
" show directory browser and move focus there
nnoremap <Leader>dx :NERDTreeFocus<CR>
" hide/show directory browser
nnoremap <Leader>dX :NERDTreeToggle<CR>
" edit file in current file's directory
nnoremap <Leader>de :e %:h/
" split file in current file's directory
nnoremap <Leader>ds :sp %:h/
" read file in the current file's directory
nnoremap <Leader>dr :r %:h/
" toggle showing status line always or only with splits
nnoremap <Leader>dS :let &laststatus=(2 == &laststatus ? 1 : 2)<CR>


""" \f mappings for fuzzy search
" When applicable, lower case refers to current buffer, upper case globally
" except that f means files in current dir, F means files checked out in VCS,
" and space prompts for a file
nnoremap <silent> <Leader>ff :Files<CR>
nnoremap <silent> <Leader>fF :GFiles?<CR>
nnoremap <silent> <Leader>fb :Buffers<CR>
nnoremap <silent> <Leader>fw :Windows<CR>
nnoremap <silent> <Leader>fm :Marks<CR>
nnoremap <silent> <Leader>fM :Maps<CR>
nnoremap <silent> <Leader>ft :BTags<CR>
nnoremap <silent> <Leader>fT :Tags<CR>
nnoremap <silent> <Leader>fl :BLines<CR>
nnoremap <silent> <Leader>fL :Lines<CR>
nnoremap <silent> <Leader>fh :History<CR>
nnoremap <silent> <Leader>f: :History:<CR>
nnoremap <silent> <Leader>f/ :History/<CR>
nnoremap <silent> <Leader>fc :Commands<CR>
nnoremap <silent> <Leader>fg :BCommits<CR>
nnoremap <silent> <Leader>fG :Commits<CR>
nnoremap <Leader>f<Space> :Files<Space>


""" \t mappings for tag functions
" Open tagbar and close it after selecting a tag
nnoremap <silent> <Leader>tt :TagbarOpenAutoClose<CR>
xnoremap <silent> <Leader>tt :TagbarOpenAutoClose<CR>
" Open tagbar and leave it open
nnoremap <silent> <Leader>to :TagbarOpen<CR>
xnoremap <silent> <Leader>to :TagbarOpen<CR>
" Close tagbar
nnoremap <silent> <Leader>tx :TagbarClose<CR>
xnoremap <silent> <Leader>tx :TagbarClose<CR>
" (Un)pause tagbar updates when switching files (will still jump in cur file)
nnoremap <silent> <Leader>tp :TagbarTogglePause<CR>
xnoremap <silent> <Leader>tp :TagbarTogglePause<CR>
" Echo the current tag with hierachy and function args
nnoremap <silent> <Leader>te :TagbarCurrentTag fs<CR>
xnoremap <silent> <Leader>te :TagbarCurrentTag fs<CR>
" Unfold parents until the current tag is visible
nnoremap <silent> <Leader>tu :TagbarShowTag<CR>
xnoremap <silent> <Leader>tu :TagbarShowTag<CR>
" Do an ag search for word under cursor, show popup
nnoremap <silent> <Leader>tj :AnyJump<CR>
xnoremap <silent> <Leader>tj :AnyJumpVisual<CR>
" Jump back to file where AnyJump started
nnoremap <silent> <Leader>tJ :AnyJumpBack<CR>
xnoremap <silent> <Leader>tJ :AnyJumpBack<CR>
" Open last AnyJump popup
nnoremap <silent> <Leader>tl :AnyJumpLast<CR>
xnoremap <silent> <Leader>tl :AnyJumpLast<CR>


""" Mappings for vim-textmanip to move/duplicate lines/selection
" CTRL-H/J/K/L move line/selection, \D duplicates. left/right only on in visual
" TODO remove belloff after https://github.com/t9md/vim-textmanip/issues/11
set belloff+=esc
nmap <C-K> <Plug>(textmanip-move-up)
xmap <C-K> <Plug>(textmanip-move-up)
nmap <C-J> <Plug>(textmanip-move-down)
xmap <C-J> <Plug>(textmanip-move-down)
xmap <C-H> <Plug>(textmanip-move-left)
xmap <C-L> <Plug>(textmanip-move-right)
nmap <C-D>k <Plug>(textmanip-duplicate-up)
xmap <C-D>k <Plug>(textmanip-duplicate-up)
nmap <C-D><C-K> <Plug>(textmanip-duplicate-up)
xmap <C-D><C-K> <Plug>(textmanip-duplicate-up)
nmap <C-D>j <Plug>(textmanip-duplicate-down)
xmap <C-D>j <Plug>(textmanip-duplicate-down)
nmap <C-D><C-J> <Plug>(textmanip-duplicate-down)
xmap <C-D><C-J> <Plug>(textmanip-duplicate-down)
nmap <C-D>h vaW<Plug>(textmanip-duplicate-left)
xmap <C-D>h <Plug>(textmanip-duplicate-left)
nmap <C-D><C-H> vaW<Plug>(textmanip-duplicate-left)
xmap <C-D><C-H> <Plug>(textmanip-duplicate-left)
nmap <C-D>l vaW<Plug>(textmanip-duplicate-right)
xmap <C-D>l <Plug>(textmanip-duplicate-right)
nmap <C-D><C-L> vaW<Plug>(textmanip-duplicate-right)
xmap <C-D><C-L> <Plug>(textmanip-duplicate-right)
" Normal ctrl-D behavior (scroll [count]/half page down) is ctrl-D ctrl-D
nnoremap <C-D><C-D> <C-D>
xnoremap <C-D><C-D> <C-D>


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
" Avoid beep on snipmate complete in select mode, see DiscretionaryEnd call
let g:endwise_no_mappings = 1
" Expand snippets on enter, see |mucomplete-compatibility|
inoremap <plug>MyEnter <CR><Plug>DiscretionaryEnd
imap <silent> <expr> <plug>MyCR (pumvisible()
    \ ? "\<c-y>\<plug>snipMateTrigger"
    \ : "\<plug>MyEnter")
imap <CR> <plug>MyCR
" After activating snipMate, don't let MUcomplete take tabs
imap <expr> <Tab> (exists('b:snip_state')
    \ ? "\<Plug>snipMateNextOrTrigger" : "\<Plug>(MUcompleteFwd)")
imap <expr> <S-Tab> (exists('b:snip_state')
    \ ? "\<Plug>snipMateBack" : "\<Plug>(MUcompleteBwd)")
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
