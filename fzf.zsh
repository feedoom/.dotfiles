# Setup fzf
# ---------
if [[ ! "$PATH" == */home/feedoom/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/feedoom/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/feedoom/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/feedoom/.fzf/shell/key-bindings.zsh"
