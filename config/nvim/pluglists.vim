"=====插件
"curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"vim-plug插件
call plug#begin('~/.config/nvim/plugged')

"pretty
Plug 'ryanoasis/vim-devicons'
"Plug 'itchyny/lightline.vim'
"Plug 'liuchengxu/eleline.vim'
Plug 'bling/vim-bufferline'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'connorholyday/vim-snazzy'
"Plug 'flazz/vim-colorschemes'
"Plug 'ajmwagar/vim-deus'
Plug 'megantiu/true.vim'
"Plug 'liuchengxu/space-vim-theme'
Plug 'rakr/vim-one'
"Plug 'atahabaki/archman-vim'
"Plug 'wdhg/dragon-energy'
"Plug 'fielding/vice'
"Plug 'jdsimcoe/panic.vim'
"Plug 'rbong/vim-crystalline'


"autocomplete
"Plugin 'jayli/vim-easycomplete'
"Plugin 'jayli/vim-dictionary'
"Plug 'prabirshrestha/asyncomplete.vim'
"Plug 'tenfyzhong/CompleteParameter.vim'
"Plug 'maralla/completor.vim'
"Plug 'artur-shaik/vim-javacomplete2'   "java autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}


"File navigation
"Plug 'dyng/ctrlsf.vim'  "搜索文件内的代码
"Plug 'brooth/far.vim', { 'on': ['F', 'Far', 'Fardo'] }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}
Plug 'Yggdroot/LeaderF'
"Plug 'scrooloose/nerdtree'
"Plug 'Xuyuanp/nerdtree-git-plugin'

" undo tree
Plug 'mbbill/undotree'


"taglist
Plug 'liuchengxu/vista.vim'
"Plug 'majutsushi/tagbar'


"Editor Enhancement
Plug 'kien/rainbow_parentheses.vim'      " 括号高亮
Plug 'scrooloose/nerdcommenter'          " 注释
"Plug 'jiangmiao/auto-pairs'              " 自动匹配括号
Plug 'tpope/vim-surround'
Plug 'Yggdroot/indentLine'               " 缩进线
Plug 'junegunn/goyo.vim'
Plug 'junegunn/vim-easy-align'           " 对齐
Plug 'andymass/vim-matchup'              " 快速跳转
Plug 'easymotion/vim-easymotion'         " 快速跳转
Plug 'mg979/vim-visual-multi'            " 多光标
Plug 'rhysd/clever-f.vim'                "增强f,F
Plug 'haya14busa/incsearch.vim'          "模糊搜素
Plug 'haya14busa/incsearch-fuzzy.vim'    "模糊搜素
Plug 'terryma/vim-smooth-scroll'         "更好的滚动
Plug 'kana/vim-textobj-user'             "文本对象 
Plug 'kana/vim-textobj-line'             "行文本对象


"git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
"Plug 'cohama/agit.vim'     " git历史查看
Plug 'junegunn/gv.vim'
Plug 'jreybert/vimagit'    " 查看git暂存区
Plug 'kablamo/vim-git-log' " git log


"format
Plug 'Chiel92/vim-autoformat'


"Error checking
"Plug 'dense-analysis/ale'


"html,css,js
"Plug 'chrisbra/Colorizer'
Plug 'mattn/emmet-vim', { 'for': ['vim-plug', 'html']}
Plug 'Valloric/MatchTagAlways', { 'for': ['vim-plug', 'html']} " 高亮匹配标签
Plug 'alvan/vim-closetag', { 'for': ['vim-plug', 'html'] }     " 自动关闭标签
Plug 'AndrewRadev/tagalong.vim'                                "同时修改html标签 
"html 预览
Plug 'turbio/bracey.vim'
Plug 'jaxbot/browserlink.vim'
Plug 'idanarye/breeze.vim' "html dom


"markdown
Plug 'theniceboy/bullets.vim', { 'for': ['vim-plug', 'markdown'] }
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync() }, 'for' :['markdown', 'vim-plug'] }
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle', 'for' :['markdown', 'vim-plug'] }


"输入法
"Plug 'ZSaberLv0/ZFVimIM'
"Plug 'ZSaberLv0/ZFVimIM_pinyin'
"Plug 'ZSaberLv0/ZFVimJob'               " optional, for async db update
"Plug 'vim-scripts/fcitx.vim'


"others
Plug 'lambdalisue/suda.vim'              "sudo 写入
"Plug 'voldikss/vim-translator'           " translator
Plug 'iamcco/dict.vim'                   "translator to dict
Plug 'VincentCordobes/vim-translate'     " translator
Plug 'sheerun/vim-polyglot'              " 语法扩展
Plug 'yianwillis/vimcdoc'                " vim中文文档
Plug 'KabbAmine/vCoolor.vim'             "调色板
Plug 'ZSaberLv0/ZFVimDirDiff'            " 文件对比
Plug 'voldikss/vim-codelf'               " 变量命名
Plug 'makerj/vim-pdf'
Plug 'vim-utils/vim-man'                 "vim open man for :Vman
Plug 'mhinz/vim-startify'                " 开始页面
Plug 't9md/vim-choosewin'                "跳转窗口
Plug 'RRethy/vim-illuminate'             " 高亮附近相同的词
Plug 'tpope/vim-repeat'                  " 重复操作
Plug 'skywind3000/quickmenu.vim'         "帮助菜单
Plug 'tpope/vim-speeddating'             "递增减
Plug 'airblade/vim-rooter'               "切换项目根目录 
Plug 'matze/vim-move'                    "alt-h,j,k,l to move text
Plug 'AndrewRadev/splitjoin.vim'         "gS单行转多行,gJ多行转单行
Plug 'DataWraith/auto_mkdir'             "自动创建中间的目录结构
Plug 'junkblocker/git-time-lapse'        "当前文件 git diff
Plug 'Shougo/echodoc.vim'                "参数提示
Plug 'AndrewRadev/linediff.vim'          "两个代码块diff visual模式下Linediff
Plug 'chxuan/change-colorscheme'
"Plug 'voldikss/vim-hello-word'
"Plug 'ntpeters/vim-better-whitespace'
"Plug 'hotoo/pangu.vim'                   "中文排版
"Plug 'pechorin/any-jump.vim'
"Plug 'junegunn/vim-peekaboo'            " 寄存器
"Plug 'spolu/dwm.vim'
"Plug 'ron89/thesaurus_query.vim'        "近义词查找
"Plug 'jceb/vim-orgmode'
"Plug 'vimwiki/vimwiki'
"Plug 'hiberabyss/NeovimGdb'
"Plug 'ianding1/leetcode.vim'
"Plug 'jpalardy/vim-slime'
"Plug 'KabbAmine/zeavim.vim'              "文档
"Plug 'svermeulen/vim-subversive'
call plug#end()
