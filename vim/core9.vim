vim9script

# Configuration for plugins that require Vim 9

# bfrg/vim-qf-diagnostics See |qfdiagnostics.txt|
# gl popup for quickfix errors, gL popup for location list on current line
nnoremap gl <Plug>(qf-diagnostics-popup-quickfix)
nnoremap gL <Plug>(qf-diagnostics-popup-loclist)
# Automatically show signs and diagnostics after make and grep
augroup QuickfixDiagnostics
  autocmd!
  autocmd QuickfixCmdPost grep,make DiagnosticsPlace
  autocmd QuickfixCmdPost lgrep,lmake LDiagnosticsPlace
augroup END
