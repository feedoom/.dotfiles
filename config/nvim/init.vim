"  __               _                       
" / _| ___  ___  __| | ___   ___  _ __ ___  
"| |_ / _ \/ _ \/ _` |/ _ \ / _ \| '_ ` _ \ 
"|  _|  __/  __/ (_| | (_) | (_) | | | | | |
"|_|  \___|\___|\__,_|\___/ \___/|_| |_| |_|


" ===
" === Auto load for first time uses
" ===
"if has ('nvim')
"    source ~/.config/nvim/default_configs/nvim_auto.vim
"else
"    source ~/.config/nvim/default_configs/vim_auto.vim
"endif
source ~/.config/nvim/default_configs/machine_specific_default.vim


" 根据不同模式改变光标
if has('nvim')
else
    let &t_SI.="\e[6 q" "SI = INSERT mode
    let &t_SR.="\e[4 q" "SR = REPLACE mode
    let &t_EI.="\e[2 q" "EI = NORMAL mode (ELSE)
endif


"开启真彩色
if has ('nvim')
    " fix bug for vim
    set t_8f=^[[38;2;%lu;%lu;%lum
    set t_8b=^[[48;2;%lu;%lu;%lum
    set termguicolors
else
    set termguicolors
endif


"tmux 与 vim 背景色问题 
if &term =~ '256color' && $TMUX != ''
	" disable Background Color Erase (BCE) so that color schemes
	" render properly when inside 256-color tmux and GNU screen.
	" see also http://snk.tuxfamily.org/log/vim-256color-bce.html
	set t_ut=
endif
let $NVIM_TUI_ENABLE_TRUE_COLOR=1


""capslock 转换esc
" 第一行映射在您输入Vim时转义到大写锁定键，第二行在您退出时返回正常的大写锁定功能。
" au VimEnter * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
" au VimLeave * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'

"
"" ##### auto fcitx  ###########
"let g:input_toggle = 1
"function! Fcitx2en()
"    let s:input_status = system("fcitx-remote")
"    if s:input_status == 2
"        let g:input_toggle = 1
"        let l:a = system("fcitx-remote -c")
"    endif
"endfunction
"set ttimeoutlen=150
""退出插入模式
"autocmd InsertLeave,CmdLineLeave * call Fcitx2en()
"


"==
"== editor behavior
"==
"set mouse=a                                              " 使用鼠标
"set textwidth=80                                         " 设置行宽
set nocompatible                                          " 关闭兼容模式
set hidden
set noerrorbells                                          " vim 错误不报错
set visualbell t_vb=
set helplang=cn                                           " 中文文档
set ttyfast                                               " should make scrolling faster
set nu                                                    " 设置行号
set relativenumber                                        " 相对行好
set wrap                                                  " 自动折行
set scrolloff=7                                           " 在上下移动光标时，光标的上方或下方至少会保留显示的行数
set t_Co=256                                              " 终端显示256色
set termguicolors
set showmode                                              " 显示当前mode
set showtabline=2                                         " 显示当前tab
set laststatus=2
set autoread                                              " 自动加载文件的变化
set spelllang=en_us                                       " 英语单词拼写检查
set tabpagemax=15                                         " 最多15个Tab
"set clipboard=unnamed                                    " 系统剪贴板
set history=2000                                          " history存储容量
set timeoutlen=500                                        " 等待时间,如<leader>键后的输入
set list                                                  " 显示特殊符号
set listchars=tab:\|\ ,trail:▫
syntax on                                                 " 关键字上色
syntax enable                                             " 语法高亮
set autochdir                                             " 自动切换到文件所在文件夹
autocmd BufWritePost $MYVIMRC source $MYVIMRC             " 自动加载vimrc
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936  " 设置编码
set termencoding=utf-8
set encoding=utf-8
filetype on                                               " 打开文件类型检测
filetype indent on
filetype plugin on
filetype plugin indent on
set fileformat=unix
set wildmenu                                              " 命令模式下补全以菜单形式显示
"set wildmode=list,longest,full                           " 命令模式补全模式
set incsearch                                             " 边输入边搜索
set ignorecase                                            " 搜索忽略大小写
set smartcase                                             " 智能大小写搜索
autocmd BufEnter * silent! lcd %:p:h                      " 自动将目录改为当前目录
set splitright                                            " 新分割窗口在右边
set splitbelow                                            " 新分割窗口在下边
set tabstop=4                                             " tab缩进4个空格
set shiftwidth=4                                          " 自动缩进空格数
set softtabstop=4                                         " 退格删除缩进
set autoindent                                            " 与前一行同样等级缩进
set expandtab                                             " tab转为空格



"==
"== 设置键位
"==
let mapleader="\<space>"
noremap <c-z> <nop>
noremap s <nop>
noremap Q :q<CR>
noremap W :w<CR>
" Press <SPACE> + q to close the window below the current window
noremap <LEADER>q <C-w>j:q<CR>
noremap U <C-r>
noremap u :u<CR>
nnoremap ; :
vnoremap ; :
inoremap jj <Esc>
noremap H ^
nnoremap L g_
vnoremap L g_
"ctrl j,ctrl k,上下移动5行
noremap <C-k> 5<C-y>
noremap <C-j> 5<C-e>
"clipboard system
vnoremap Y "+y
"alt+u转换大小写
inoremap <a-u> <esc>bvE~ea
"转换首单词大小写
inoremap <C-u> <esc>b~ea
noremap fi :r !figlet 
"z= 显示建议
noremap <leader>sp :set spell!<CR> 
nnoremap < <<
nnoremap > >>
" 去掉搜索高亮
noremap <silent><F3> :nohls<CR>
noremap <silent><space> :nohls<CR>
set pastetoggle=<F2> "F2进入粘贴模式
" 添加空行
nnoremap [<space>  :<c-u>put! =repeat(nr2char(10), v:count1)<cr>'[
nnoremap ]<space>  :<c-u>put =repeat(nr2char(10), v:count1)<cr>
"添加日期
imap <F3> <C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR>

" 标签页 
nnoremap tn :tabnext<CR>
nnoremap tp :tabp<CR>
noremap ]b :bnext<CR>
noremap [b :bprevious<CR>
" cnoreabbrev e tabedit
" cnoreabbrev bn tabnext
nnoremap R gt
nnoremap E gT
cnoreabbrev t tabedit
function Switchsplit()
    let path=expand('%:p')
    exec 'bdelete'
    exec 'vsplit '.path
endfunction
map trs :call Switchsplit()<cr>

" 窗口
"向下分屏，光标在上屏
noremap sk :set nosplitbelow<CR>:split<CR>:set splitbelow<CR> 
"向下分屏，光标在下屏
noremap sj :set splitbelow<CR>:split<CR>
"向右分屏，光标在左屏
noremap sh :set nosplitright<CR>:vsplit<CR>:set splitright<CR> 
"向右分屏，光标在右屏
noremap sl :set splitright<CR>:vsplit<CR>  
"调整分屏大小,ctrl+方向键调整大小
noremap <C-up> :res +5<CR>
noremap <C-down> :res -5<CR>
noremap <C-left> :vertical resize-5<CR>
noremap <C-right> :vertical resize+5<CR>
"切换窗口 
map <Down> <C-W>j
map <Up> <C-W>k
map <Left> <C-W>h
map <Right> <C-W>l
"map <c-j> <C-W>j
"map <c-k> <C-W>k
"map <c-h> <C-W>h
"map <c-l> <C-W>l
map <leader>j <C-W>j
map <leader>k <C-W>k
map <leader>h <C-W>h
map <leader>l <C-W>l
" Place the two screens up and down
noremap srh <C-w>t<C-w>K
" Place the two screens side by side
noremap srv <C-w>t<C-w>H
"将当前分屏的窗口转换到一个新的tab
function Switchtab()
    let path=expand('%:p')
    exec 'bdelete'
    exec 'tabe '.path
endfunction
map srt :call Switchtab()<cr>

"sudo 写入
if has('nvim')
  "nnoremap <F7> :w suda://%<CR>
  cnoreabbrev sudowrite w suda://%
  cnoreabbrev sw w suda://%
else
  cnoreabbrev sw :w !sudo tee %<CR>
endif

"插入模式下移动 
inoremap <c-l> <right>
inoremap <c-h> <Left>
inoremap <c-j> <down>
inoremap <c-k> <up>
"emacs key
"inoremap <m-b> <c-left>
"inoremap <m-f> <c-right>
"inoremap <c-b> <left>
"inoremap <c-f> <right>
"inoremap <c-n> <down>
"inoremap <c-p> <up>

"open my vimrc
if has ('nvim')
    cnoreabbrev vimrc :e ~/.config/nvim/init.vim
else 
    cnoreabbrev vimrc :e ~/.vimrc
endif
cnoreabbrev zshrc :e ~/.zshrc

"搜索结果居中展示
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

" 调整缩进后自动选中，方便再次操作
vnoremap < <gv
vnoremap > >gv

" 选中并高亮最后一次插入的内容
nnoremap gv `[v`]
" select block
nnoremap <leader>v V`}

"光标行移动
nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j


" 普通模式下高亮当前行,插入模式不高亮
set cursorline         " 高亮当前行
set cursorcolumn       " 高亮当列行
autocmd InsertLeave,WinEnter * set cursorline
autocmd InsertEnter,WinLeave * set nocursorline
" autocmd InsertLeave,WinEnter * set cursorcolumn
" autocmd InsertEnter,WinLeave * set nocursorcolumn


"打开自动定位到最后编辑的位置
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


"不自动添加成注释
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "no rm $"|endif|endif
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o


" 代码折叠
" 折叠方法
" manual    手工折叠
" indent    使用缩进表示折叠
" expr      使用表达式定义折叠
" syntax    使用语法定义折叠
" diff      对没有更改的文本进行折叠
" marker    使用标记进行折叠, 默认标记是 {{{ 和 }}}
set foldenable
set foldmethod=indent
set foldlevel=99
au BufNewFile,BufRead *.html
    \ set foldmethod=manual     |
    \ nnoremap zc zfat     |


"==
"== undo,backup
"==
"set nobackup
"set noswapfile
silent !mkdir -p ~/.config/nvim/tmp/backup
silent !mkdir -p ~/.config/nvim/tmp/undo
silent !mkdir -p ~/.config/nvim/tmp/sessions
set backupdir=~/.config/nvim/tmp/backup,.
set directory=~/.config/nvim/tmp/backup,.
if has('persistent_undo')
    set undofile
    set undodir=~/.config/nvim/tmp/undo,.
endif


"自带终端设置
if has('nvim')
  fu! OpenTerminal()
   " 在底下打开终端
   botright split
   " 终端的高度
   resize 5
   :terminal
  endf
else
  fu! OpenTerminal()
   " 在底下打开终端
   botright split
   " 终端的高度
   resize 5
   :call term_start('bash', {'curwin' : 1, 'term_finish' : 'close'})
  endf
endif
if has("unix")
    " set shell=\"/usr/bin/zsh"\ -f
    set shell=\"/usr/bin/bash"\ -f
endif
tnoremap <c-q> <c-\><c-n>
"set shell=\"/usr/bin/fish"\ -f
"tnoremap <c-h> <c-\><c-n><c-w>h
"tnoremap <c-l> <c-\><c-n><c-w>l
"tnoremap <c-j> <c-\><c-n><c-w>j
"tnoremap <c-k> <c-\><c-n><c-w>k
"打开终端
nnoremap <F4> :call OpenTerminal()<cr> 
" 命令行模式增强，ctrl - a到行首， -e 到行尾
" cnoremap <C-j> <t_kd>
" cnoremap <C-k> <t_ku>
cnoremap <C-h> <Home>
cnoremap <C-l> <End>
cnoremap <c-n> <down>
cnoremap <c-p> <up>


" 特定文件缩排
au BufNewFile,BufRead *.py
    \ set tabstop=4     |
    \ set softtabstop=4     |
    \ set shiftwidth=4     |
au BufNewFile,BufRead *.js
    \ set tabstop=2     |
    \ set softtabstop=2     |
    \ set shiftwidth=2     |
au BufNewFile,BufRead *.html
    \ set tabstop=2     |
    \ set softtabstop=2     |
    \ set shiftwidth=2     |


noremap <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l

source ~/.config/nvim/compilerun.vim

source ~/.config/nvim/md-snippets.vim

source ~/.config/nvim/pluglists.vim

source ~/.config/nvim/color.vim

source ~/.config/nvim/plugsettings.vim

