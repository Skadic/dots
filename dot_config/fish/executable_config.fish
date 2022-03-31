if status is-interactive
    # Commands to run in interactive sessions can go here
end

alias i3conf="lvim ~/.i3/config"
alias hyprconf="lvim ~/.config/hypr/hypr.conf"
alias pacinst="sudo pacman -S"
alias pacuninst="sudo pacman -Rs"
alias pacsysupgrade="sudo pacman -Syyu"
alias refreshbg="bash ~/Pictures/bg/setbg"
alias lls="exa"
alias showkoy="nohup viewnior /home/skadic/pictures/koy.png &"
alias vimcheat="mupdf /home/skadic/.cmd_resources/vimcheatsheet.pdf"
#alias config="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias nixconf="sudo nvim /etc/nixos/configuration.nix"

alias dockerclean="docker system prune -a -f"

export PATH="/usr/bin/python:$PATH"
export PATH="/home/skadic/.local/bin/:$PATH"
export PATH="$HOME/.dotbare:$PATH"
export PATH="/$PATH"

export QT_QPA_PLATFORMTHEME="qt5ct"

export LUNARVIM_CONFIG_DIR="/home/skadic/.config/lvim/"

set -U fish_greeting "🐟"

starship init fish | source
