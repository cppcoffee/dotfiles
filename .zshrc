export EDITOR=nvim
export GOPATH=$HOME/.go
# export GOPROXY=https://goproxy.cn,direct

export PYENV_ROOT="$HOME/.pyenv"
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
export PTPYTHON_CONFIG_HOME=~/.config/ptpython

export CARGO_PATH=$HOME/.cargo

export PATH="/opt/homebrew/sbin:/opt/homebrew/bin:/usr/local/bin:/usr/bin:/usr/sbin:/bin:/sbin"
export PATH="$CARGO_PATH/bin:$GOPATH/bin:$PYENV_ROOT/shims:$PATH"
export PATH="$HOME/.local/bin:${HOME}/.krew/bin:$PATH"

export XDG_CONFIG_HOME="$HOME/.config"

source ~/.antigen/antigen.zsh

antigen use oh-my-zsh
antigen bundle autojump
antigen bundle vi-mode
antigen bundle git
antigen bundle fzf
antigen bundle pyenv
antigen bundle pip
antigen bundle kubectl
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
antigen bundle Tarrasch/zsh-autoenv

antigen apply

zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LDFLAGS="-L/opt/homebrew/opt/zlib/lib -L/opt/homebrew/opt/openssl@3/lib"
export CPPFLAGS="-I/opt/homebrew/opt/zlib/include -I/opt/homebrew/opt/openssl@3/include"

alias vi=nvim
alias vim=nvim
alias la='eza -alF --icons'
alias ls='eza -lF --icons'
alias cat='bat --style=numbers --theme="Visual Studio Dark+"'
alias g=git
alias gti=git
alias proxy="export https_proxy=http://127.0.0.1:7890;export http_proxy=http://127.0.0.1:7890;export all_proxy=socks5://127.0.0.1:7890"
alias noproxy="unset all_proxy https_proxy http_proxy"
alias q=exit

export GPG_TTY=$(tty)

# history size
export HISTSIZE=5000
export SAVEHIST=$HISTSIZE
setopt EXTENDED_HISTORY

export FZF_BASE=/opt/homebrew/bin/fzf
export ZSH_HIGHLIGHT_MAXLENGTH=60
export FZF_COMPLETION_TRIGGER='~~'
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS"
--height 40%
--reverse
--bind 'ctrl-f:preview-page-down,ctrl-b:preview-page-up'
--color=light
--color=fg:-1,bg:-1,hl:#5fff87,fg+:-1,bg+:-1,hl+:#ffaf5f
--color=info:#af87ff,prompt:#5fff87,pointer:#ff87d7,marker:#ff87d7,spinner:#ff87d7
"

