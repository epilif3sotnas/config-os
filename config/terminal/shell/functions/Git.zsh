# Remove cached | Add | Commit
gc() {
    _is_git

    if [ -z "$1" ]; then
        echo "Command Failed -> Please insert a message to commit.";
        return 2;
    fi

    git rm -r --cached .;
    git add .;
    git commit -m "$1";
    return 0;
}

# Push
gpisha() {
    _is_git

    git push origin $(git branch --show-current);
    return 0;
}

# Remove Branch locally
gd() {
    _is_git

    git branch -D "$@";
    return 0;
}
compdef _branch gd

# Remove Branch remotely
grd() {
    _is_git

    git push origin -d "$@";
    return 0;
}
compdef _branch grd

# Sync Remote Branches
gsb() {
    _is_git

    git fetch origin --prune;
    return 0;
}

# Checkout branch
gcb() {
    _is_git

    git checkout "$@";
    return 0;
}
compdef _branch gcb

# Checkout and Create Branch
gcab() {
    _is_git

    git checkout -b "$@";
    return 0;
}
compdef _branch gcab

# Merge branch
gm() {
    _is_git

    git merge "$@";
    return 0;
}
compdef _branch gm

# Pull from Remote
gpr() {
    _is_git

    git pull origin "$@";
    return 0;
}
compdef _branch gpr

# Reset Branch
grb() {
    _is_git

    git reset --hard HEAD;
    return 0;
}

# Get all branches
gab() {
    _is_git

    git branch -a;
    return 0;
}


# Auxiliar Functions - Autocomplete

_is_git() {
    if [ ! -d "./.git" ]; then
        echo "Command Failed -> Current directory is not a git repository.";
        return 2;
    fi
}

_branch() {
  local cur prev opts
  COMPREPLY=()
  cur="${COMP_WORDS[COMP_CWORD]}"
  prev="${COMP_WORDS[COMP_CWORD-1]}"
  opts=$(git branch --format='%(refname:short)')

  compadd -Q "$opts"
}