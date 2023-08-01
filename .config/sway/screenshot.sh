dim=$(swaymsg -t get_outputs | jq -rM '.[] | select(.focused == true) | .rect | "\(.x),\(.y) \(.width)x\(.height)"')
grim -g "${dim}" - | wl-copy
