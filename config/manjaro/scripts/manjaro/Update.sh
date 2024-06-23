#!/bin/bash

set -e


function display_err {
    printf '\n\n\n%s\n' "$1" >&2            ## Send message to stderr.
    exit "${2-1}"                           ## Return a code specified by $2, or 1 by default.
}


sudo pacman-mirrors --country United_Kingdom    || display_err "Mirrors command failed!"
pamac upgrade -a                                || display_err "Upgrade command failed!"
pamac remove -o                                 || display_err "Remove orphans command failed!"
pamac clean --keep 1                            || display_err "Clean command failed!"
