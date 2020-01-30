# pyenv
export PATH="$HOME/.pyenv/bin:$PATH"
if [[ -z "$VIRTUAL_ENV" ]]; then
    eval "$(pyenv init -)"
fi
pyenv rehash
export VIRTUAL_ENV_DISABLE_PROMPT=1

# ailias
alias -g la='ls -la'
alias -g ll='ls -la'
alias -g vi='nvim'
alias -g gpp='g++ -o a'

setopt auto_list
setopt auto_menu
zstyle ':completion:*:default' menu select=1
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

setopt auto_cd

# zinitが無ければgitからclone
if [[ ! -d ~/.zinit ]];then
  mkdir ~/.zinit
  git clone https://github.com/zdharma/zinit.git ~/.zinit/bin
fi

# zplugを使う
source ~/.zinit/bin/zinit.zsh
# zinit plugin
zinit light zsh-users/zsh-autosuggestions
zinit light peterhurford/git-aliases.zsh
zplugin snippet OMZ::plugins/github/github.plugin.zsh
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-history-substring-search
zinit snippet OMZ::plugins/git/git.plugin.zsh
zinit light mollifier/anyframe
zinit snippet OMZ::lib/completion.zsh
zinit snippet OMZ::lib/compfix.zsh
zinit ice depth=1;
zinit light romkatv/powerlevel10k

autoload -Uz compinit && compinit

# fzf 関連
export FZF_DEFAULT_OPTS='--color=fg+:11 --height 70% --reverse --select-1 --exit-0 --multi'
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


alias cdd='fzf-cdr'
function fzf-cdr() {
    target_dir=`cdr -l | sed 's/^[^ ][^ ]*  *//' | fzf`
    target_dir=`echo ${target_dir/\~/$HOME}`
    if [ -n "$target_dir" ]; then
        cd $target_dir
    fi
}
