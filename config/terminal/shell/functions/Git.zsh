# Remove cached | Add | Commit
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

# Push
gpisha() {
    if [ ! -d "./.git" ]; then
        echo "Command Failed -> Current directory is not a git repository.";
        return 2;
    fi

    git push origin $(git branch --show-current);
    return 0;
}

# Remove Branch locally
gd() {
    if [ ! -d "./.git" ]; then
        echo "Command Failed -> Current directory is not a git repository.";
        return 2;
    fi

    git branch -D "$@";
    return 0;
}
compdef _branch gd

# Remove Branch remotely
grd() {
    if [ ! -d "./.git" ]; then
        echo "Command Failed -> Current directory is not a git repository.";
        return 2;
    fi

    git push origin -d "$@";
    return 0;
}
compdef _branch grd

# Sync Remote Branches
gsb() {
    if [ ! -d "./.git" ]; then
        echo "Command Failed -> Current directory is not a git repository.";
        return 2;
    fi

    git fetch origin --prune;
    return 0;
}

# Checkout branch
gcb() {
    if [ ! -d "./.git" ]; then
        echo "Command Failed -> Current directory is not a git repository.";
        return 2;
    fi

    git checkout "$@";
    return 0;
}
compdef _branch gcb

# Checkout and Create Branch
gcab() {
    if [ ! -d "./.git" ]; then
        echo "Command Failed -> Current directory is not a git repository.";
        return 2;
    fi

    git checkout -b "$@";
    return 0;
}
compdef _branch gcab

# Merge branch
gm() {
    if [ ! -d "./.git" ]; then
        echo "Command Failed -> Current directory is not a git repository.";
        return 2;
    fi

    git merge "$@";
    return 0;
}
compdef _branch gm

# Pull from Remote
gpr() {
    if [ ! -d "./.git" ]; then
        echo "Command Failed -> Current directory is not a git repository.";
        return 2;
    fi

    git pull origin "$@";
    return 0;
}
compdef _branch gpr

# Reset Branch
grb() {
    if [ ! -d "./.git" ]; then
        echo "Command Failed -> Current directory is not a git repository.";
        return 2;
    fi

    git reset --hard HEAD;
    return 0;
}

# Get all branches
gab() {
    if [ ! -d "./.git" ]; then
        echo "Command Failed -> Current directory is not a git repository.";
        return 2;
    fi

    git branch -a;
    return 0;
}


# Auxiliar Functions - Autocomplete

_branch() {
  local cur prev opts
  COMPREPLY=()
  cur="${COMP_WORDS[COMP_CWORD]}"
  prev="${COMP_WORDS[COMP_CWORD-1]}"
  opts=$(git branch --format='%(refname:short)')

  compadd -Q "$opts"
}