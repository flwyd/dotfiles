" From .vimrc:
" if empty(glob('~/.vim/autoload/plug.vim'))
"   silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
"     \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"   autocmd VimEnter * PlugInstall | source $MYVIMRC
" endif
" call plug#begin('~/.vim/plugged')
" source ~/dotfiles/vim/coreplugs.vim
" call plug#end()

" Go syntax, commands, etc.
Plug 'jnwhiteh/vim-golang', { 'for': 'go' }
" \\<motion> to highlight jump options
Plug 'Lokaltog/vim-easymotion'
" \be \bs \bv for buffer list
Plug 'c9s/bufexplorer'
" template code insertion and deps
"Plug 'msanders/snipmate.vim'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
" highlight enclosing tag
Plug 'Valloric/MatchTagAlways'
" highlight current term, :QuickhlManualAdd pattern
Plug 't9md/vim-quickhl'
" :A alt file :AS split :AN cycle :IH \ih cursor \is alt under cursor
Plug 'vim-scripts/a.vim'
" :Bgrep /re/ search buffers, Agrep args, Wgrep windows
Plug 'vim-scripts/buffergrep'
" sxy like fx for two chars, multiline; S backwards; dzxy as operator
Plug 'justinmk/vim-sneak'
" Enhanced directory navigation
Plug 'scrooloose/nerdtree'
" comment commands \ci (invert) \cc (line) \cm (block) \c  (toggle) \cy (yank)..
Plug 'scrooloose/nerdcommenter'
" comment: gc{move} gcc toggle g<{move} g>{move} un/comment C-_C-_ insert
Plug 'tomtom/tcomment_vim'
" readline mappings in insert and command mode
Plug 'tpope/vim-rsi'
" let . repeate mapped commands
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
" markdown syntax
Plug 'tpope/vim-markdown'
" C-A, C-X to increment, decrement a column of numbers
Plug 'triglav/vim-visual-increment'
" gS to split single-line constructs to multiline, gJ to join them
Plug 'AndrewRadev/splitjoin.vim'
" da, to delete comma list item, cil' to change in last quote, etc.
Plug 'wellle/targets.vim'
" Show number of hits when searching
Plug 'google/vim-searchindex'
" fancy statusline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" CSV support
Plug 'chrisbra/csv.vim'
" Signs/highliting for lines changed from version control
Plug 'mhinz/vim-signify'
" HTML5 omnicomplete, indent, and syntax
Plug 'othree/html5.vim'
" JSON syntax and error highlighting
Plug 'elzr/vim-json'
" Completion using tab/shift tab, literal tab with C-tab or C-v tab
Plug 'ervandew/supertab'
" Color nested parens in rotating colors
Plug 'luochen1990/rainbow'
" Julia support plus LaTeXtoUnicode#Toggle() for \foo<tab>
Plug 'JuliaEditorSupport/julia-vim'
" Read .editorconfig files, see editorconfig.org
Plug 'editorconfig/editorconfig-vim'
" :JsPreTmpl syntax highlighting inside JavaScript template strings
Plug 'Quramy/vim-js-pretty-template'
" TypeScript syntax
Plug 'HerringtonDarkholme/yats.vim'
" :Autoformat for various languages; needs external commands
Plug 'Chiel92/vim-autoformat'
" + to expand visual selection, _ to shrink
Plug 'terryma/vim-expand-region'
" Autoinsert closing punctuation
"Plug 'jiangmiao/auto-pairs'
" Ember Handlebars/HTMLBars syntax and indentation
Plug 'joukevandermaas/vim-ember-hbs'
