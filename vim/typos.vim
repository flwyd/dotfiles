" Vim syntax file
" Language:    agnostic
" Maintainer:  Trevor Stone <github@trevorstone.org>
" Last Change: 2017 Feb 11
" Remark:      Typos that are easy to overlook and not likely intended.
" Remark:      Copied from… somewhere?

syntax case ignore
syntax cluster Spell add=Typo
highlight link Typo WarningMsg
syntax keyword Typo
\ acccount
\ alot
\ andriod
\ availiability
\ availiable
\ avaliable
\ bandwith
\ blooean
\ boolaen
\ bounary
\ chagne
\ complier
\ constuct[or]
\ contruct[or]
\ cornjob
\ cosnt
\ coudl
\ defaul
\ defaut
\ delet
\ depricate[d]
\ deprication
\ destription
\ destriptor
\ destuct[or]
\ documention
\ elasped
\ emmitted
\ exmaple
\ extention
\ fales
\ fitler
\ flase
\ funciton
\ grammer
\ hanlder
\ healht[y]
\ heigth
\ hoooks
\ instanciate
\ instantitation
\ interable
\ interger
\ ipnut
\ isnert
\ lenght
\ looup
\ loup
\ maxumum
\ milisecond
\ milllisecond
\ notificaiton
\ nulltpr
\ offical
\ optoin
\ ouptut
\ pathalogical
\ peroid
\ pipeling
\ pipline
\ protocal
\ proudction
\ pubicly
\ recieve
\ recrod
\ respone
\ runnning
\ saftey
\ selet
\ semiphore
\ seperate
\ serach
\ shoudl
\ singal[s]
\ smaple
\ special
\ specical
\ specifically
\ stirng
\ stroage
\ succcess
\ succeess
\ succesful
\ sumbit
\ taget
\ teh
\ thershold
\ thier
\ threshould
\ thsi
\ thumnail
\ tihs
\ tuer
\ ture
\ udpate
\ undefiend
\ unkown
\ unsinged
\ worfklow
\ woudl

syntax match Typo /\<course.grained\>/
syntax match Typo /\<doe snot\>/
syntax match Typo /\<more then\>/
syntax match Typo /\<tread safe\>/
