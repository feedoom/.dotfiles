"=====插件
"curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"vim-plug插件
call plug#begin('~/.config/nvim/plugged')

"pretty
Plug 'ryanoasis/vim-devicons'
"Plug 'itchyny/lightline.vim'
"Plug 'liuchengxu/eleline.vim'
Plug 'ojroques/vim-scrollstatus'
Plug 'bling/vim-bufferline'
Plug 'mg979/vim-xtabline'
Plug 'theniceboy/eleline.vim'
"Plug 'connorholyday/vim-snazzy'
"Plug 'flazz/vim-colorschemes'
" Plug 'ajmwagar/vim-deus'
" Plug 'megantiu/true.vim'
" Plug 'liuchengxu/space-vim-theme'
" Plug 'rakr/vim-one'
" Plug 'artanikin/vim-synthwave84'
Plug 'arzg/vim-colors-xcode'
" Plug 'dracula/vim'
"Plug 'atahabaki/archman-vim'
"Plug 'wdhg/dragon-energy'
"Plug 'fielding/vice'
"Plug 'jdsimcoe/panic.vim'
"Plug 'rbong/vim-crystalline'


"autocomplete
" Plug 'artur-shaik/vim-javacomplete2'                                "java autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}


" golang
Plug 'fatih/vim-go' , { 'for': ['go', 'vim-plug'], 'tag': '*' }


"html,css,js
"Plug 'chrisbra/Colorizer'
Plug 'mattn/emmet-vim', { 'for': ['vim-plug', 'html']}
" Plug 'Valloric/MatchTagAlways', { 'for': ['vim-plug', 'html']}      " 高亮匹配标签
Plug 'alvan/vim-closetag', { 'for': ['vim-plug', 'html'] }          " 自动关闭标签
Plug 'AndrewRadev/tagalong.vim'                                     " 同时修改html标签
"html 预览
" Plug 'turbio/bracey.vim'
" Plug 'jaxbot/browserlink.vim'
" Plug 'idanarye/breeze.vim'                                          " html dom


"markdown
Plug 'theniceboy/bullets.vim', { 'for': ['vim-plug', 'markdown'] }
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle', 'for' :['markdown', 'vim-plug'] }
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync() }, 'for' :['markdown', 'vim-plug'] }


" undo tree
Plug 'mbbill/undotree'


"taglist
Plug 'liuchengxu/vista.vim'
"Plug 'majutsushi/tagbar'


"format
Plug 'Chiel92/vim-autoformat'


"align
Plug 'junegunn/vim-easy-align'                                      " 对齐


"Editor Enhancement
Plug 'kien/rainbow_parentheses.vim'                                 " 括号高亮
" Plug 'scrooloose/nerdcommenter'                                     " 注释
Plug 'tomtom/tcomment_vim'                                          " 注释
Plug 'jiangmiao/auto-pairs'                                          " 自动匹配括号
Plug 'tpope/vim-surround'
Plug 'Yggdroot/indentLine'                                          " 缩进线
Plug 'mg979/vim-visual-multi'                                       " 多光标
Plug 'RRethy/vim-illuminate'                                        " 高亮附近相同的词
Plug 'AndrewRadev/splitjoin.vim'                                    " gS单行转多行,gJ多行转单行
Plug 'tpope/vim-repeat'                                             " 重复操作
Plug 'tpope/vim-speeddating'                                        " 递增减
Plug 'junegunn/goyo.vim'
Plug 'terryma/vim-expand-region'                                    " +,_,增加可视模式选择的文本
Plug 'MattesGroeger/vim-bookmarks'
" Plug 'wellle/context.vim'                                           " 显示上下文
Plug 'chrisbra/NrrwRgn'                                             " 固定内容
Plug 'theniceboy/antovim'                                           " gs取反义词
Plug 'wellle/visual-split.vim'                                      " 将文本固定到分屏上
Plug 'gcmt/wildfire.vim'                                            " enter 快速选择文本


"textobj
Plug 'kana/vim-textobj-user'                                        " 文本对象
Plug 'kana/vim-textobj-line'                                        " 行文本对象
Plug 'coderifous/textobj-word-column.vim'                           " 列文本对象
Plug 'junegunn/vim-after-object'                                    " -, :, #, =
Plug 'vim-scripts/argtextobj.vim'                                     " argument
"Plug 'rhysd/vim-textobj-anyblock'                                    " b instead ', (), {}, [] and <>
" Plug 'wellle/targets.vim'


"File tree
" Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}
" Plug 'scrooloose/nerdtree'
" Plug 'Xuyuanp/nerdtree-git-plugin'


"subversive
Plug 'svermeulen/vim-subversive'                                    " 快速替换
Plug 'tpope/vim-abolish'                                            " subversive depend
Plug 'markonm/traces.vim'                                           " 预览:s/old/new/


"search
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'haya14busa/incsearch.vim'                                     " 模糊搜素
Plug 'haya14busa/incsearch-fuzzy.vim'                               " 模糊搜素
Plug 'junegunn/vim-slash'                                           " 优化搜索，移动光标后清除高亮
Plug 'osyo-manga/vim-anzu'                                          " 显示当前搜索
"Plug 'Yggdroot/LeaderF'
" Plug 'dyng/ctrlsf.vim'                                              " 搜索文件内的代码
"Plug 'brooth/far.vim', { 'on': ['F', 'Far', 'Fardo'] }


"git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
"Plug 'cohama/agit.vim'                                               " git历史查看
" Plug 'junegunn/gv.vim'
" Plug 'jreybert/vimagit'                                             " 查看git暂存区
"Plug 'kablamo/vim-git-log'                                           " git log
" Plug 'junkblocker/git-time-lapse'                                   " 当前文件 git diff


"move
Plug 'andymass/vim-matchup'                                         " %快速跳转
Plug 'easymotion/vim-easymotion'                                    " 快速跳转
Plug 'terryma/vim-smooth-scroll'                                    " 更好的滚动
Plug 'rhysd/clever-f.vim'                                           " 增强f,F
Plug 't9md/vim-choosewin'                                           " 跳转窗口
Plug 't9md/vim-textmanip'                                           " ctrl-h,j,k,l to move text
Plug 'matze/vim-move'                                               " alt-h,j,k,l to move text
Plug 'tommcdo/vim-exchange'                                         " cx{motion} 交互文本
Plug 'justinmk/vim-sneak'


"diff
"Plug 'ZSaberLv0/ZFVimDirDiff'                                        " 文件对比
Plug 'AndrewRadev/linediff.vim'                                     " 两个代码块diff visual模式下Linediff
" Plug 'chrisbra/vim-diff-enhanced'


" translator
" Plug 'iamcco/dict.vim'
"Plug 'VincentCordobes/vim-translate'
"Plug 'voldikss/vim-translator'


"Error checking
"Plug 'dense-analysis/ale'


"输入法
" Plug 'ZSaberLv0/ZFVimIM'
" Plug 'ZSaberLv0/ZFVimIM_pinyin'
" Plug 'ZSaberLv0/ZFVimJob'                                           " optional, for async db update
" Plug 'ZSaberLv0/ZFVimIM_pinyin_huge'
"Plug 'vim-scripts/fcitx.vim'


"others
Plug 'lambdalisue/suda.vim'                                         " sudo 写入
Plug 'vim-utils/vim-man'                                            " vim open man for :Vman
Plug 'yianwillis/vimcdoc'                                           " vim中文文档
Plug 'sheerun/vim-polyglot'                                         " 语法扩展
Plug 'KabbAmine/vCoolor.vim'                                        " 调色板
Plug 'voldikss/vim-codelf'                                          " 变量命名
Plug 'mhinz/vim-startify'                                           " 开始页面
" Plug 'airblade/vim-rooter'                                          " 切换项目根目录
Plug 'skywind3000/quickmenu.vim'                                    " 帮助菜单
Plug 'makerj/vim-pdf'
Plug 'DataWraith/auto_mkdir'                                        " 自动创建中间的目录结构
Plug 'tpope/vim-unimpaired'                                         " []代替互补的快捷键,如[b,]b代替bn,bp
" Plug 'mtth/scratch.vim'                                             " 临时buffer
Plug 'voldikss/vim-floaterm'                                        " 悬浮终端
Plug 'junegunn/vim-peekaboo'                                        " 寄存器
" Plug 'ianding1/leetcode.vim'
" Plug 'Shougo/echodoc.vim'                                           " 参数提示
"Plug 'voldikss/vim-hello-word'
"Plug 'ntpeters/vim-better-whitespace'
"Plug 'hotoo/pangu.vim'                                               " 中文排版
"Plug 'pechorin/any-jump.vim'
"Plug 'KabbAmine/zeavim.vim'                                          " 文档
" Plug 'vim-ctrlspace/vim-ctrlspace'

call plug#end()

" ===
" === vim-go
" ===
" let g:go_echo_go_info = 0
" let g:go_doc_popup_window = 1
" let g:go_def_mapping_enabled = 0
" let g:go_template_autocreate = 0
" let g:go_textobj_enabled = 0
" let g:go_auto_type_info = 1
" let g:go_def_mapping_enabled = 0
" let g:go_highlight_array_whitespace_error = 1
" let g:go_highlight_build_constraints = 1
" let g:go_highlight_chan_whitespace_error = 1
" let g:go_highlight_extra_types = 1
" let g:go_highlight_fields = 1
" let g:go_highlight_format_strings = 1
" let g:go_highlight_function_calls = 1
" let g:go_highlight_function_parameters = 1
" let g:go_highlight_functions = 1
" let g:go_highlight_generate_tags = 1
" let g:go_highlight_methods = 1
" let g:go_highlight_operators = 1
" let g:go_highlight_space_tab_error = 1
" let g:go_highlight_string_spellcheck = 1
" let g:go_highlight_structs = 1
" let g:go_highlight_trailing_whitespace_error = 1
" let g:go_highlight_types = 1
" let g:go_highlight_variable_assignments = 0
" let g:go_highlight_variable_declarations = 0
" let g:go_doc_keywordprg_enabled = 0
