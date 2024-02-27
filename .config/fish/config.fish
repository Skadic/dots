# Path extensions
export PATH="/usr/bin/python:$PATH"
export PATH="$HOME/.local/bin/:$PATH"
export PATH="$HOME/.cargo/bin/:$PATH"
export PATH="$HOME/.emacs.d/bin/:$PATH"
export PATH="$HOME/.nimble/bin/:$PATH"
export PATH="$HOME/.dotbare:$PATH"
export PATH="$HOME/Stuff/flutter/bin:$PATH"

if status is-interactive
  # Commands to run in interactive sessions can go here
  #if not set -q ZELLIJ
    # Find all zellij sessions
  #  set ZJ_SESSIONS (zellij list-sessions | string split "\n" | awk '{print $1;}' | sed -e 's/\x1b\[[0-9;]*m//g')
  #  # If there is a session manager already, delete it 
  #  if contains "session-manager" $ZJ_SESSIONS
  #    zellij delete-session --force session-manager  
  #  end
    # Start the session manager
  #  zellij -s session-manager -l session-man
  #end
end

export EDITOR="/usr/bin/nvim"

function zn 
  zellij
end

function za 
  # Attach to zellij session
  set ZJ_SESSIONS (zellij list-sessions | rg -v 'EXITED' | awk '{print $1;}' | sed -e 's/\x1b\[[0-9;]*m//g')
  set NO_SESSIONS (echo $ZJ_SESSIONS | wc -w)

  if test $NO_SESSIONS -ge 2
    zellij attach (echo $ZJ_SESSIONS | string split " " | fzf --header "Choose Zellij Workspace")
  else if test $NO_SESSIONS -ge 1
    zellij attach -c
  else
    zellij
  end
end

function zad
  # Attach to dead zellij session
  set ZJ_SESSIONS (zellij list-sessions | rg 'EXITED' | awk '{print $1;}' | sed -e 's/\x1b\[[0-9;]*m//g')
  set NO_SESSIONS (echo $ZJ_SESSIONS | wc -w)

  if test $NO_SESSIONS -ge 2
    zellij attach (echo $ZJ_SESSIONS | string split " " | fzf --header "Choose Zellij Workspace")
  else if test $NO_SESSIONS -ge 1
    zellij attach -c
  else
    zellij
  end
end

# Apps
alias nvd="neovide --multigrid"
alias rm="trash"
alias ls="eza --icons"
alias ll="ls -lh --group-directories-first --git"
alias tree="erd -HI"
alias grep="rg"
alias textidote="java -jar $HOME/Apps/textidote.jar"
alias nbim="nvim"
alias vim="nvim"
alias bim="nvim"

function trash-size 
  ll --total-size --no-permissions $(trash-list --trash-dirs) | grep files | string trim | string split " " | head -n 1
end

function zs 
  set ZJ_SESSIONS (zellij list-sessions | string split "\n" | awk '{print $1;}' | sed -e 's/\x1b\[[0-9;]*m//g')
  # If there is a session manager already, delete it 
  if contains "session-manager" $ZJ_SESSIONS
    zellij delete-session --force session-manager  
  end
  # Start the session manager
  zellij -s session-manager -l session-man
end

function wgup
  set -l find_res $(find /home/skadic/WireGuard/* | fzf --header "Choose VPN Connection to enable")
  sudo wg-quick up $find_res
end

function wgdown
  set -l find_res $(find /home/skadic/WireGuard/* | fzf --header "Choose VPN Connection to disable")
  sudo wg-quick down $find_res
end

function enable_tablet
  swaymsg create_output HEADLESS-1
  wayvnc --output=HEADLESS-1 --max-fps=20 192.168.0.242 5900 &
end

# Configuration
alias i3conf="$EDITOR ~/.config/i3/config"
alias swayconf="$EDITOR ~/.config/sway/config.md"
alias fishconf="$EDITOR ~/.config/fish/config.fish"
alias nvimconf="$EDITOR ~/.config/nvim/"
alias kittyconf="$EDITOR ~/.config/kitty/kitty.conf"

alias dots="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"

export LD_LIBRARY_PATH="/usr/lib/:/usr/lib64/:/lib/:/lib64/:$LD_LIBRARY_PATH"

export XDG_CONFIG_HOME="$HOME/.config"

# don't even ask
export CARGO_MOMMYS_LITTLE="boy"

# Add flatpak exports to PATH
set -l xdg_data_home $XDG_DATA_HOME ~/.local/share
set -gx --path XDG_DATA_DIRS $xdg_data_home[1]/flatpak/exports/share:/var/lib/flatpak/exports/share:/usr/local/share:/usr/share

for flatpakdir in ~/.local/share/flatpak/exports/bin /var/lib/flatpak/exports/bin
    if test -d $flatpakdir
        contains $flatpakdir $PATH; or set -a PATH $flatpakdir
    end
end

# C Stuff
export CPATH="$CPATH:/usr/lib/gcc/x86_64-redhat-linux/13/include"
export CPLUS_INCLUDE_PATH="$CPLUS_INCLUDE_PATH:/usr/lib/gcc/x86_64-redhat-linux/13/include"
export CMAKE_GENERATOR="Ninja"

export PKG_CONFIG_PATH="/usr/bin/pkgconf"
export PKG_CONFIG="/usr/bin/pkgconf"

export ASAN_OPTIONS="symbolize=1"
export ASAN_SYMBOLIZER_PATH="/usr/bin/llvm-symbolizer"

export CC="/usr/bin/cc"

export HIP_CLANG_PATH="/usr/bin/hipcc"

# Input method
export GTK_IM_MODULE="fcitx"
export QT_IM_MODULE="fcitx"
export XMODIFIERS="@im=fcitx"
export GLFW_IM_MODULE="fcitx"

export QT_STYLE_OVERRIDE="kvantum"
export QT_QUICK_CONTROLS_STYLE="org.kde.desktop"

export CARGO_REGISTRIES_CRATES_IO_PROTOCOL="sparse"

set -Ux FZF_DEFAULT_OPTS "\
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

set -U fish_greeting "🐟"

# Haskell
set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin /home/skadic/.ghcup/bin $PATH # ghcup-env

zoxide init fish | source
source /home/skadic/.config/fish/secret.fish

function starship_transient_prompt_func
  starship module character
end
starship init fish | source
enable_transience

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
