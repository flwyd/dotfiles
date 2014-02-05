""" General purpose mappings

" Make Y work like D and C, use yy for vi behavior
map Y y$

" Quickly turn off search highlights
nnoremap <Silent> <Leader>/ :nohl<CR>

" Allow switching vim windows and deleting a word when SSH is in a Chrome tab
" C-@ can be hit as ctrl-`; it normally does a repeat insert at start of imode
map <C-@> <C-W>
map! <C-@> <C-W>


""" \d mappings to navigate directories

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
" split file in current file's directory
nnoremap <Leader>ds :sp %:h/
" read file in the current file's directory
nnoremap <Leader>dr :r %:h/
" toggle showing status line always or only with splits
nnoremap <Leader>dS :let &laststatus=(2 == &laststatus ? 1 : 2)<CR>


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
