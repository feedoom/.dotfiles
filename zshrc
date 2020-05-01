# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.

#export ZSH="/home/feedoom/.oh-my-zsh"

#manjaro pacman install setting
export ZSH=/usr/share/oh-my-zsh
ZSH_CACHE_DIR=$HOME/.oh-my-zsh-cache
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="robbyrussell"
#ZSH_THEME="random"
ZSH_THEME="crunch"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git last-working-dir catimg web-search extract autojump )
source $ZSH/oh-my-zsh.sh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"










#bindkey '^v' edit-command-line
#vi-mode
bindkey -v
bindkey -M vicmd "H" vi-beginning-of-line
bindkey -M vicmd "L" vi-end-of-line
bindkey -M vicmd "m" vi-cmd-mode
#bindkey '^?'
bindkey '^_' vi-history-search-backward
bindkey '^n' up-line-or-search
bindkey '^b' vi-backward-blank-word
bindkey '^d' backward-delete-word

function zle-keymap-select {
    if [[ ${KEYMAP} == vicmd ]] || [[ $1 = 'block' ]]; then
        echo -ne '\e[1 q'
    elif [[ ${KEYMAP} == main ]] || [[ ${KEYMAP} == viins ]] || [[ ${KEYMAP} = '' ]] || [[ $1 = 'beam' ]]; then
        echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select

# Use beam shape cursor on startup.
echo -ne '\e[5 q'



#function zle-line-init zle-keymap-select {
	#RPS1="${${KEYMAP/vicmd/-- NOR --}/(main|viins)/-- INS --}"
	#RPS2=$RPS1
	#zle reset-prompt
#}

# Use beam shape cursor for each new prompt.
preexec() {
    echo -ne '\e[5 q'
}

_fix_cursor() {
	echo -ne '\e[5 q'
}
precmd_functions+=(_fix_cursor)

zle -N zle-line-init
zle -N zle-keymap-select

KEYTIMEOUT=1


# fzf
export FZF_DEFAULT_OPTS='--bind ctrl-j:down,ctrl-k:up --preview "[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (ccat --color=always {} || highlight -O ansi -l {} || cat {}) 2> /dev/null | head -500"'
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
export FZF_COMPLETION_TRIGGER='\'
export FZF_TMUX_HEIGHT='80%'
export FZF_PREVIEW_COMMAND='[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (ccat --color=always {} || highlight -O ansi -l {} || cat {}) 2> /dev/null | head -500'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
#source ~/.config/zsh/key-bindings.zsh
#source ~/.config/zsh/completion.zsh
#if [ -f ~/.config/zsh/zshrc ]; then
	#source ~/.config/zsh/zshrc
#fi



#ranger
function ranger {
    local IFS=$'\t\n'
    local tempfile="$(mktemp -t tmp.XXXXXX)"
    local ranger_cmd=(
        command
        ranger
        --cmd="map q chain shell echo %d > "$tempfile"; quitall"
    )
    
    ${ranger_cmd[@]} "$@"
    if [[ -f "$tempfile" ]] && [[ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]]; then
        cd -- "$(cat "$tempfile")" || return
    fi
    command rm -f -- "$tempfile" 2>/dev/null
}

 #ra() {
    #if [ -z "$RANGER_LEVEL" ]
    #then
        #ranger
    #else
        #exit
    #fi
#}


#man color
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'


#解压函数
ex () {
        if [[ -z “$1” ]] ; then
               print -P “usage: \e[1;36mex\e[1;0m < filename >”
               print -P ”       Extract the file specified based on the extension”
        elif [[ -f $1 ]] ; then
           case $1 in
             *.tar)       tar xvf  $1    ;;
             *.tbz2)      tar xvjf $1    ;;
             *.tgz)       tar xvzf $1    ;;
             *.tar.bz2)   tar xjvf $1    ;;
             *.tar.gz)    tar xvzf $1    ;;
             *.tar.xz)    tar Jxf  $1    ;;
             *.tar.Z)     tar xvZf $1    ;;
             *.bz2)       bunzip2v $1    ;;
             *.rar)       rar x $1       ;;
             *.gz)        gunzip $1      ;;
             *.zip)       unzip $1       ;;
             *.Z)         uncompress $1  ;;
             *.xz)        xz -d $1       ;;
             *.lzo)       lzo -dv $1     ;;
             *.7z)        7z x $1        ;;
             *)           echo "'$1' cannot be extracted via extract()" ;;
           esac
       else
         echo “‘$1’ is not a valid file”
       fi
    }


eval "$(thefuck --alias)"
export TERM=xterm-256color
export TERM_ITALICS=true
export RANGER_LOAD_DEFAULT_RC="false"
export EDITOR=nvim
#export TERM=screen-256color
#autoload edit-command-line; zle -N edit-command-line
#bindkey '^v' edit-command-line


alias c='clear'
#alias cdiff='colordiff'
#alias cs='calcurse'
#alias dv='deactivate'
#alias lg='lazygit'
#alias mt='neomutt'
alias ra='ranger'
#alias feem='~/Feem_v4.3.0_For_Linux.AppImage'
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
alias nv='nvim'
alias you='you-get'
alias ari='aria2c'
alias ass='~/.config/niconvert/main.pyw -o'
alias mouse='python ~/.config/mouse.py'
alias gd='git difftool'
#alias gd='git icdiff'
alias ga='git add'
alias ga.='git add .'
alias gs='git status'
alias gc='git commit'
alias gl='tig'
alias gp='git push -u origin master'


#欢迎语
#echo  "talk is cheap,show me the code" | boxes -d stone | lolcat 
catsay  talk is cheap,show me the code | lolcat
#fortune | catsay | lolcat
#neofetch


