if status is-interactive
    # Commands to run in interactive sessions can go here
end

alias nvd="neovide --multigrid"
alias i3conf="nvd ~/.i3/config"
alias hyprconf="nvd ~/.config/hypr/hypr.conf"
alias pacinst="sudo pacman -S"
alias pacuninst="sudo pacman -Rs"
alias pacsysupgrade="sudo pacman -Syyu"
alias refreshbg="bash ~/Pictures/bg/setbg"
alias lls="exa --icons"
alias showkoy="nohup viewnior /home/skadic/pictures/koy.png &"
alias vimcheat="mupdf /home/skadic/.cmd_resources/vimcheatsheet.pdf"

alias dockerclean="docker system prune -a -f"

export PATH="/usr/bin/python:$PATH"
export PATH="/home/skadic/.local/bin/:$PATH"
export PATH="$HOME/.cargo/bin/:$PATH"
export PATH="/$PATH"

export XDG_CONFIG_HOME="$HOME/.config"

#export QT_QPA_PLATFORMTHEME="gtk2"

export LUNARVIM_CONFIG_DIR="/home/skadic/.config/lvim/"

set -U fish_greeting "🐟"

starship init fish | source
