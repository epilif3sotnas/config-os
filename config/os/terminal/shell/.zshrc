# zsh config
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

# ohmyposh config
if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
 	eval "$(oh-my-posh init zsh --config $HOME/.cache/oh-my-posh/themes/slimfat.omp.json)"
fi

# plugins config
source $HOME/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOME/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)

autoload -Uz compinit
compinit


# Custom Commands
source $HOME/.zsh/functions/git.zsh
source $HOME/.zsh/functions/tmux.zsh
source $HOME/.zsh/functions/fzf.zsh