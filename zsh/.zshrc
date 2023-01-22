# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# PATH
export PATH="$HOME/nvim-macos/bin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# zsh history
export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=1000
export SAVEHIST=10000
setopt EXTENDED_HISTORY

# color
export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabagacad
export LS_COLORS='di=36:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
zstyle ':completion:*' list-colors 'di=36' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:default' menu select=1

# setopt
setopt auto_pushd
setopt auto_list
setopt auto_menu
setopt auto_param_slash
setopt auto_cd
setopt share_history
setopt hist_reduce_blanks
setopt hist_ignore_dups
setopt print_eight_bit
setopt prompt_subst
setopt nobeep
setopt auto_param_keys

# alias
alias ls='ls -GF'
alias -g la='ls -laGF --color=auto'
alias -g ll='ls -laGF --color=auto'
alias -g vi='nvim'
alias g='git'
alias ga='git add'
alias gd='git diff'
alias gs='git status'
alias gp='git push'
alias gb='git branch'
alias gst='git status'
alias gco='git checkout'
alias gf='git fetch'
alias gc='git commit'

# docker
alias dcu='docker-compose up -d'
alias dcr='docker-compose restart'
alias dcd='docker-compose down'

# zinit
if [[ ! -d ~/.zinit ]];then
    mkdir ~/.zinit
    git clone https://github.com/zdharma/zinit.git ~/.zinit/bin
    zinit self-update
fi
source ~/.zinit/bin/zi.zsh

# fzf
if [[ ! -d ~/.fzf ]];then
    mkdir ~/.fzf
    git clone https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
fi
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'
export FZF_DEFAULT_OPTS='--color=fg+:11 --height 70% --reverse --select-1 --exit-0 --multi'

# ctrl-zで戻る
fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

# powerlevel10k
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
zinit ice depth=1;
zinit light romkatv/powerlevel10k
POWERLEVEL9JK_DISABLE_CONFIGURATION_WIZARD=true

# syntax highlight
zinit light chrissicool/zsh-256color
zinit light zsh-users/zsh-syntax-highlighting

# completions
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
autoload -Uz compinit && compinit

# github
zinit snippet OMZ::lib/git.zsh
zinit snippet OMZ::plugins/git/git.plugin.zsh
zinit light peterhurford/git-aliases.zsh
# co
alias co='git checkout $(git branch -a | tr -d " " |fzf --height 100% --prompt "CHECKOUT BRANCH>" --preview "git log --color=always {}" | head -n 1 | sed -e "s/^\*\s*//g" | perl -pe "s/remotes\/origin\///g")'

# 移動
# .連打
zinit light momo-lab/zsh-replace-multiple-dots
# gitのrootに移動
zinit light mollifier/cd-gitroot
alias cdu='cd-gitroot'
# cdr
autoload -Uz is-at-least
if is-at-least 4.3.11
then
  autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
  add-zsh-hook chpwd chpwd_recent_dirs
  zstyle ':chpwd:*'      recent-dirs-max 500
  zstyle ':chpwd:*'      recent-dirs-default yes
  zstyle ':completion:*' recent-dirs-insert both
fi
# cdd
alias cdd='fzf-cdr'
function fzf-cdr() {
    target_dir=`cdr -l | sed 's/^[^ ][^ ]*  *//' | fzf`
    target_dir=`echo ${target_dir/\~/$HOME}`
    if [ -n "$target_dir" ]; then
        cd $target_dir
    fi
}

# 言語ごとの設定
# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
pyenv rehash
export VIRTUAL_ENV_DISABLE_PROMPT=1

# node
export PATH="$HOME/.nodenv/bin:$PATH"
eval "$(nodenv init -)"

# go
export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$PATH"
eval "$(goenv init -)"
export PATH="$GOROOT/bin:$PATH"
export PATH="$PATH:$GOPATH/bin"
