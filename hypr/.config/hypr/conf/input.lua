-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/ for more
hl.config({
    input = {
        kb_layout  = "us",
        kb_variant = "",
        kb_model   = "",
        kb_options = "",
        kb_rules   = "",

        follow_mouse = 1,
        sensitivity = 0,

        touchpad = {
            natural_scroll = false,
            tap_to_click = true, ---- Mengaktifkan fitur tap pada touchpad buat pengganti misal mouseku ilang
        },
    },
})

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace"
})

hl.device({
    name        = "epic-mouse-v1",
    sensitivity = -0.5,
})

-- Hardware Binds 
hl.bind("switch:on:Lid Switch", hl.dsp.exec_cmd("systemctl suspend"), { locked = true}) -- ini agar laptop otomatis masuk ke mode sleep pas layarnya ditutup
