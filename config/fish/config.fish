#thefuck --alias | source
alias tran='trans -sp en:zh'
alias neo='neofetch'
alias one='onefetch'
alias manl='tldr'
#alias ls='lsd'
alias ls='exa --colour always --icons'
alias la='exa --colour always --icons -a'
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
alias ghub='git push github master'
alias gee='git push gitee master'
alias gall='git push gitee master && git push github master'
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

set -x PATH /home/feedoom/.cargo/bin /bin:/usr/bin


begin
    set --local AUTOJUMP_PATH $HOME/.autojump/share/autojump/autojump.fish
    if test -e $AUTOJUMP_PATH
        source $AUTOJUMP_PATH
    end
end

set -g -x RANGER_LOAD_DEFAULT_RC FALSE


# man color
# set -x LESS_TERMCAP_mb (printf "\e[01;31m")
# set -x LESS_TERMCAP_md (printf "\e[01;31m")
# set -x LESS_TERMCAP_me (printf "\e[0m")
# set -x LESS_TERMCAP_se (printf "\e[0m")
# set -x LESS_TERMCAP_so (printf "\e[01;44;33m")
# set -x LESS_TERMCAP_ue (printf "\e[0m")
# set -x LESS_TERMCAP_us (printf "\e[01;32m")
