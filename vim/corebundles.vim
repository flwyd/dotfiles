" Set up vundle
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" self-manage vundle
Bundle 'gmarik/vundle'
" Go syntax, commands, etc.
Bundle 'jnwhiteh/vim-golang'
" \\<motion> to highlight jump options
Bundle 'Lokaltog/vim-easymotion'
" \be \bs \bv for buffer list
Bundle 'c9s/bufexplorer'
" template code insertion
Bundle 'msanders/snipmate.vim'
" highlight enclosing tag
Bundle 'Valloric/MatchTagAlways'
" :A alt file :AS split :AN cycle :IH \ih cursor \is alt under cursor
Bundle 'a.vim'
" sxy like fx for two chars, multiline; S backwards; dzxy as operator
Bundle 'justinmk/vim-sneak'
" Enhanced directory navigation
Bundle 'scrooloose/nerdtree'
" comment commands \ci (invert) \cc (line) \cm (block) \c  (toggle) \cy (yank)..
Bundle 'scrooloose/nerdcommenter'
" readline mappings in insert and command mode
Bundle 'tpope/vim-rsi'
" let . repeate mapped commands
Bundle 'tpope/vim-repeat'
" :Abolish to iabbrev combinatorically
" :S/child{,ren}/adult{,s}/g
" crs crm crc cru coerce snake, mixed, camel, upper
Bundle 'tpope/vim-abolish'
" fC-U to jump to upper case, fC-W fC-E move within camel and snake case words
" Disabled so sneak works with ;/,
" Bundle 'tpope/vim-flatfoot'
" C-A/C-X to in/decrement times, ranges, etc.
Bundle 'tpope/vim-speeddating'
" automatically insert end keywords for shell, vim, ruby, etc.
Bundle 'tpope/vim-endwise'
" buffer commands Remove Move Chmod Find Locate SudoWrite and W
Bundle 'tpope/vim-eunuch'
" git commands beginning with :G
Bundle 'tpope/vim-fugitive'
" guess the indent settings
Bundle 'tpope/vim-sleuth'
" cs"' to switch " to ', ds) deletes parens, ysiw<q> wraps word in <q>,
" S<foo bar=42> in visual mode
Bundle 'tpope/vim-surround'
" ga on a character for extended details
Bundle 'tpope/vim-characterize'
" markdown syntax
Bundle 'tpope/vim-markdown'
" C-A, C-X to increment, decrement a column of numbers
Bundle 'triglav/vim-visual-increment'
" gS to split single-line constructs to multiline, gJ to join them
Bundle 'AndrewRadev/splitjoin.vim'
" da, to delete comma list item, cil' to change in last quote, etc.
Bundle 'wellle/targets.vim'
" Show number of hits when searching
Bundle 'google/vim-searchindex'
" fancy statusline
Bundle 'bling/vim-airline'
" CSV support
Bundle 'chrisbra/csv.vim'
" Show positional ctags
Bundle 'majutsushi/tagbar'
" Signs/highliting for lines changed from version control
Bundle 'mhinz/vim-signify'
" HTML5 omnicomplete, indent, and syntax
Bundle 'othree/html5.vim'
" JSON syntax and error highlighting
Bundle 'elzr/vim-json'
