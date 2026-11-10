# ini untuk ngesetting script agar thumbnail gambar discreenshot bisa keliatan

#!/usr/bin/env bash
tmp=/tmp/cliphist-thumbs
rm -rf "$tmp"; mkdir -p "$tmp"
cliphist list | while IFS= read -r line; do
  id="${line%%$'\t'*}"
  if [[ "$line" == *"[[ binary data"* ]]; then
    ext=$(echo "$line" | grep -oE 'png|jpg|jpeg|bmp' | head -n1)
    printf '%s' "$id" | cliphist decode > "$tmp/$id.$ext"
    printf '%s\0icon\x1f%s\n' "$line" "$tmp/$id.$ext"
  else
    printf '%s\n' "$line"
  fi
done | rofi -dmenu -show-icons -theme-str 'element-icon { size: 4em; }' | cliphist decode | wl-copy
