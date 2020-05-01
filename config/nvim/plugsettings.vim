"补全设置
"--
"== coc ----------------------------------
"--
"set completeopt=menu,menuone,noselect "vim-dict 补全设置
set complete=.,w,b,u,t
"inoremap <silent><expr> <CR> pumvisible() ? "\<C-y><CR>" : "\<CR>"
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
silent! au BufEnter,BufRead,BufNewFile * silent! unmap if
let g:coc_global_extensions = ['coc-python', 'coc-html', 'coc-css', 'coc-phpls', 'coc-java', 'coc-vetur', 'coc-xml', 'coc-tsserver', 'coc-snippets', 'coc-translator', 'coc-lists', 'coc-yank', 'coc-explorer', 'coc-json', 'coc-emmet', 'coc-marketplace', 'coc-sh', 'coc-word', 'coc-highlight', 'coc-pairs', 'coc-calc', 'coc-bookmark', 'coc-todolist']
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
        let col = col('.') - 1
        return !col || getline('.')[col - 1]=~ '\s'
endfunction
inoremap <silent><expr> <Tab>
                        \ pumvisible() ? "\<C-n>" :
                        \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
                        \ <SID>check_back_space() ? "\<Tab>" :
                        \ coc#refresh()
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
function! s:check_back_space() abort
        let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <c-space> coc#refresh()
let g:coc_snippet_next = '<tab>'
nnoremap <silent> <leader>ya :<C-u>CocList -A --normal yank<cr>
nmap tr :CocCommand explorer<CR>
"nnoremap <c-c> :CocCommand<CR>

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Mappings using CoCList:
" Show all diagnostics.
"nnoremap <silent> <space>d  :<C-u>CocList diagnostics<cr>
nnoremap <silent> <leader>e  :<C-u>CocList locationlist<CR>

"coc-highlight
autocmd CursorHold * silent call CocActionAsync('highlight')

"coc-translator
nmap <Leader>t <Plug>(coc-translator-p)
"vmap <Leader>t <Plug>(coc-translator-pv)

"coc calc
" append result on current expression
"nmap <Leader>ca <Plug>(coc-calc-result-append)
" replace result on current expression
nmap <Leader>cr <Plug>(coc-calc-result-replace)


"--
"== fzf.vim ----------------------------------
"--
" 查找文件
"noremap <C-p> :FZF<CR>
noremap <C-p> :Files<CR>
" 查找文件内容
"noremap <C-f> :Ag<CR>
noremap <C-f> :Ag<CR>
" 历史打开的文件
noremap <C-s> :MRU<CR>
" 查找tag
noremap <C-t> :BTags<CR>
" 跳转打开的文件
noremap <C-b> :Buffers<CR>
" 预览每一行
noremap <C-l> :Lines<CR>
" 历史命令
noremap <C-h> :History:<CR>

autocmd! Filetype fzf
autocmd  Filetype fzf set laststatus=0 noruler
            \| autocmd BufLeave <buffer> set laststatus=2 ruler

command! -bang -nargs=* Buffers
            \ call fzf#vim#buffers(
            \   '',
            \   <bang>0 ? fzf#vim#with_preview('up:60%')
            \           : fzf#vim#with_preview('right:0%', '?'),
            \   <bang>0)


command! -bang -nargs=* LinesWithPreview
            \ call fzf#vim#grep(
            \   'rg --with-filename --column --line-number --no-heading --color=always --smart-case . '.fnameescape(expand('%')), 1,
            \   fzf#vim#with_preview({}, 'up:50%', '?'),
            \   1)

command! -bang -nargs=* Ag
            \ call fzf#vim#ag(
            \   '',
            \   <bang>0 ? fzf#vim#with_preview('up:60%')
            \           : fzf#vim#with_preview('right:50%', '?'),
            \   <bang>0)

command! -bang -nargs=* MRU call fzf#vim#history(fzf#vim#with_preview())

command! -bang BTags
            \ call fzf#vim#buffer_tags('', {
            \     'down': '40%',
            \     'options': '--with-nth 1
            \                 --reverse
            \                 --prompt "> "
            \                 --preview-window="70%"
            \                 --preview "
            \                     tail -n +\$(echo {3} | tr -d \";\\\"\") {2} |
            \                     head -n 16"'
            \ })

let g:fzf_preview_window = 'right:60%'
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

function! s:list_buffers()
  redir => list
  silent ls
  redir END
  return split(list, "\n")
endfunction

function! s:delete_buffers(lines)
  execute 'bwipeout' join(map(a:lines, {_, line -> split(line)[0]}))
endfunction

command! BD call fzf#run(fzf#wrap({
  \ 'source': s:list_buffers(),
  \ 'sink*': { lines -> s:delete_buffers(lines) },
  \ 'options': '--multi --reverse --bind ctrl-a:select-all+accept'
\ }))

"noremap <c-d> :BD<CR>

let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.7 } }


"--
"== rnvimr ----------------------------------
"--
let g:rnvimr_ex_enable = 1
let g:rnvimr_pick_enable = 1
nnoremap <silent> ra :RnvimrSync<CR>:RnvimrToggle<CR><C-\><C-n>:RnvimrResize 0<CR>
let g:rnvimr_presets = [{'width': 1.0, 'height': 1.0}]


"--
"== Far.vim ----------------------------------
"--
"noremap <LEADER>ff :F  **/*<left><left><left><left><left>
"let g:far#mapping = {
		"\ "replace_undo" : ["l"],
		"\ }


"==nerdtree
"nmap tr :NERDTreeToggle<CR>	" 设置目录树快捷键
"通过 h、j、k、l 来移动光标
"o 打开关闭文件或目录，如果想打开文件，必须光标移动到文件名
"t 在标签页中打开
"s 和 i 可以水平或纵向分割窗口打开文件
"p 到上层目录
"P 到根目录
"K 到同目录第一个节点
"P 到同目录最后一个节点
"let NERDTreeMapOpenExpl = ""
"let NERDTreeMapUpdir = ""
"let NERDTreeMapUpdirKeepOpen = "l"
"let NERDTreeMapOpenSplit = ""
"let NERDTreeOpenVSplit = ""
"let NERDTreeMapActivateNode = "i"
"let NERDTreeMapOpenInTab = "o"
"let NERDTreeMapPreview = ""
"let NERDTreeMapCloseDir = "n"
"let NERDTreeMapChangeRoot = "y"
"nerdtreegit
"let g:NERDTreeIndicatorMapCustom = {
    "\ "Modified"  : "✹",
    "\ "Staged"    : "✚",
    "\ "Untracked" : "✭",
    "\ "Renamed"   : "➜",
    "\ "Unmerged"  : "═",
    "\ "Deleted"   : "✖",
    "\ "Dirty"     : "✗",
    "\ "Clean"     : "✔︎",
    "\ "Unknown"   : "?"
    "\ }


"==LeaderF
"let g:Lf_WindowPosition = 'popup' "窗口弹出
"let g:Lf_PreviewInPopup = 1
"let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "DejaVu Sans Mono for Powerline" }
"let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }
"nnoremap <leader>f :LeaderfFile ~<cr>
""let g:Lf_ShortcutF = '<C-P>' "更改快捷键
"highlight Lf_hl_match gui=bold guifg=Blue cterm=bold ctermfg=21
"highlight Lf_hl_matchRefine  gui=bold guifg=Magenta cterm=bold ctermfg=202
"noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
"noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
"noremap <leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
"搜素当前buffer的代码
"noremap <c-f> :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR> 


"--
"== ctrlsf ----------------------------------
"--
noremap <LEADER>f :CtrlSF 
let g:ctrlsf_auto_focus = {
    \ "at": "start"
    \ }


"--
"== Vista ----------------------------------
"--
noremap <silent> tg :Vista!!<CR>
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_default_executive = 'ctags'
let g:vista_fzf_preview = ['right:50%']
let g:vista#renderer#enable_icon = 1
let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\  }
function! NearestMethodOrFunction() abort
	return get(b:, 'vista_nearest_method_or_function', '')
endfunction
"set statusline+=%{NearestMethodOrFunction()}
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()


"--
"== tagbar ----------------------------------
"--
"nmap tg :TagbarToggle<CR>


"--
"== undotree ----------------------------------
"--
nnoremap un :UndotreeToggle<cr>
set undodir=~/.config/nvim/tmp/undo  "记录在~/.undodir里 
set undofile
let g:undotree_DiffAutoOpen = 1
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1
let g:undotree_WindowLayout = 2
let g:undotree_DiffpanelHeight = 8
let g:undotree_SplitWidth = 24
function g:Undotree_CustomMap()
	nmap <buffer> u <plug>UndotreeNextState
	nmap <buffer> e <plug>UndotreePreviousState
	nmap <buffer> U 5<plug>UndotreeNextState
	nmap <buffer> E 5<plug>UndotreePreviousState
endfunc


"--
"== rainbow_parentheses ----------------------------------
"--
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
" 不加入这行, 防止黑色括号出现, 很难识别
" \ ['black',       'SeaGreen3'],
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces


"--
"== vim-easy-align ----------------------------------
"--
vmap <Leader>a <Plug>(EasyAlign)
nmap <Leader>a <Plug>(EasyAlign)
if !exists('g:easy_align_delimiters')
  let g:easy_align_delimiters = {}
endif
let g:easy_align_delimiters['#'] = { 'pattern': '#', 'ignore_groups': ['String'] }


"--
"== vim-matchup ----------------------------------
"--
let g:loaded_matchit = 1


"--
"== indentLine ----------------------------------
"--
let g:indentLine_char = '¦'  ", '¦', '┆', '┊'
"let g:indentLine_setColors = 0
let g:indentLine_color_term = 17
"let g:indentLine_noConcealCursor = ""
let g:indentLine_bgcolor_gui = '#303030'


"--
"== easymotion ----------------------------------
"--
"两个字符 
"nmap ff <Plug>(easymotion-s2)
"单个字符 
nmap ff <Plug>(easymotion-bd-f)
"移动到列
"nmap s <Plug>(easymotion-bd-jk)   
"任意字符
nmap fff <Plug>(easymotion-sn)
"/替换成easymotion
"map  / <Plug>(easymotion-sn)
"omap / <Plug>(easymotion-tn)
"map  n <Plug>(easymotion-next)
"map  N <Plug>(easymotion-prev)


"--
"== goyo ----------------------------------
"--
map <leader>gy :Goyo<CR>


"--
"== vim-autoformat ----------------------------------
"--
nnoremap <leader>fo :Autoformat<CR>
"let g:formatdef_eslint = '"SRC=eslint-temp-${RANDOM}.js; cat - >$SRC; eslint --fix $SRC >/dev/null 2>&1; cat $SRC | perl -pe \"chomp if eof\"; rm -f $SRC"'
"let g:formatters_javascript = ['eslint']
"let g:formatdef_my_html = '"html-beautify -s 2"'


"--
"== vimagit ----------------------------------
"--
cnoreabbrev gs Magit


"--
"== vim-git-log ----------------------------------
"--
cnoreabbrev gl GitLog


"==ale
"始终开启标志列
"let g:ale_sign_column_always = 1
"let g:ale_set_highlights = 0
""自定义error和warning图标
"let g:ale_sign_error = '✗'
"let g:ale_sign_warning = '⚡'
""在vim自带的状态栏中整合ale
"let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
""显示Linter名称,出错或警告等相关信息
"let g:ale_echo_msg_error_str = 'E'
"let g:ale_echo_msg_warning_str = 'W'
"let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
""普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告
"nmap sp <Plug>(ale_previous_wrap)
"nmap sn <Plug>(ale_next_wrap)
""<Leader>s触发/关闭语法检查
"nmap <Leader>s :ALEToggle<CR>
""<Leader>d查看错误或警告的详细信息
"nmap <Leader>d :ALEDetail<CR>


"--
"== Colorizer ----------------------------------
"--
"let g:colorizer_syntax = 1


"--
"== emmet-vim ----------------------------------
"--
"let g:user_emmet_settings = {
"            \ 'javascript.jsx': {
"            \ 'extends' : 'jsx',
"            \ },
"            \}
let g:user_emmet_leader_key = ','


"--
"== MatchTagAlways ----------------------------------
"--
let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \ 'jinja' : 1,
    \}
"改变颜色
"let g:mta_set_default_matchtag_color=0
"let g:mta_use_matchparen_group = 0
"highlight MatchTag ctermfg=black ctermbg=lightgreen guifg=black guibg=lightgreen


"--
"== breeze ----------------------------------
"--
au BufNewFile,BufRead *.html
    \ noremap tg :BreezePrintDom<cr>


"--
"== MarkdownPreview ----------------------------------
"--
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_echo_preview_url = 0
let g:mkdp_browserfunc = ''
let g:mkdp_preview_options = {
			\ 'mkit': {},
			\ 'katex': {},
			\ 'uml': {},
			\ 'maid': {},
			\ 'disable_sync_scroll': 0,
			\ 'sync_scroll_type': 'middle',
			\ 'hide_yaml_meta': 1
			\ }
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = '「${name}」'


"--
"== vim-table-mode ----------------------------------
"--
noremap <LEADER>tm :TableModeToggle<CR>
"let g:table_mode_disable_mappings = 1
"let g:table_mode_cell_text_object_i_map = 'k<Bar>'
"let g:table_mode_delimiter = ' '
let g:table_mode_corner='|'
function! s:isAtStartOfLine(mapping)
  let text_before_cursor = getline('.')[0 : col('.')-1]
  let mapping_pattern = '\V' . escape(a:mapping, '\')
  let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
  return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
endfunction

inoreabbrev <expr> <bar><bar>
          \ <SID>isAtStartOfLine('\|\|') ?
          \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
inoreabbrev <expr> __
          \ <SID>isAtStartOfLine('__') ?
          \ '<c-o>:silent! TableModeDisable<cr>' : '__'


"--
"== dict-vim ----------------------------------
"--
cnoreabbrev trans DictW
nmap  <Leader>ddddd <Plug>DictSearch
vmap  <Leader>ddddd <Plug>DictVSearch
nmap  <Leader>ttttt <Plug>DictWSearch
vmap  <Leader>t <Plug>DictWVSearch
nmap  <Leader>rrrrr <Plug>DictRSearch
vmap  <Leader>r <Plug>DictRVSearch


"--
"== vim-translator ----------------------------------
"--
"nmap  <Leader>t <Plug>Translate
"vmap  <Leader>t <Plug>TranslateV
" Display translation in a window
"nmap  <Leader>t <Plug>TranslateW
"vmap  <Leader>wwwww <Plug>TranslateWV
"" Replace the text with translation
"nmap  <Leader>r <Plug>TranslateR
"vmap  <Leader>rrrrr <Plug>TranslateRV
"hi def link TranslatorQuery             Identifier
"hi def link TranslatorPhonetic          Type
"hi def link TranslatorExplain           Statement
"hi def link TranslatorDelimiter         Special


"--
"== polyglot ----------------------------------
"--
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0
"==vim-json
"let vim_json_syntax_conceal = 0


"--
"== ZFVimIM_pinyin ----------------------------------
"--
nnoremap <expr><silent> ;; ZFVimIME_keymap_toggle_n()
inoremap <expr> ;; ZFVimIME_keymap_toggle_i()
vnoremap <expr> ;; ZFVimIME_keymap_toggle_v()

nnoremap <expr><silent> ;: ZFVimIME_keymap_next_n()
inoremap <expr> ;: ZFVimIME_keymap_next_i()
vnoremap <expr> ;: ZFVimIME_keymap_next_v()

nnoremap <expr><silent> ;, ZFVimIME_keymap_add_n()
inoremap <expr> ;, ZFVimIME_keymap_add_i()
xnoremap <expr> ;, ZFVimIME_keymap_add_v()

nnoremap <expr><silent> ;. ZFVimIME_keymap_remove_n()
inoremap <expr> ;. ZFVimIME_keymap_remove_i()
xnoremap <expr> ;. ZFVimIME_keymap_remove_v()


"--
"== ZFDirDiff ----------------------------------
"--
"let g:ZFDirDiffKeymap_update = ['DD']
"let g:ZFDirDiffKeymap_syncToHere = ['do', 'DH']
"let g:ZFDirDiffKeymap_syncToThere = ['dp', 'DL']


"--
"== codelf ----------------------------------
"--
inoremap <silent> <F9> <C-R>=codelf#start()<CR>
nnoremap <silent> <F9> :call codelf#start()<CR>


"--
"== vim-illuminate ----------------------------------
"--
let g:Illuminate_delay = 750
hi illuminatedWord cterm=undercurl gui=undercurl


"--
"== thesaurus_query ----------------------------------
"--
"map <leader>th ：ThesaurusQueryReplaceCurrentWord <CR>
"nnoremap  <Leader>th :ThesaurusQueryReplaceCurrentWord<CR>


"--
"== vcoolor ----------------------------------
"--
cnoreabbrev color VCoolor


"--
"== fastfold ----------------------------------
"--
"nmap zuz <Plug>(FastFoldUpdate)
"let g:fastfold_savehook = 1
"let g:fastfold_fold_command_suffixes =  ['x','X','a','A','o','O','c','C']
"let g:fastfold_fold_movement_commands = [']z', '[z', 'ze', 'zu']
"let g:markdown_folding = 1
"let g:tex_fold_enabled = 1
"let g:vimsyn_folding = 'af'
"let g:xml_syntax_folding = 1
"let g:javaScript_fold = 1
"let g:sh_fold_enabled= 7
"let g:ruby_fold = 1
"let g:perl_fold = 1
"let g:perl_fold_blocks = 1
"let g:r_syntax_folding = 1
"let g:rust_fold = 1
"let g:php_folding = 1


"--
"== choosewin ----------------------------------
"--
nmap  -  <Plug>(choosewin)


"--
"== any-jump ----------------------------------
"--
"let g:any_jump_disable_default_keybindings = 1
"" Normal mode: Jump to definition under cursore
"nnoremap <leader>jj :AnyJump<CR>
"" Visual mode: jump to selected text in visual mode
"xnoremap <leader>jj :AnyJumpVisual<CR>
"" Normal mode: open previous opened file (after jump)
"nnoremap <leader>ab :AnyJumpBack<CR>
"" Normal mode: open last closed search window again
"nnoremap <leader>al :AnyJumpLastResults<CR>


"--
"== vim-better-whitespace ----------------------------------
"--
let g:current_line_whitespace_disabled_hard=1
"let g:strip_whitespace_confirm=0
let g:better_whitespace_filetypes_blacklist=[ 'diff', 'gitcommit', 'unite', 'qf', 'help', 'markdown']
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1


"--
"== quickmenu ----------------------------------
"--
noremap <silent><F1> :call quickmenu#toggle(0)<cr>
let g:quickmenu_options = "LH"
call quickmenu#append("# Run", '')
call quickmenu#append("Run %{expand('%:t')}", 'call CompileRunGcc()', "Run current file")

call quickmenu#append("# Git", '')
call quickmenu#append("git 暂存区('s' to add)", 'Magit', "")
call quickmenu#append("git log('d' to open)", 'GitLog', "")

call quickmenu#append("# spell", '')
call quickmenu#append("spell('z=' to change)", 'set spell!', "")
call quickmenu#append("codelf", 'call codelf#start()', "")

call quickmenu#append("# yank", '')
call quickmenu#append("yank", 'CocList -A --normal yank', "")

call quickmenu#append("# markdown", '')
call quickmenu#append("tablemode", 'TableModeToggle', "")

call quickmenu#append("# Color", '')
call quickmenu#append("Vcoolor(调色板)", 'VCoolor', "")

call quickmenu#append("# other", '')
call quickmenu#append("goyo", 'Goyo', "")


"--
"== leetcode ----------------------------------
"--
let g:leetcode_solution_filetype = 'javascript'
let g:leetcode_china = 1
let g:leetcode_browser = 'firefox'


"--
"== hello word ----------------------------------
"--
let g:helloword_vocabulary_path = '~/.config/nvim/word/CET6.json'


"--
"== zeavim ----------------------------------
"--
"nmap gzz <Plug>Zeavim
"vmap gzz <Plug>ZVVisSelection
"nmap <leader>z <Plug>ZVKeyDocset
"nmap gZ <Plug>ZVKeyDocset<CR>
"nmap gz <Plug>ZVOperator
"let g:zv_keep_focus = 0
"let g:zv_file_types = {
            "\   'help'                : 'vim',
            "\   'javascript'          : 'javascript,nodejs',
            "\   'python'              : 'python_3',
            "\   '\v^(G|g)ulpfile\.js' : 'gulp,javascript,nodejs',
            "\ }

