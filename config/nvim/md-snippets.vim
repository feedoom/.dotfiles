"autocmd Filetype markdown map <leader>w yiWi[<esc>Ea](<esc>pa)
autocmd Filetype markdown inoremap <buffer> <silent> ,, <++>
autocmd Filetype markdown inoremap <buffer> ,n <Esc>/<++><CR>:nohlsearch<CR>"_c4l
autocmd Filetype markdown inoremap <buffer> ,w <Esc>/ <++><CR>:nohlsearch<CR>"_c5l<CR>
"autocmd Filetype markdown inoremap <buffer> ,n ---<Enter><Enter>
autocmd Filetype markdown inoremap <buffer> ,b **** <++><Esc>F*hi
"autocmd Filetype markdown inoremap <buffer> ,s ~~~~ <++><Esc>F~hi
autocmd Filetype markdown inoremap <buffer> ,e ** <++><Esc>F*i
autocmd Filetype markdown inoremap <buffer> ,d `` <++><Esc>F`i
autocmd Filetype markdown inoremap <buffer> ,c ```<Enter><++><Enter>```<Enter><Enter><++><Esc>4kA
autocmd Filetype markdown inoremap <buffer> ,m - [ ] <Enter><++><ESC>kA
autocmd Filetype markdown inoremap <buffer> ,i ![](<++>) <++><Esc>F[a
autocmd Filetype markdown inoremap <buffer> ,a [](<++>) <++><Esc>F[a
autocmd Filetype markdown inoremap <buffer> ,1 #<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> ,2 ##<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> ,3 ###<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> ,4 ####<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> ,l --------<Enter>

"autocmd Filetype markdown inoremap <buffer> <silent> ,s <Esc>/ <++><CR>:nohlsearch<CR>c5l
"autocmd Filetype markdown nnoremap <buffer> <silent> ,s <Esc>/ <++><CR>:nohlsearch<CR>c5l
"autocmd Filetype markdown inoremap <buffer> <silent> ,- ---<Enter><Enter>
"autocmd Filetype markdown inoremap <buffer> <silent> ,x ~~~~ <++><Esc>F~hi
"autocmd Filetype markdown inoremap <buffer> <silent> ,p ** <++><Esc>F*i
"autocmd Filetype markdown inoremap <buffer> <silent> ,q `` <++><Esc>F`i
"autocmd Filetype markdown inoremap <buffer> <silent> ,g - [ ] <Enter><++><ESC>kA
"autocmd Filetype markdown inoremap <buffer> <silent> ,u <u></u><++><Esc>F/hi
"autocmd Filetype markdown inoremap <buffer> <silent> ,t <C-R>=strftime("%Y-%m-%d %H:%M:%S")<CR>
"autocmd Filetype markdown inoremap <buffer> <silent> ,w {% web  <++> %} <++><Esc>Fb2li
"autocmd Filetype markdown inoremap <buffer> <silent> ,d {% download  <++> %} <++><Esc>Fb2li

