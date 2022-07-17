if status is-interactive
    # Commands to run in interactive sessions can go here
end

export EDITOR="/usr/bin/nvim"

# Apps
alias nvd="neovide --multigrid"
alias ls="exa --icons"
alias grep="rg"
alias bgs="nitrogen $HOME/Pictures/bg/"
alias textidote="java -jar $HOME/Apps/textidote.jar"

# Configuration
alias i3conf="$EDITOR ~/.config/i3/config"
alias fishconf="$EDITOR ~/.config/fish/config.fish"
alias nvimconf="$EDITOR ~/.config/nvim/"
alias kittyconf="$EDITOR ~/.config/kitty/kitty.conf"
alias hyprconf="$EDITOR ~/.config/hypr/hypr.conf"

# Emacs
alias doomsync="$HOME/.emacs.d/bin/doom sync"

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


# Add flatpak exports to PATH
set -l xdg_data_home $XDG_DATA_HOME ~/.local/share
set -gx --path XDG_DATA_DIRS $xdg_data_home[1]/flatpak/exports/share:/var/lib/flatpak/exports/share:/usr/local/share:/usr/share

for flatpakdir in ~/.local/share/flatpak/exports/bin /var/lib/flatpak/exports/bin
    if test -d $flatpakdir
        contains $flatpakdir $PATH; or set -a PATH $flatpakdir
    end
end

# Laptop second screen
function enable-tablet --description "Enable using the Tab S7 as a second screen"
  xrandr --newmode "2560x1600_120.00"  737.16  2560 2784 3072 3584  1600 1601 1604 1714  -HSync +Vsync;
  xrandr --addmode DisplayPort-0 2560x1600_120.00;
  xrandr --output DisplayPort-0 --mode 2560x1600_120.00 --right-of eDP;
end
alias disable-tablet="xrandr --output DisplayPort-0 --off"
alias start-vnc-server="x11vnc -clip xinerama1 -ncache_cr -nc 10 -usepw -noxrecord -repeat"




# C Stuff
export CPATH="$CPATH:/usr/lib/gcc/x86_64-redhat-linux/12/include"
export CPLUS_INCLUDE_PATH="$CPLUS_INCLUDE_PATH:/usr/lib/gcc/x86_64-redhat-linux/12/include"

export PKG_CONFIG_PATH="/usr/bin/pkgconf"
export PKG_CONFIG="/usr/bin/pkgconf"

export CC="/usr/bin/cc"




#export QT_QPA_PLATFORMTHEME="qt5ct"

export LUNARVIM_CONFIG_DIR="/home/skadic/.config/lvim/"

set -U fish_greeting "🐟"

starship init fish | source
