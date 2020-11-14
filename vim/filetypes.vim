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
  autocmd FileType go set tabstop=2 noexpandtab
augroup END

augroup Spelling
  autocmd!
  autocmd FileType text\|markdown set spell spelllang=en_us
augroup END

if !exists('g:conjoin_filetypes')
  let g:conjoin_filetypes = {}
endif
let g:conjoin_filetypes.portfile = #{trailing: '\\$'}
