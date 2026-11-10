# hyprland-rice

My Hyprland rice on CachyOS, kept here as a backup and so I can reinstall it fast.

| Desktop
|---|---|
| ![](assets/desktop.png) | ![](assets/desktop1.png) | 

<!-- Video: drag an .mp4 (under 10 MB) into the GitHub README editor and it gives you a link. Paste it here. -->

## Screenshots

| Terminal | Rofi launcher | Fastfetch
|---|---|
| ![](assets/terminal.png) | ![](assets/rofi.png) | ![](assets/fastfetch) |

## What's inside

| Folder | Program |
|---|---|
| `hypr` | Hyprland (window manager) |
| `waybar` | Status bar |
| `rofi` | App launcher |
| `kitty` | Terminal |
| `mako` | Notifications |
| `rmpc` | Music player (MPD client) |
| `starship` | Shell prompt |
| `wlogout` | Logout menu |

## Install

```bash
git clone https://github.com/Derilkarf/hyprland-rice.git ~/hyprland-rice
cd ~/hyprland-rice
sudo pacman -S stow hyprland waybar rofi kitty mako starship wlogout mpd rmpc
stow hypr waybar rofi kitty mako rmpc starship wlogout
```

`stow` links each folder into `~/.config`. Back up your existing configs first, or stow will refuse to overwrite them.

## Notes

- Made for Arch-based systems (CachyOS).
- Wallpapers and fonts are not included yet.
