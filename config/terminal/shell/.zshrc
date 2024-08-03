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

autoload -Uz compinit && compini

# Git Commit Abbreviation

gc() {
    if [ ! -d "./.git" ]; then
        echo "Command Failed -> Current directory is not a git repository.";
        return 2;
    fi

    if [ -z "$1" ]; then
        echo "Command Failed -> Please insert a message to commit.";
        return 2;
    fi

    git rm -r --cached .;
    git add .;
    git commit -m "$1";
    return 0;
}