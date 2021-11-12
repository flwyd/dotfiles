" Configuration for specific file types and languages

augroup AlternateMapping
  autocmd!
  autocmd FileType objc let g:alternateExtensions_h = "m"
  autocmd FileType objc let g:alternateExtensions_m = "h"
  autocmd FileType html let g:alternateExtensions_html = "css,js,ts"
  autocmd FileType css let g:alternateExtensions_css = "html,htm,js,ts"
  autocmd FileType javascript let g:alternateExtensions_js = "html,htm,css"
  autocmd FileType typescript let g:alternateExtensions_js = "html,htm,css"
  " TODO .java <-> Test.java etc, maybe compactcode/alternate
augroup END

augroup Tabs
  autocmd!
  autocmd FileType go set tabstop=2 shiftwidth=2 noexpandtab
augroup END

augroup Spelling
  autocmd!
  autocmd FileType text,markdown set spell spelllang=en_us
augroup END

augroup AutoClose
  autocmd!
  " TODO Consider JS etc. but handle '({x});' and struct literals gracefully
  autocmd FileType c,cpp,go,java,kotlin inoremap <buffer> {<CR> {<CR>}<ESC>O
augroup END

augroup TypeInfo
  autocmd!
  autocmd FileType go let g:go_auto_type_info = 1
augroup END

augroup Folding
  autocmd!
  " SnipMates ftplugin folds all snippets. I don't like folds.
  autocmd FileType snippets setlocal foldmethod=manual
augroup END

if !exists('g:conjoin_filetypes')
  let g:conjoin_filetypes = {}
endif
let g:conjoin_filetypes.portfile = {'trailing': '\\$'}

" Insert Unicode characters for Raku/Perl6
let g:raku_unicode_abbrevs = 1
