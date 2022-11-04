export EDITOR=nvim
export GOPATH=$HOME/.go
# export GOPROXY=https://goproxy.cn,direct

export CARGO_PATH=$HOME/.cargo

export PATH="/opt/homebrew/sbin:/opt/homebrew/bin:/usr/local/bin:/usr/bin:/usr/sbin:/bin:/sbin"
export PATH="$CARGO_PATH/bin:$GOPATH/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"


alias ll="ls -al"
alias vi=nvim
alias vim=nvim
alias g=git
alias gti=git
alias gist="gist -p"

alias proxy="export all_proxy=socks5://127.0.0.1:7890"
alias noproxy="unset all_proxy"
alias q=exit

source ~/.antigen/antigen.zsh

antigen use oh-my-zsh
antigen bundle autojump
antigen bundle vi-mode
antigen bundle git
antigen bundle fzf
antigen bundle pyenv
antigen bundle pip
# antigen bundle tmux
antigen bundle extract
antigen bundle gitignore
antigen bundle nvm

antigen bundle lukechilds/zsh-nvm
antigen bundle Aloxaf/fzf-tab
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle z-shell/F-Sy-H --branch=main
# antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions
antigen bundle dracula/zsh
antigen bundle dracula/zsh-syntax-highlighting

antigen apply

zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

export FZF_COMPLETION_TRIGGER='~~'
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS"
--height 40%
--reverse
--bind 'ctrl-f:preview-page-down,ctrl-b:preview-page-up'
--color=light
--color=fg:-1,bg:-1,hl:#5fff87,fg+:-1,bg+:-1,hl+:#ffaf5f
--color=info:#af87ff,prompt:#5fff87,pointer:#ff87d7,marker:#ff87d7,spinner:#ff87d7
"

