" NERDTree plugin mappings for starting an ex command with a trailing path.
" Uses ! for `:! path` and . for `: path`, like tpope/vim-vinegar.
if exists('s:loaded') || version < 700
	finish
endif
let s:loaded = 1

" Starts an ex command (with prefix), inserts path, moves to the start.
function! s:startCommand(prefix, node) abort
	eval feedkeys(':' . a:prefix . ' ' . a:node.path.str() . "\<Home>", 'n')
	if len(a:prefix) > 0
		eval feedkeys(repeat("\<Right>", len(a:prefix)), 'n')
	endif
endfunction

" Declare a NERDTree mapping to start a command with prefix.
function! s:addCommandMap(mapping, prefix, name, help) abort
	if has('lambda')
		let l:Func = {node -> s:startCommand(a:prefix, node)}
	else
		let l:Func = 'NERDTreeStartCommand_' . a:name
		execute "function!" l:Func . "(node) abort \n"
			\ "call s:startCommand('" . a:prefix . "', a:node) \n"
			\ "endfunction"
	endif
	call NERDTreeAddKeyMap({
		\ 'key': a:mapping,
		\ 'callback': l:Func,
		\ 'quickhelpText': a:help,
		\ 'scope': 'Node'})
endfunction

call s:addCommandMap('!', '!', 'shell', 'shell command with path')
call s:addCommandMap('.', '', 'ex', 'command with path')
