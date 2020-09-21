set background=dark    " Setting dark mode
"colorscheme space_vim_theme
"colorscheme deus
" colorscheme one
"colorscheme dracula
"colorscheme snazzy
" colorscheme synthwave84
colorscheme xcodewwdc
hi MatchParen ctermbg=magenta guibg=#2C2560


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
"== xtabline ----------------------------------
"--
let g:xtabline_settings = {}
let g:xtabline_settings.enable_mappings = 0
let g:xtabline_settings.tabline_modes = ['tabs', 'buffers']
let g:xtabline_settings.enable_persistance = 0
let g:xtabline_settings.last_open_first = 1
noremap to :XTabCycleMode<CR>
noremap \p :XTabInfo<CR>


"--
"== vim-anzu----------------------------------
"--
nmap n <Plug>(anzu-n-with-echo)
nmap N <Plug>(anzu-N-with-echo)
nmap * <Plug>(anzu-star-with-echo)
nmap # <Plug>(anzu-sharp-with-echo)
" clear status
nmap <Esc><Esc> <Plug>(anzu-clear-search-status)
" statusline
set statusline=%{anzu#search_status()}
