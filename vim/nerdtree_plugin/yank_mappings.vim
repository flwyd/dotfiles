" NERDTree plugin mappings for yanking a path to register " with filename
" modifiers applied.  For example, yh yanks basedir path, like %:h.
if exists('s:loaded') || version < 700
	finish
endif
let s:loaded = 1

" Yank node's path into register " with modifier (e.g. ':p') applied.
function! s:yankModified(modifier, node) abort
	eval setreg('"', fnamemodify(a:node.path.str(), a:modifier))
endfunction

" Declare a NERDTree mapping to yank with modifier applied.
function! s:addYankMap(mapping, modifier, name, help) abort
	if has('lambda')
		let l:Func = {node -> s:yankModified(a:modifier, node)}
	else
		let l:Func = 'NERDTreeYank_' . a:name
		execute "function!" l:Func . "(node) abort \n"
			\ "call s:yankModified('" . a:modifier . "', a:node) \n"
			\ "endfunction"
	endif
	call NERDTreeAddKeyMap({
		\ 'key': a:mapping,
		\ 'callback': l:Func,
		\ 'quickhelpText': a:help,
		\ 'scope': 'Node'})
endfunction

call s:addYankMap('yp', ':p', 'absolute', 'yank absolute path')
call s:addYankMap('y~', ':~', 'homedir', 'yank homedir-relative path')
call s:addYankMap('y.', ':.', 'relative', 'yank relative path')
call s:addYankMap('yh', ':h', 'head', 'yank parent path')
call s:addYankMap('yt', ':t', 'tail', 'yank filename')
call s:addYankMap('yr', ':t:r', 'root', 'yank root filename')
call s:addYankMap('ye', ':e', 'extension', 'yank filename extension')
