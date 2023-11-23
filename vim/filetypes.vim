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
  autocmd FileType text,markdown,gitcommit,hgcommit setlocal spell spelllang=en_us
augroup END

augroup AutoClose
  autocmd!
  " TODO Consider JS etc. but handle '({x});' and struct literals gracefully
  autocmd FileType c,conf,cpp,go,java,kotlin,raku,textproto
        \ inoremap <buffer> {<CR> {<CR>}<ESC>O
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

" TODO Upstream this, from https://github.com/tpope/vim-endwise/pull/128
" without regex and plus juliaBlKeyword in syngroups
augroup Julia_endwise
  autocmd!
  autocmd FileType julia
        \ let b:endwise_addition = 'end' |
        \ let b:endwise_words = 'module,struct,function,if,for,while,quote,begin,do,macro' |
        \ let b:endwise_syngroups = 'juliaModule,juliaStruct,juliaFunction,juliaConditional,juliaRepeat,juliaExpression,juliaMacro,juliaBlKeyword'
augroup END
" Don't align Julia function arguments to open parens
let g:julia_indent_align_brackets = 0

if !exists('g:conjoin_filetypes')
  let g:conjoin_filetypes = {}
endif
let g:conjoin_filetypes.portfile = {'trailing': '\\$'}

" Insert Unicode characters for Raku/Perl6
" These are two aggressive, prevents bare slash or star
"let g:raku_unicode_abbrevs = 1
