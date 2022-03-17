if has('nvim')
	aug custom_term
		au!
		au TermOpen * setl statusline=[term]
		au TermOpen * setl nonu nornu nolist
		au TermOpen term://* startinsert
		au TermEnter * setl nonumber norelativenumber nomodified
		au TermClose * :bd!
	aug end
else
	au TerminalWinOpen setl nonu nornu nolist
endif
fun! TermTest(cmd)
	cal termopen(a:cmd, {'on_exit': 's:OnExit'})
endf
fun! s:OnExit(job_id, code, event) dict
	if a:code == 0
		clo
	end
endf
