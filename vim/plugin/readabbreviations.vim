if exists('s:loaded')
  finish
endif
let s:loaded = 1

let s:file = expand('~/.abbreviations')
if s:file->filereadable()
  call flwyd#readAbbreviations(s:file)
endif
