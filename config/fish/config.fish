set fish_greeting 'Talk is cheap.Show me the code.'
#thefuck --alias | source
alias ra="ranger"
#alias feem='~/Feem_v4.3.0_For_Linux.AppImage'
alias neo='neofetch'
alias one='onefetch'
alias tran='trans en:zh'
export EDITOR=nvim

begin
    set --local AUTOJUMP_PATH $HOME/.autojump/share/autojump/autojump.fish
    if test -e $AUTOJUMP_PATH
        source $AUTOJUMP_PATH
    end
end

set -g -x RANGER_LOAD_DEFAULT_RC FALSE
