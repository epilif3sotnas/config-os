# Version
gv() {
    git version;
    return 0;
}

# Config
gconfig() {
    git config -l;
    return 0;
}

# Set config
gsetconfig() {
    _message "$*" "Please insert the configuration arguments." || return $?

    git config $*;
    return 0;
}
compdef _git gsetconfig=git-config

# Clone
gclone() {
    _message "$*" "Please insert a URL to clone." || return $?

    git clone --recurse-submodules $*;
    return 0;
}
compdef _git gclone=git-clone

# Init
ginit() {
    git init $*;
    return 0;
}
compdef _git ginit=git-init

# Remote
gremote() {
    _is_git || return $?
    _message "$*" "Please insert the remote command." || return $?

    git remote $*;
    return 0;
}
compdef _git gremote=git-remote

# Submodule
gmodule() {
    _is_git || return $?
    _message "$*" "Please insert the submodule command." || return $?

    git submodule $*;
    return 0;
}
compdef _git gmodule=git-submodule

# Graph
ggraph() {
    _is_git || return $?

    git log --graph --oneline --all;
    return 0;
}

# Status
gstatus() {
    _is_git || return $?

    git status;
    return 0;
}
compdef _git gstatus=git-status

# Reflog
greflog() {
    _is_git || return $?

    git reflog $*;
    return 0;
}
compdef _git greflog=git-reflog

# Blame
gblame() {
    _is_git || return $?
    _message "$*" "Please insert blame file." || return $?

    git blame $*;
    return 0;
}
compdef _git gblame=git-blame

# Diff
gdiff() {
    _is_git || return $?
    _message "$*" "Please insert diff information." || return $?

    git diff $*;
    return 0;
}
compdef _git gdiff=git-diff

# Stash
gstash() {
    _is_git || return $?
    _message "$*" "Please insert stash command." || return $?

    git stash $*;
    return 0;
}
compdef _git gstash=git-stash

# Bisect
gbisect() {
    _is_git || return $?
    _message "$*" "Please insert bisect information." || return $?

    git bisect $*;
    return 0;
}
compdef _git gbisect=git-bisect

# Cherry-pick
gcherrypick() {
    _is_git || return $?
    _message "$*" "Please insert cherry pick information." || return $?

    git cherry-pick $*;
    return 0;
}
compdef _git gcherrypick=git-cherry-pick

# Revert
grevert() {
    _is_git || return $?
    _message "$*" "Please insert the commit SHA to revert to." || return $?

    git revert $*;
    return 0;
}
compdef _git grevert=git-revert

# Rebase
grebase() {
    _is_git || return $?
    _message "$*" "Please insert a branch to rebase." || return $?

    git rebase $*;
    return 0;
}
compdef _git grebase=git-rebase

# Checkout branch
gcb() {
    _is_git || return $?

    git checkout $*;
    return 0;
}
compdef _git gcb=git-checkout

# Create Branch
gab() {
    _is_git || return $?

    git checkout -b $*;
    return 0;
}

# Remove Branch locally
grb() {
    _is_git || return $?

    git branch -D $*;
    return 0;
}
compdef _git grb=git-branch

# Reset Branch
gresetb() {
    _is_git || return $?

    git reset --hard HEAD;
    return 0;
}

# Clean Branch
gclean() {
    _is_git || return $?

    git clean $*;
    return 0;
}
compdef _git gclean=git-clean

# Restore
grestore() {
    _is_git || return $?

    git restore $*;
    return 0;
}
compdef _git grestore=git-restore

# Get all branches
gb() {
    _is_git || return $?

    git branch -a;
    return 0;
}

# Create tag
gat() {
    _is_git || return $?

    _message "$*" "Please insert a tag name" || return $?

    git tag $*;
    return 0;
}

# Remove tag
grt() {
    _is_git || return $?

    git tag -d $*;
    return 0;
}
compdef _git grt=git-tag

# Get All Tags
gt() {
    _is_git || return $?

    git tag;
    return 0;
}

# Remove cached | Add | Commit
gc() {
    _is_git || return $?
    _message "$*" "Please insert a message to commit" || return $?

    git rm -r --cached .;
    git add .;
    git commit -m $*;
    return 0;
}

# Sync Origin
gso() {
    _is_git || return $?

    git remote prune origin;
    return 0;
}

# Sync Upstream
gsu() {
    _is_git || return $?

    git remote prune upstream;
    return 0;
}

# Merge branch
gmb() {
    _is_git || return $?

    git merge $*;
    return 0;
}
compdef _git gmb=git-merge

# Push Branch
gpisha() {
    _is_git || return $?

    git push origin $(git branch --show-current);
    return 0;
}

# Push tags
gpishat() {
    _is_git || return $?

    if [ -z "$*" ]; then
        git push origin --tags;
    else
        git push origin $*;
    fi

    return 0;
}
compdef _git gpishat=git-push

# Pull from Origin
gpob() {
    _is_git || return $?

    git pull origin $(git branch --show-current);
    return 0;
}

# Pull from Upstream
gpub() {
    _is_git || return $?

    git pull upstream $(git branch --show-current);
    return 0;
}

# Remove Branch remotely
grob() {
    _is_git || return $?

    git push origin -d $*;
    return 0;
}
compdef _git grob=git-push

# Remove remote tag
grot() {
    _is_git || return $?

    git push origin -d $*;
    return 0;
}
compdef _git grot=git-push


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