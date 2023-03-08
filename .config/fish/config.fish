if status is-interactive
    # Commands to run in interactive sessions can go here
    #eval (zellij setup --generate-auto-start fish | string collect)
    if set -q ZELLIJ
    else
      # Attach to zellij session
      set ZJ_SESSIONS (zellij list-sessions | string split "\n")
      set NO_SESSIONS (echo $ZJ_SESSIONS | wc -w)

      echo $ZJ_SESSIONS

      if test $NO_SESSIONS -ge 2
        zellij attach (echo $ZJ_SESSIONS | string split " " | fzf)
      else
        zellij attach -c
      end
    end
end

export EDITOR="/usr/bin/nvim"

# Apps
alias nvd="neovide --multigrid"
alias ls="exa --icons"
alias grep="rg"
alias xbgs="nitrogen $HOME/Pictures/bg/"
alias textidote="java -jar $HOME/Apps/textidote.jar"

function ec 
  emacsclient --create-frame $argv &
end

# Configuration
alias i3conf="$EDITOR ~/.config/i3/config"
alias swayconf="$EDITOR ~/.config/sway/config.md"
alias fishconf="$EDITOR ~/.config/fish/config.fish"
alias nvimconf="$EDITOR ~/.config/nvim/"
alias kittyconf="$EDITOR ~/.config/kitty/kitty.conf"

alias dots="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"

# Path extensions
export PATH="/usr/bin/python:$PATH"
export PATH="$HOME/.local/bin/:$PATH"
export PATH="$HOME/.cargo/bin/:$PATH"
export PATH="$HOME/.emacs.d/bin/:$PATH"
export PATH="$HOME/.nimble/bin/:$PATH"
export PATH="$HOME/.dotbare:$PATH"
export PATH="$HOME/Stuff/flutter/bin:$PATH"

export XDG_CONFIG_HOME="$HOME/.config"

# Add flatpak exports to PATH
set -l xdg_data_home $XDG_DATA_HOME ~/.local/share
set -gx --path XDG_DATA_DIRS $xdg_data_home[1]/flatpak/exports/share:/var/lib/flatpak/exports/share:/usr/local/share:/usr/share

for flatpakdir in ~/.local/share/flatpak/exports/bin /var/lib/flatpak/exports/bin
    if test -d $flatpakdir
        contains $flatpakdir $PATH; or set -a PATH $flatpakdir
    end
end

# Enable rust instrumentation
function enable-tablet --description "Enable rust instrumentation"
  export CARGO_INCREMENTAL=0
  export RUSTFLAGS='-Cinstrument-coverage'
  export LLVM_PROFILE_FILE='cargo-test-%p-%m.profraw'
end

# C Stuff
export CPATH="$CPATH:/usr/lib/gcc/x86_64-redhat-linux/12/include"
export CPLUS_INCLUDE_PATH="$CPLUS_INCLUDE_PATH:/usr/lib/gcc/x86_64-redhat-linux/12/include"
export CMAKE_GENERATOR="Ninja"

export PKG_CONFIG_PATH="/usr/bin/pkgconf"
export PKG_CONFIG="/usr/bin/pkgconf"

export CC="/usr/bin/cc"

# Input method
export GTK_IM_MODULE="fcitx"
export QT_IM_MODULE="fcitx"
export XMODIFIERS="@im=fcitx"
export GLFW_IM_MODULE="fcitx"

export QT_QPA_PLATFORMTHEME="qt5ct"


set -U fish_greeting "🐟"

# Haskell
set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin /home/skadic/.ghcup/bin $PATH # ghcup-env

source /home/skadic/.config/fish/zoxide.fish

starship init fish | source
