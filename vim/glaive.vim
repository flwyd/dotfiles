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
inoremap <C-X><C-X> <Plug>(imp-suggest-current)

command MaktabaLogDebug
      \ call maktaba#log#SetNotificationLevel(maktaba#log#LEVELS.DEBUG)
