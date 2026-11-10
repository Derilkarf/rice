#!/usr/bin/env bash
# ini adalah script agar tema bisa sesuai mengikuti wallpaper

img="$(realpath "$1")"
wal -n -i "$img" || exit 1
mapfile -t c < ~/.cache/wal/colors
h() { echo "${1#\#}"; }

# wallpaper
sed -i "s|^\s*path = .*|    path = $img|" ~/.config/hypr/hyprpaper.conf
pkill hyprpaper; setsid -f hyprpaper >/dev/null 2>&1

# window borders
sed -i -E "s|^(\s*)active_border\s*=.*|\1active_border   = { colors = {\"rgba($(h ${c[4]})ee)\", \"rgba($(h ${c[5]})ee)\"}, angle = 45 },|" ~/.config/hypr/conf/lookandfeel.lua

sed -i -E "s|^(\s*)inactive_border\s*=.*|\1inactive_border = \"rgba($(h ${c[0]})88)\",|" ~/.config/hypr/conf/lookandfeel.lua
hyprctl reload >/dev/null 2>&1

# cava gradient
i=1
for n in 1 4 5 6 7; do
  sed -i "s|^gradient_color_$i = .*|gradient_color_$i = '${c[$n]}'|" ~/.config/cava/config
  i=$((i+1))
done
pkill -USR2 cava

# waybar and kitty
pkill waybar; setsid -f waybar >/dev/null 2>&1
pkill -USR1 kitty

cp ~/.cache/wal/mako.config ~/.config/mako/config
makoctl reload 2>/dev/null

cp ~/.cache/wal/hyprlock.conf ~/.config/hypr/hyprlock.conf
