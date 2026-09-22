" txtar Text Archive format documented at
" https://pkg.go.dev/golang.org/x/tools/txtar#hdr-Txtar_format
" Some additional features to support Go test scripts in the file comment:
" https;//pkg.go.dev/github.com/rogpeppe/go-internal/testscript

if exists('b:current_syntax')
  finish
endif
let s:cpo_save = &cpo
set cpo&vim

syntax case ignore

syntax match txtarFileHeader /^-- .* --$/ contains=txtarFilename
syntax match txtarFilename /^-- \s*\zs.*\S\ze\s* --$/ contained contains=txtarDirectory
syntax match txtarDirectory '.*/' contained
" Anything before the first file header is a comment.  Go testscript parses
" commands from that file comment.
syntax region txtarFileComment start=/\%^/ end=/^\ze-- .* --$/re=s contains=txtarLineComment
" Files are delimited with '-- dir/filename.ext --' with all subsequent lines
" until the next delimiter as part of that file.
" foldmethod=syntax will put each file in a fold.
syntax region txtarFile start=/^-- .* --$/ end=/^\ze-- .* --$/re=s fold contains=txtarFileHeader

" Go testscript features
syntax match txtarLineComment /#.*/ contained containedin=txtarFileComment
syntax region txtarTestscriptCommandPrefix start=/^\s*[[!]/ end=/\s\+\</re=s contained containedin=txtarFileComment
syntax keyword txtarTestscriptCommand cd chmod cmp cmpenv cp env exec exists
      \ grep kill mkdir mv rm skip stderr stdin stdout ttyin ttyout
      \ stop symlink unquote wait contained containedin=txtarFileComment
syntax match txtarTestscriptComment /#.*/ contained containedin=txtarFileComment
syntax match txtarTestscriptCondition /\[[^]]\+\]\s/me=e-1 contained containedin=txtarTestscriptCommandPrefix
syntax match txtarTestscriptNegate /!\s/me=e-1 contained containedin=txtarTestscriptCommandPrefix
syntax match txtarTestscriptString /'\([^']\|''\)*'/ contained containedin=txtarFileComment
syntax match txtarTestscriptVariable /\$\w\+/ contained containedin=txtarFileComment
syntax match txtarTestscriptVariable /\${[^}]\+}/ contained containedin=txtarFileComment

hi def link txtarFileHeader PreProc
hi def link txtarFilename Constant
hi def link txtarDirectory Directory
hi def link txtarTestscriptCommand Statement
hi def link txtarTestscriptComment Comment
hi def link txtarTestscriptCondition Conditional
hi def link txtarTestscriptNegate Operator
hi def link txtarTestscriptString String
hi def link txtarTestscriptVariable Identifier

let b:current_syntax = 'txtar'

let &cpo = s:cpo_save
unlet s:cpo_save
