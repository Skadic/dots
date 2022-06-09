if status is-interactive
    # Commands to run in interactive sessions can go here
end

# System Management
alias pacinst="sudo pacman -S"
alias pacuninst="sudo pacman -Rs"
alias pacsysupgrade="sudo pacman -Syyu"

# Apps
alias nvd="neovide --multigrid"
alias ls="exa --icons"

# Configuration
alias i3conf="nvd ~/.i3/config"
alias fishconf="nvd ~/.config/fish/config.fish"
alias nvimconf="nvd ~/.config/nvim/"
alias kittyconf="nvd ~/.config/kitty/kitty.conf"
alias hyprconf="nvd ~/.config/hypr/hypr.conf"

# Git
alias gad="git add"
alias gst="git status"
alias gco="git commit"
alias gpl="git pull"
alias gps="git push"

# Cheatsheet
alias showkoy="nohup viewnior /home/skadic/pictures/koy.png &"
alias vimcheat="nohup mupdf /home/skadic/.cmd_resources/vimcheatsheet.pdf &"


export PATH="/usr/bin/python:$PATH"
export PATH="/home/skadic/.local/bin/:$PATH"
export PATH="$HOME/.cargo/bin/:$PATH"
export PATH="/$PATH"

export XDG_CONFIG_HOME="$HOME/.config"

#export QT_QPA_PLATFORMTHEME="qt5ct"

export LUNARVIM_CONFIG_DIR="/home/skadic/.config/lvim/"

set -U fish_greeting "🐟"

starship init fish | source
