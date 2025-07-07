fzff() { find ./"$1" -type f | fzf --preview 'bat --color=always {}' --style minimal }

fzfd() { find ./"$1" -type d | fzf --style minimal }