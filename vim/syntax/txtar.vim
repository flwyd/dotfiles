if exists('b:current_syntax')
  finish
endif

syntax case ignore

syntax match txtarFileHeader /^-- .* --$/ contains=txtarFilename
syntax match txtarFilename /^-- \s*\zs.*\S\ze\s* --$/ contained contains=txtarDirectory
syntax match txtarDirectory '.*/' contained

hi def link txtarFileHeader PreProc
hi def link txtarFilename Constant
hi def link txtarDirectory Directory

let b:current_syntax = 'txtar'
