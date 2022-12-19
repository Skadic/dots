# Sway Configuration

My sway config. Please see http://i3wm.org/docs/userguide.html for a complete reference!
This is intended to be compiled with [lmt](https://github.com/driusan/lmt).

## Setup

These are basic configurations that are fundamental settings for sway. 

### Mod Key

We set the modifier key. The most popular options are `Mod1` for `Alt` and `Mod4` for the windows key.
```swayconfig config +=
set $mod Mod4
```
### Terminal

The default terminal and a keybind to start it. In my case I like using kitty.
```swayconfig config +=
set $terminal kitty
```
### Font

This font is mostly used for window titles.
```swayconfig config +=
font xft:JetBrains Mono Nerd Font 11
```

### Floating modifier

This is a key that when pressed allows windows to be dragged around.
```swayconfig config +=
floating_modifier $mod
```
### Keyboard Input

This sets my default keyboard layout, which is the German Neoqwertz layout.
It's basically the same as regular QWERTZ, but remaps the special characters to not be horrendous.
```swayconfig config +=
input type:keyboard {
  xkb_layout "de"
  xkb_variant "neo_qwertz"
}
```
### Mouse and Touchpad Input

```swayconfig config +=
input type:pointer {
  accel_profile flat
  pointer_accel 0
}

input type:touchpad {
  scroll_factor 0.5
  tap enabled
  natural_scroll enabled
}
```

### Visual Settings

This is stuff added by [SwayFX](https://github.com/WillPower3309/swayfx)!

```swayconfig config +=
corner_radius 8
```

### Monitor Settings

This sets up my monitors. This might need tweaking depending on the setup I'm working with at the moment.
```swayconfig config +=
output HDMI-A-1 pos 380 0 mode 1920x1080@120Hz
output eDP-1 pos 0 1080 mode 2560x1600@60Hz
```

### Border Settings

This configures the window borders when a window is active.
Border style options are :
- `normal`: Enables titlebars
- `pixel <px>`: A border with the specified width and no titlebar. 
- `none`: Self-explanatory
```swayconfig config +=
default_border pixel 2
default_floating_border pixel 2
```

Smart borders draw borders around container only if it is not the only container on this workspace.
Options are:
- `on`: Always activate
- `no_gaps`: Only activate if the gap size to the edge of the screen is 0
```swayconfig config += 
smart_borders on
```

### Workspaces

This sets up workspace names. 
```swayconfig config +=
set $ws1 1
set $ws2 2
set $ws3 3
set $ws4 4
set $ws5 5
set $ws6 6
set $ws7 7
set $ws8 8
```

To display names or symbols instead of plain workspace numbers you can use something like:
```swayconfig
set $ws1 1:mail
set $ws2 2:
```

We don't want to switch back and forth between workspaces repeatedly when pressing the workspace's keybind.
```swayconfig config +=
workspace_auto_back_and_forth no
```

Also, if we have a workspace with an urgent window, we want to automaticall switch to it.
```swayconfig config +=
for_window [urgent=latest] focus
```

### Colors

The colors that sway uses. This is also mostly for borders and titlebars.
These colors are from the [Catppuccin](https://github.com/catppuccin/catppuccin) "Mocha" color palette.
```swayconfig config +=
set $cl_acce #b4befe
set $cl_high #b4befe
set $cl_indi #9399b2
set $cl_surf #313244
set $cl_back #1e1e2e
set $cl_over #45475a
set $cl_fore #cdd6f4
set $cl_intx #7f849c
set $cl_urge #f38ba8

# Colors                border   bg       text     indi     childborder
client.focused          $cl_acce $cl_back $cl_fore $cl_indi $cl_high
client.focused_inactive $cl_over $cl_surf $cl_intx $cl_back $cl_back
client.unfocused        $cl_over $cl_surf $cl_intx $cl_back $cl_back
client.urgent           $cl_urge $cl_urge $cl_fore $cl_urge $cl_urge
```

### Cursor

Set the cursor theme.
```swayconfig config +=
seat seat0 xcursor_theme "Posy's Cursor Black"
```

### Window Rules

Some applications should not be tiled.
```swayconfig config +=
for_window [title="alsamixer"] floating enable border pixel 1
for_window [class="calamares"] floating enable border normal
for_window [class="Clipgrab"] floating enable
for_window [title="File Transfer*"] floating enable
for_window [class="fpakman"] floating enable
for_window [class="GParted"] floating enable border normal
for_window [title="i3_help"] floating enable sticky enable border normal
for_window [class="Lightdm-settings"] floating enable
for_window [class="Lxappearance"] floating enable sticky enable border normal
for_window [title="MuseScore: Play Panel"] floating enable
for_window [class="Oblogout"] fullscreen enable
for_window [class="octopi"] floating enable
for_window [class="Pavucontrol"] floating enable
for_window [class="qt5ct"] floating enable sticky enable border normal
for_window [class="Qtconfig-qt4"] floating enable sticky enable border normal
for_window [class="Simple-scan"] floating enable border normal
for_window [class="(?i)System-config-printer.py"] floating enable border normal
for_window [class="Timeset-gui"] floating enable border normal
for_window [class="(?i)virtualbox"] floating enable border normal
for_window [class="Xfburn"] floating enable
for_window [app_id="nm-connection-editor"] floating enable
```
### Gaps

This configures window gaps.
```swayconfig config +=
gaps inner 8
gaps outer 10
```

You can also issue commands like this:
```swayconfig
gaps inner all set 10
gaps outer all plus 5
gaps outer current minus 2
```

## Keybinds

As the name says, these are keybinds for controlling sway, opening programs etc.

## Reload

This reloads sway.
```swayconfig config +=
bindsym $mod+Shift+c exec cd .config/sway && lmt config.md; reload
bindsym $mod+Shift+r restart
```

### Open Terminal

This opens the terminal [set before](#terminal).
```swayconfig config +=
bindsym $mod+Return exec $terminal
```
### Launch and Run

This keybind opens a program launcher.
```swayconfig config +=
bindsym $mod+d exec --no-startup-id rofi -show drun
#bindsym $mod+d exec nwg-drawer -r -fm dolphin -nofs -term kitty && nwg-drawer 
```
This opens a launcher that runs a terminal command.
```swayconfig config +=
bindsym $mod+p exec --no-startup-id rofi -show run
```
### Brightness

These commands bind screen brightness controls to the brightness buttons.
```swayconfig config +=
bindsym XF86MonBrightnessUp exec "brightnessctl set +10"
bindsym XF86MonBrightnessDown exec "brightnessctl set 10-"
```
### Focus

These commands change the currently focused window or workspace.
Generally they will just be `$mod+<key>` like other commands. 

### Windows

They focus windows in a certain direction.
```swayconfig config +=
bindsym $mod+j focus left
bindsym $mod+k focus down
bindsym $mod+l focus up
bindsym $mod+odiaeresis focus right

bindsym $mod+Left focus left
bindsym $mod+Down focus down
bindsym $mod+Up focus up
bindsym $mod+Right focus right
```
#### Workspace

This switches the workspace by its number.
```swayconfig config +=
bindsym $mod+1 workspace $ws1
bindsym $mod+2 workspace $ws2
bindsym $mod+3 workspace $ws3
bindsym $mod+4 workspace $ws4
bindsym $mod+5 workspace $ws5
bindsym $mod+6 workspace $ws6
bindsym $mod+7 workspace $ws7
bindsym $mod+8 workspace $ws8
```
This toggles between the last two visited workspaces.
```swayconfig config +=
bindsym $mod+b workspace back_and_forth
```
This moves to the next or previous workspace.
```swayconfig config +=
bindsym $mod+Ctrl+Right workspace next
bindsym $mod+Ctrl+Left workspace prev
```
### Move 

These commands move windows somewhere else.
Generally, these are the same as the [focus commands](#focus), but with an additional `Shift` modifier.

#### Direction

These move the focused window in a direction.
```swayconfig config +=
bindsym $mod+Shift+j move left
bindsym $mod+Shift+k move down
bindsym $mod+Shift+l move up
bindsym $mod+Shift+odiaeresis move right

bindsym $mod+Shift+Left move left
bindsym $mod+Shift+Down move down
bindsym $mod+Shift+Up move up
bindsym $mod+Shift+Right move right
```
#### Workspace

These move the focused window to a workspace. Note that these have a `Ctrl` modifier instead.
```swayconfig config +=
bindsym $mod+Ctrl+1 move container to workspace $ws1
bindsym $mod+Ctrl+2 move container to workspace $ws2
bindsym $mod+Ctrl+3 move container to workspace $ws3
bindsym $mod+Ctrl+4 move container to workspace $ws4
bindsym $mod+Ctrl+5 move container to workspace $ws5
bindsym $mod+Ctrl+6 move container to workspace $ws6
bindsym $mod+Ctrl+7 move container to workspace $ws7
bindsym $mod+Ctrl+8 move container to workspace $ws8
```
These also move to the workspace the window is moved to.
```swayconfig config +=
bindsym $mod+Shift+1 move container to workspace $ws1; workspace $ws1
bindsym $mod+Shift+2 move container to workspace $ws2; workspace $ws2
bindsym $mod+Shift+3 move container to workspace $ws3; workspace $ws3
bindsym $mod+Shift+4 move container to workspace $ws4; workspace $ws4
bindsym $mod+Shift+5 move container to workspace $ws5; workspace $ws5
bindsym $mod+Shift+6 move container to workspace $ws6; workspace $ws6
bindsym $mod+Shift+7 move container to workspace $ws7; workspace $ws7
bindsym $mod+Shift+8 move container to workspace $ws8; workspace $ws8
```
This moves the window between the last two visited workspaces.
```swayconfig config +=
bindsym $mod+Shift+b move container to workspace back_and_forth; workspace back_and_forth
```
### Window 

These are keybinds focusing on controlling windows

#### Kill

This kills the focused window.
```swayconfig config +=
bindsym $mod+Shift+q kill
```
#### Borders

These are just keybinds to change window borders.
```swayconfig config +=
# change borders
bindsym $mod+u border none
bindsym $mod+y border pixel 2
bindsym $mod+n border normal
```
### Layout

These keybinds change the current layout.

#### Change Split Orientation

These keybinds change in which direction new windows will be split.

Split horizontally,
```swayconfig config +=
bindsym $mod+h split h
```
vertically,
```swayconfig config +=
bindsym $mod+v split v
```
or toggle.
```swayconfig config +=
bindsym $mod+q split toggle
```
#### Change Layout Type

These change the current layout type.

This changes to a stacking layout where all windows are on top of each other and their title bars are stacked on top of each other.
```swayconfig config +=
bindsym $mod+s layout stacking
```
This changes to a tabbed layout where all windows are on top of each other and their title bars are *next to* each other.
```swayconfig config +=
bindsym $mod+w layout tabbed
```
This changes to the split layout where windows are tiled. Additionally it the split direction of the current layout.
```swayconfig config +=
bindsym $mod+e layout toggle split
```
#### Floating

This toggles the current window between floating and tiled.
```swayconfig config +=
bindsym $mod+Shift+space floating toggle
```
#### Fullscreen

This toggles the current window's fullscreen mode.
```swayconfig config +=
bindsym $mod+f fullscreen toggle
```
### Sound

These keybinds control audio.
```swayconfig config +=
bindsym XF86AudioRaiseVolume exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ +5%
bindsym XF86AudioLowerVolume exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ -5%
bindsym XF86AudioMute        exec --no-startup-id pactl set-sink-mute @DEFAULT_SINK@ toggle
```
These control a running player.
```swayconfig config +=
bindsym XF86AudioPlay exec exec playerctl play-pause
bindsym XF86AudioPause exec exec playerctl play-pause
bindsym XF86AudioNext exec exec playerctl next
bindsym XF86AudioPrev exec exec playerctl previous
bindsym XF86AudioStop exec exec playerctl stop

```
### Screenshots

These commands take screenshots.

This takes a screenshot of the entire currently focused screen.
```swayconfig config +=
bindsym Print exec --no-startup-id ./screenshot.sh
```
This allows selecting an area and taking a screenshot of that.
```swayconfig config +=
bindsym Shift+Print exec --no-startup-id grim -g "$(slurp)" - | wl-copy
```
### Binding Modes

These are keybind modes.

#### Exit Binding Mode

I use Return or Escape to exit binding modes
```swayconfig "exit binding mode"
bindsym Return mode "default"
bindsym Escape mode "default"
```
#### Resize Mode

This mode is for resizing windows.
```swayconfig config +=
bindsym $mod+r mode "resize"
mode "resize" { 
  <<<resize mode>>>
  <<<exit binding mode>>>
}
```
Pressing:
- `left` will shrink the window’s width.
- `right` will grow the window’s width.
- `up` will shrink the window’s height.
- `down` will grow the window’s height.
```swayconfig "resize mode" +=
bindsym j resize shrink width 5 px or 5 ppt
bindsym k resize grow height 5 px or 5 ppt
bindsym l resize shrink height 5 px or 5 ppt
bindsym odiaeresis resize grow width 5 px or 5 ppt

bindsym Left resize shrink width 10 px or 10 ppt
bindsym Down resize grow height 10 px or 10 ppt
bindsym Up resize shrink height 10 px or 10 ppt
bindsym Right resize grow width 10 px or 10 ppt
```
#### Gap Mode

This mode modifies gaps. It allows the choice between inner and outer gaps and then modifies them.
```swayconfig config +=
set $mode_gaps Gaps: (o) outer, (i) inner
set $mode_gaps_outer Outer Gaps: +|-|0 (local), Shift + +|-|0 (global)
set $mode_gaps_inner Inner Gaps: +|-|0 (local), Shift + +|-|0 (global)
bindsym $mod+Shift+g mode "$mode_gaps"
mode "$mode_gaps" { 
  <<<gap mode>>>
  <<<exit binding mode>>>
}
```
`o` allows modifying the outer gaps, `i` the inner gaps.
```swayconfig "gap mode"
bindsym o      mode "$mode_gaps_outer"
bindsym i      mode "$mode_gaps_inner"
```
##### Inner Gap Mode

A mode that modifies inner gaps.
```swayconfig config +=
mode "$mode_gaps_inner" {
  <<<inner gap mode>>>
  <<<exit binding mode>>>
}
```
`+` increases inner gaps of the current window, `-` decreases them. `0` disables them (sets them to 0).
Holding `Shift` makes the changes apply to all windows.
```swayconfig "inner gap mode"
bindsym KP_Add  gaps inner current plus 5
bindsym KP_Subtract  gaps inner current minus 5
bindsym 0       gaps inner current set 0

bindsym Shift+KP_Add  gaps inner all plus 5
bindsym Shift+KP_Subtract gaps inner all minus 5
bindsym Shift+0     gaps inner all set 0
```
##### Outer Gap Mode
```swayconfig config +=
mode "$mode_gaps_outer" {
  <<<outer gap mode>>>
  <<<exit binding mode>>>
}
```
`+` increases outer gaps of the current window, `-` decreases them. `0` disables them (sets them to 0).
Holding `Shift` makes the changes apply to all windows.
```swayconfig "outer gap mode"
bindsym KP_Add  gaps outer current plus 5
bindsym KP_Subtract gaps outer current minus 5
bindsym 0     gaps outer current set 0

bindsym Shift+KP_Add  gaps outer all plus 5
bindsym Shift+KP_Subtract gaps outer all minus 5
bindsym Shift+0     gaps outer all set 0
```
## Autostart

This restarts pulseaudio for audio.
```swayconfig config +=
exec --no-startup-id pkill pulseaudio
exec --no-startup-id pulseaudio --start
```

This enables bluetooth.
```swayconfig config +=
exec --no-startup-id blueman-applet
```

This starts the polkit.
```swayconfig config +=
# Autostart applications
exec --no-startup-id /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1
```
This loads my `.profile` file.
```swayconfig config +=
exec --no-startup-id /home/skadic/.profile
```
This sets my desktop backgrounds.
```swayconfig config +=
exec_always --no-startup-id swaybg -o eDP-1 -m fill -i ~/Pictures/bg/2k/witch.jpg -o HDMI-A-1 -i ~/Pictures/bg/2k/night_bicycle.jpg
```
This starts fcitx5 to enable my input methods.
```swayconfig config +=
exec --no-startup-id fcitx5
```
This starts the emacs daemon in the background in case I use emacs.
```swayconfig config +=
exec --no-startup-id emacs --daemon
```
This loads my eww bar and starts the sway IPC daemons.
```swayconfig config +=
exec --no-startup-id ~/Scripts/eww.sh 
```

Make nwg-drawer open faster
```swayconfig config +=
exec_always --no-startup-id nwg-drawer -r -fm dolphin -nofs -term kitty
```

Start mako, the notification daemon I use.
```swayconfig config +=
exec --no-startup-id mako
```
