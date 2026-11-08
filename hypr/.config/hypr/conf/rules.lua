-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/
hl.window_rule({
    name  = "suppress-maximize-events",
    match = { class = ".*" },
    suppress_event = "maximize",
})

hl.window_rule({
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },
    no_focus = true,
})

hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },
    move  = "20 monitor_h-120",
    float = true,
})

-- Smart gaps: tanpa gaps kalau cuma 1 window / fullscreen
hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
hl.workspace_rule({ workspace = "f[1]",   gaps_out = 0, gaps_in = 0 })

hl.window_rule({
    name  = "no-gaps-wtv1",
    match = { float = false, workspace = "w[tv1]" },
    border_size = 3,
    rounding    = 10,
})

hl.window_rule({
    name  = "no-gaps-f1",
    match = { float = false, workspace = "f[1]" },
    border_size = 3,
    rounding    = 10,
})

-- rmpc agar muncul --
hl.window_rule({
  name = "rmpc-popup",
  match = {class = "rmpc-popup"},
  float = true,
  size = "600 350",
  move = "10 50",
})

-- memastikan pop-up password admin (KDE Polkit) gk nyempil di layout tiling
hl.window_rule({
  name = "polkit-kde-float",
  match = { class = "polkit-kde-authentication-agent-1"},
  float = true,
  center = true,
})

-- Nyegah menu dropdown / sub menu Steam merusak layout tilling
hl.window_rule({
  name = "steam-menus",
  match = { class = "steam", title = "^$"},
  float = true,
  no_focus = true,
})

-- bikin menu Friendlist di Steam ngambang
hl.window_rule({
  name = "steam-friends",
  match = { class = "steam", title = "Friend List"},
  float = true,
  size = "400 600",
})
