# Remove cached | Add | Commit
gc() {
    _is_git || return $?

    _message "$1" "Please insert a message to commit" || return $?

    git rm -r --cached .;
    git add .;
    git commit -m "$1";
    return 0;
}

# Push
gpisha() {
    _is_git || return $?

    git push origin;
    return 0;
}

# Remove Branch locally
gdb() {
    _is_git || return $?

    git branch -D "$@";
    return 0;
}
compdef _branch gdb

# Remove Branch remotely
grdb() {
    _is_git || return $?

    git push origin -d "$@";
    return 0;
}
compdef _branch grdb

# Sync Remote Branches
gsb() {
    _is_git || return $?

    git fetch origin --prune;
    return 0;
}

# Checkout branch
gcb() {
    _is_git || return $?

    git checkout "$@";
    return 0;
}
compdef _branch gcb

# Checkout and Create Branch
gcab() {
    _is_git || return $?

    git checkout -b "$1";
    return 0;
}

# Merge branch
gmb() {
    _is_git || return $?

    git merge "$@";
    return 0;
}
compdef _branch gmb

# Pull from Remote
gprb() {
    _is_git || return $?

    git pull origin;
    return 0;
}

# Reset Branch
grb() {
    _is_git || return $?

    git reset --hard HEAD;
    return 0;
}

# Get all branches
gab() {
    _is_git || return $?

    git branch -a;
    return 0;
}

# Create tag
gat() {
    _is_git || return $?

    _message "$1" "Please insert a tag name" || return $?

    git tag "$1";
    return 0;
}

# Delete tag
gdt() {
    _is_git || return $?

    git tag -d "$@";
    return 0;
}
compdef _tag gdt

# Push tags
gpishat() {
    _is_git || return $?

    git push origin --tags;
    return 0;
}

# Remove remote tag
gdrt() {
    _is_git || return $?

    git push origin -d "$@";
    return 0;
}
compdef _tag gdrt

# Get All Tags
gt() {
    _is_git || return $?

    git tag;
    return 0;
}


# Auxiliar Functions - Autocomplete

_is_git() {
    if [ ! -d "./.git" ]; then
        echo "Command Failed -> Current directory is not a git repository.";
        return 2;
    fi
}

_message() {
    if [ -z "$1" ]; then
        echo "Command Failed -> $2.";
        return 2;
    fi
}

_branch() {
  local cur prev opts
  COMPREPLY=()
  cur="${COMP_WORDS[COMP_CWORD]}"
  prev="${COMP_WORDS[COMP_CWORD-1]}"
  opts=($(git branch --format='%(refname:short)'))

  compadd -Q -- $opts $cur
}

_tag() {
  local cur prev opts
  COMPREPLY=()
  cur="${COMP_WORDS[COMP_CWORD]}"
  prev="${COMP_WORDS[COMP_CWORD-1]}"
  opts=($(git tag))

  compadd -Q -- $opts $cur
}