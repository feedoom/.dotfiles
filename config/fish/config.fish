set fish_greeting 'Talk is cheap.Show me the code.'
#thefuck --alias | source
alias tran='trans -sp en:zh'
alias neo='neofetch'
alias one='onefetch'
alias manl='tldr'
#alias ls='lsd'
# alias ls='exa --colour always --icons'
# alias la='exa --colour always --icons -a'
alias hei='cmatrix'
alias cd1='cd ../'
alias cd.='cd ../'
alias cd2='cd ../../'
alias cd..='cd ../../'
alias cd3='cd ../../../'
alias cd...='cd ../../../'
alias diff='icdiff'
alias manv='viman'
alias what='cheat'
alias you='you-get'
alias ari='aria2c'
alias send='qrcp'
alias ass='~/.config/niconvert/main.pyw -o'
alias mouse='python ~/notebook/mouse.py'
alias gd='git difftool'
#alias gd='git icdiff'
alias ga='git add'
alias ga.='git add .'
alias gs='git status'
alias gc='git commit'
alias gl='tig'
alias gp='git push -u origin master'
# alias caj='~/Downloads/CAJViewer-x86_64-libc-2.24.AppImage'
alias tm='tmux'
alias q='exit'
alias sudo='sudo -E'
# trash-cli in ~/.local/share/Trash
# alias rm='trash-put'
# alias rmrm='trash-empty'
alias nv='nvim'
alias ra='ranger'
alias c='clear'
alias open='explorer.exe .'
# alias cat='ccat'

export EDITOR=nvim


begin
    set --local AUTOJUMP_PATH $HOME/.autojump/share/autojump/autojump.fish
    if test -e $AUTOJUMP_PATH
        source $AUTOJUMP_PATH
    end
end

set -g -x RANGER_LOAD_DEFAULT_RC FALSE



#欢迎语
# clear
# cowsay  talk is cheap,show me the code | lolcat
# cd
