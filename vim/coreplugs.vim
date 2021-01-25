" From .vimrc:
" if empty(glob('~/.vim/autoload/plug.vim'))
"   silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
"     \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"   autocmd VimEnter * PlugInstall | source $MYVIMRC
" endif
" call plug#begin('~/.vim/plugged')
" source ~/dotfiles/vim/coreplugs.vim
" call plug#end()

" \\<motion> to highlight jump options
Plug 'Lokaltog/vim-easymotion'
" \be \bs \bv for buffer list
Plug 'c9s/bufexplorer'
" dependency for vim-snipmate
Plug 'MarcWeber/vim-addon-mw-utils'
" :TScratch split scrath buf, :TBrowseOutput CMD, :Texecqfl CMD show quickfix
Plug 'tomtom/tlib_vim'
" insert snippets from snippets/lang.snippets files
Plug 'garbas/vim-snipmate'
" community-contributed snippets
Plug 'honza/vim-snippets'
" highlight enclosing tag
if has('python') || has('python3')
  Plug 'Valloric/MatchTagAlways'
endif
" highlight current term, :QuickhlManualAdd pattern
Plug 't9md/vim-quickhl'
" :A alt file :AS split :AN cycle :IH \ih cursor \is alt under cursor
Plug 'vim-scripts/a.vim'
" :Bgrep /re/ search buffers, Agrep args, Wgrep windows
Plug 'vim-scripts/buffergrep'
" sxy like fx for two chars, multiline; S backwards; dzxy as operator
Plug 'justinmk/vim-sneak'
" - directory browser - up . file to cmd y. yank abs path ~ home ctrl-6 prev
" Plug 'tpope/vim-vinegar'
" Enhanced directory navigation
Plug 'preservim/nerdtree'
" Sync NERDTree with current buffer
Plug 'unkiwii/vim-nerdtree-sync'
" comment commands \ci (invert) \cc (line) \cm (block) \c  (toggle) \cy (yank)..
Plug 'preservim/nerdcommenter'
" comment: gc{move} gcc toggle g<{move} g>{move} un/comment C-_C-_ insert
Plug 'tomtom/tcomment_vim'
" readline mappings in insert and command mode
Plug 'tpope/vim-rsi'
" let . repeat mapped commands
Plug 'tpope/vim-repeat'
" :Abolish to iabbrev combinatorically
" :S/child{,ren}/adult{,s}/g
" crs crm crc cru coerce snake, mixed, camel, upper
Plug 'tpope/vim-abolish'
" fC-U to jump to upper case, fC-W fC-E move within camel and snake case words
" Disabled so sneak works with ;/,
" Plug 'tpope/vim-flatfoot'
" C-A/C-X to in/decrement times, ranges, etc.
Plug 'tpope/vim-speeddating'
" automatically insert end keywords for shell, vim, ruby, etc.
Plug 'tpope/vim-endwise'
" buffer commands Remove Move Chmod Find Locate SudoWrite and W
Plug 'tpope/vim-eunuch'
" git commands beginning with :G
Plug 'tpope/vim-fugitive'
" guess the indent settings
Plug 'tpope/vim-sleuth'
" cs"' to switch " to ', ds) deletes parens, ysiw<q> wraps word in <q>,
" S<foo bar=42> in visual mode
Plug 'tpope/vim-surround'
" ga on a character for extended details
Plug 'tpope/vim-characterize'
" [] bindings: a args, q qf, f file, n conflict, e exchange, space blank line
" [] motion: x XML, u URL, y C string; f file, n merge conflict
Plug 'tpope/vim-unimpaired'
" C-X C-Z/G/B unicode/digraph/entity completion, C-G C-F fuzzy unicode
" :Digraphs[!] [match] :UnicodeName [reg [type]] :UnicodeSearch[!] \un names
Plug 'chrisbra/unicode.vim', { 'do': ':UnicodeDownload' }
" C-A, C-X to increment, decrement a column of numbers
Plug 'triglav/vim-visual-increment'
" gS to split single-line constructs to multiline, gJ to join them
Plug 'AndrewRadev/splitjoin.vim'
" Remove continuation characters when joining lines
" Install after splitjoin to overwrite and reuse gJ mapping
Plug 'flwyd/vim-conjoin'
" da, to delete comma list item, cil' to change in last quote, etc.
Plug 'wellle/targets.vim'
" Show number of hits when searching
Plug 'google/vim-searchindex'
" fancy statusline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Show register contents with ", @, and Ctrl-R; spacebar fullscreen
Plug 'junegunn/vim-peekaboo'
" Signs/highliting for lines changed from version control
Plug 'mhinz/vim-signify'
" :Hgedit :Hgvdiff :Hgstatus etc. for Mercurial
Plug 'ludovicchabant/vim-lawrencium'
" Completion using tab/shift tab, literal tab with C-tab or C-v tab
" Plug 'ervandew/supertab'
" Configurable completion chains with tab/S-tab, advance with C-h/C-j
Plug 'lifepillar/vim-mucomplete'
" Color nested parens in rotating colors
Plug 'luochen1990/rainbow'
" Read .editorconfig files, see editorconfig.org
Plug 'editorconfig/editorconfig-vim'
" + to expand visual selection, _ to shrink
Plug 'terryma/vim-expand-region'
" Automatically close XML/SGML tags with > >> to have newlines
Plug 'alvan/vim-closetag'
" Autoinsert closing punctuation
"Plug 'jiangmiao/auto-pairs'
" Drawing mode: arrows draw, shift move, <>^v arrows \> fat \b box visual ...
Plug 'vim-scripts/DrawIt'
" Marks as signs dmx del, m. next avail, m- del line, []`' jump, '[] jump alpha
" shift-0-9 markers: []- jump type, []= any type, m/ m? loclist, m<BS> del all
"Plug 'kshenoy/vim-signature'
" GetRandomNumber() function between 0 and 1
Plug 'fleischie/vim-rando', { 'branch': 'main' }

" Temporarily read langplugs.vim to avoid breaking unupdated .vimrc
source <sfile>:h/langplugs.vim
