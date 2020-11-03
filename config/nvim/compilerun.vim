" 运行当前文件
noremap <F5> :call CompileRunGcc()<CR>
" noremap <leader>r :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'cpp'
		set splitbelow
		exec "!g++ -std=c++11 % -Wall -o %<"
		:sp
		:res -15
		:term ./%<
	elseif &filetype == 'java'
		"exec "!javac %"
		"exec "!time java %<"
        "exec "!java %:r"
		exec "!javac -classpath .:lib/stdlib.jar %"
        exec "!java -classpath .:lib/stdlib.jar %:r"
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		set splitbelow
		:sp
		:term python3 %
	elseif &filetype == 'html'
        silent! exec "!".g:mkdp_browser." % &"
        " if empty(glob('~/.config/nvim/plugged/bracey.vim/'))
        "     silent! exec "!".g:mkdp_browser." % &"
        " else
        "     :Bracey
        " endif
	elseif &filetype == 'markdown'
		exec "MarkdownPreview"
    elseif &filetype == 'javascript'
        exec "!node %<.js"
    elseif &filetype == 'typescript'
		exec "!tsc %"
        exec "!node %<.js"
	elseif &filetype == 'tex'
		silent! exec "VimtexStop"
		silent! exec "VimtexCompile"
	elseif &filetype == 'go'
		set splitbelow
		:sp
		:term go run %
	endif
endfunc

