"let g:eleline_powerline_fonts = 1
""let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
""let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
"hi Visual ctermbg=81 ctermfg=black cterm=none 
"hi Visual       gui=none          guifg=white     guibg=#A04220
"hi Pmenu        guifg=#f6f3e8 guibg=#152535 gui=NONE
"hi PmenuSel     guifg=#000000 guibg=#cae682 gui=NONE
"hi Normal guibg=none 
""hi IncSearch ctermfg=16 ctermbg=107 cterm=NONE guifg=#182227 guibg=#8bb664 gui=NONE
""hi Search ctermfg=NONE ctermbg=NONE cterm=underline guifg=NONE guibg=NONE gui=underline
"hi LineNr guibg=none guifg=yellow gui=none cterm=none ctermbg=none ctermfg=none
"hi GitGutterAdd guibg=none guifg=red gui=none cterm=none ctermbg=none ctermfg=none
"hi GitGutterChange guibg=none guifg=red gui=none cterm=none ctermbg=none ctermfg=none
"hi GitGutterDelete guibg=none guifg=red gui=none cterm=none ctermbg=none ctermfg=none

set background=dark    " Setting dark mode
"colorscheme space_vim_theme
"colorscheme deus
colorscheme one
"colorscheme snazzy


"--
"== statusline ----------------------------------
"--
"set statusline +=%1*\ %n\ %*            "buffer number
"set statusline +=%4*\ %<%f%*            "full path change F
"set statusline +=%1*%6y%*             "file type
"set statusline +=%2*%7a%*              "多光标时的行
"set statusline +=%2*%3m%*                "modified flag
"set statusline +=%5*%=%{&ff}%*            "file format
""set statusline+=%4*%=%{NearestMethodOrFunction()}
""set statusline +=%5*%7{&ff}%*            "file format
"set statusline +=%1*%5p%%%*                "百分比号
"set statusline +=%1*%5l%*             "current line
"set statusline +=%2*/%L%*               "total lines
"set statusline +=%1*%4v\ %*             "virtual column number
"set statusline +=%2*0x%04B\ %*          "character under cursor
"hi User1 guifg=#eea040 guibg=#222222
"hi User2 guifg=#dd3333 guibg=#222222
"hi User3 guifg=#ff66ff guibg=#222222
"hi User4 guifg=#a0ee40 guibg=#222222
"hi User5 guifg=#eeee40 guibg=#222222


"--
"== true scheme ----------------------------------
"--
"colorscheme true
"hi LineNr guibg=none guifg=yellow gui=none cterm=none ctermbg=none ctermfg=none
"hi GitGutterAdd guibg=none guifg=red gui=none cterm=none ctermbg=none ctermfg=none
"hi GitGutterChange guibg=none guifg=red gui=none cterm=none ctermbg=none ctermfg=none
"hi GitGutterDelete guibg=none guifg=red gui=none cterm=none ctermbg=none ctermfg=none
"hi GitGutterChangeDelete guibg=none guifg=red gui=none cterm=none ctermbg=none ctermfg=none
"hi Pmenu        guifg=#f6f3e8 guibg=#301B58 gui=NONE
"hi PmenuSel     guifg=#000000 guibg=#cae682 gui=NONE
"hi MatchParen   ctermbg=232   ctermfg=20    guibg=#665C54
"hi Visual ctermbg=81 ctermfg=black cterm=none 
"hi Visual       gui=none          guifg=white     guibg=#A04220


"--
"== startify ----------------------------------
"--
let g:startify_custom_header = [
\'     ________________________________ ',
\'    < talk is cheap,show me the code >',
\'     -------------------------------- ',
\'      \                              _',
\'       \                            | \',
\'        \                           | |',
\'         \                          | |',
\'          \    |\                   | |',
\'           \  /, ~\                / /',
\'             X     `-.....-------./ /',
\'              ~-. ~  ~              |',
\'                 \             /    |',
\'                  \  /_     ___\   /',
\'                  | /\ ~~~~~   \ |',
\'                  | | \        || |',
\'                  | |\ \       || )',
\'                 (_/ (_/      ((_/',
\ '',
\ '',
\]


"--
"== airline ----------------------------------
"--
"let g:airline_theme='molokai'
let g:airline_theme='deus'
"let g:airline_theme='dark'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.branch = '⎇'
let g:airline#extensions#hunks#enabled = 0
let g:airline_section_warning = ''
let g:airline_section_error = ''
"let g:airline_extensions = ['tabline', 'branch', 'bufferline', 'coc']
