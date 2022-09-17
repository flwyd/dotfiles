" Plugin configuration using vim-glaive + other maktaba plugin configs

call glaive#Install()

" \=motion to format, \=b format buffer
Glaive codefmt plugin[mappings]
augroup codefmt_auto
  autocmd FileType bzl AutoFormatBuffer buildifier
augroup END

Glaive imp plugin[mappings]
      \ Suggest[default]=buffer,ripgrep,prompt
      \ Location[default]=vcsroot,pwd
      \ Report[default]=popupnotify
      \ popupnotify[position]=bottomright
if has('patch-8.2.1978')
  inoremap <C-X><C-X> <Cmd>ImpSuggest<CR>
else
  inoremap <C-X><C-X> <C-\><C-O>:ImpSuggest<CR>
endif

command MaktabaLogDebug
      \ call maktaba#log#SetNotificationLevel(maktaba#log#LEVELS.DEBUG)
