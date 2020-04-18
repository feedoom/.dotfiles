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
Plug 'neoclide/coc.nvim', {'branch': 'release'}


"File navigation
Plug 'dyng/ctrlsf.vim'  "搜索文件内的代码
"Plug 'brooth/far.vim', { 'on': ['F', 'Far', 'Fardo'] }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}
"Plug 'Yggdroot/LeaderF'
"Plug 'scrooloose/nerdtree'
"Plug 'Xuyuanp/nerdtree-git-plugin'

" undo tree
Plug 'mbbill/undotree'


"taglist
Plug 'liuchengxu/vista.vim'


"Editor Enhancement
Plug 'kien/rainbow_parentheses.vim' " 括号高亮
Plug 'scrooloose/nerdcommenter'     " 注释
Plug 'jiangmiao/auto-pairs'         " 自动匹配括号
Plug 'tpope/vim-surround'
Plug 'Yggdroot/indentLine'          " 缩进线
Plug 'junegunn/goyo.vim'
Plug 'junegunn/vim-easy-align'      " 对齐
Plug 'andymass/vim-matchup'         " 快速跳转
Plug 'easymotion/vim-easymotion'
Plug 'mg979/vim-visual-multi'       " 多光标


"git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
"Plug 'cohama/agit.vim'     " git历史查看
Plug 'jreybert/vimagit'    " 查看git暂存区
Plug 'kablamo/vim-git-log' " git log


"format
Plug 'Chiel92/vim-autoformat'


"Error checking
"Plug 'dense-analysis/ale'


"html,css,js
Plug 'chrisbra/Colorizer'
Plug 'mattn/emmet-vim', { 'for': ['vim-plug', 'html']}
Plug 'Valloric/MatchTagAlways', { 'for': ['vim-plug', 'html']} " 高亮匹配标签
Plug 'alvan/vim-closetag', { 'for': ['vim-plug', 'html'] }     " 自动关闭标签
"html 预览
Plug 'turbio/bracey.vim'
Plug 'jaxbot/browserlink.vim'


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
Plug 'iamcco/dict.vim'                   "translator to dict
Plug 'voldikss/vim-translator'           " translator
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
"Plug 'junegunn/vim-peekaboo'            " 寄存器
"Plug 'spolu/dwm.vim'
"Plug 'vimwiki/vimwiki'
"Plug 'ron89/thesaurus_query.vim'        "近义词查找
"Plug 'jceb/vim-orgmode'
"Plug 'MattesGroeger/vim-bookmarks'
Plug 'skywind3000/vim-dict'              "词典 
Plug 'pechorin/any-jump.vim'
Plug 'tpope/vim-speeddating'             "递增减
Plug 'skywind3000/quickmenu.vim'         "帮助菜单

call plug#end()

