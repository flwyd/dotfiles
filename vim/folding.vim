" AsciiDoc folds on headers, with g:asciidoc_foldnested giving more control
let g:asciidoc_folding=1
" Bazel folds on rules and lists
let g:ft_bzl_fold=1
" Erlang folds functions
let g:erlang_folding=1
" Markdown folds on header levels
let g:markdown_folding=1
" Perl folds POD, heredocs, subs, blocks, etc. with more control variables
let g:perl_fold=1
" reStructuredText folds on header levels
let g:rst_fold_enabled=1
" Rust folds on syntax, rust_fold=1 starts with foldlevel=99, =2 is default
let g:rust_fold=1
" zsh folds multiline comments, strings, arrays, and substitutions
" let g:zsh_fold_enable=1

augroup TypeFoldOptions
  autocmd!
  " Markup files often have a single <h1>, so don't fold the entire file
  autocmd FileType asciidoc,markdown,rst setlocal foldlevel=1
augroup END
