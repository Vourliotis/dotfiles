-- Hyprland compositor configuration (Lua format, Hyprland 0.55+).

-- Monitors
hl.monitor({
    output = "DP-1",
    mode = "2560x1440@480",
    position = "1080x200",
    scale = 1,
})

hl.monitor({
    output = "HDMI-A-1",
    mode = "1920x1080@240",
    position = "0x0",
    scale = 1,
    transform = 1,
})

-- Programs
local terminal = "ghostty"
local file_manager = "thunar"
local menu = "fuzzel"
local browser = "google-chrome-stable"

-- Autostart
hl.on("hyprland.start", function()
    hl.exec_cmd("waybar")
    hl.exec_cmd("awww-daemon")
    hl.exec_cmd("sleep 1 && awww img ~/Pictures/Wallpapers/Oranges.png")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("systemctl --user start hyprpolkitagent")
    hl.exec_cmd("1password --silent")
    hl.exec_cmd("steam -silent")
    hl.exec_cmd("vesktop --start-minimized")
    hl.dispatch(hl.dsp.focus({ workspace = 1 }))
    hl.exec_cmd("nm-applet --indicator")
end)

-- Environment
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")

-- General, decoration, layout, groups, cursor, and input
hl.config({
    general = {
        gaps_in = 3,
        gaps_out = 5,
        border_size = 1,
        col = {
            active_border = "rgba(c8c8c8aa)",
            inactive_border = "rgba(1a1a1aaa)",
        },
        layout = "dwindle",
    },

    decoration = {
        rounding = 0,
        shadow = {
            enabled = false,
        },
        blur = {
            enabled = true,
            size = 3,
            passes = 1,
            vibrancy = 0.1696,
        },
    },

    animations = {
        enabled = true,
    },

    dwindle = {
        preserve_split = true,
        force_split = 2,
    },

    group = {
        col = {
            border_active = "rgba(c8c8c8aa)",
            border_inactive = "rgba(1a1a1aaa)",
            border_locked_active = "rgba(c8c8c8aa)",
            border_locked_inactive = "rgba(1a1a1aaa)",
        },
        groupbar = {
            enabled = true,
            render_titles = true,
            scrolling = true,
            gradients = true,
            font_size = 11,
            height = 20,
            indicator_height = 0,
            rounding = 0,
            col = {
                active = "rgba(1a1a1aff)",
                inactive = "rgba(2a2a2aff)",
                locked_active = "rgba(1a2230ff)",
                locked_inactive = "rgba(28323fff)",
            },
            text_color = "rgba(ffffffff)",
            text_color_inactive = "rgba(c8c8c8ff)",
            text_color_locked_active = "rgba(ffffffff)",
            text_color_locked_inactive = "rgba(c8c8c8ff)",
            font_weight_active = "bold",
            font_weight_inactive = "bold",
        },
    },

    cursor = {
        no_hardware_cursors = true,
        default_monitor = "DP-1",
    },

    input = {
        kb_layout = "us,gr",
        kb_options = "grp:toggle",
        follow_mouse = 1,
        sensitivity = 1.0,
        force_no_accel = true,
        repeat_delay = 250,
        repeat_rate = 45,
        scroll_method = "on_button_down",
    },
})

-- Animations
hl.curve("easeOutQuint", {
    type = "bezier",
    points = { { 0.23, 1 }, { 0.32, 1 } },
})
hl.curve("easeInOutCubic", {
    type = "bezier",
    points = { { 0.65, 0.05 }, { 0.36, 1 } },
})
hl.curve("linear", {
    type = "bezier",
    points = { { 0, 0 }, { 1, 1 } },
})
hl.curve("almostLinear", {
    type = "bezier",
    points = { { 0.5, 0.5 }, { 0.75, 1 } },
})
hl.curve("quick", {
    type = "bezier",
    points = { { 0.15, 0 }, { 0.1, 1 } },
})

hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows", enabled = true, speed = 4.79, bezier = "easeOutQuint" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.1, bezier = "easeOutQuint", style = "popin 87%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.49, bezier = "linear", style = "popin 87%" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "zoomFactor", enabled = true, speed = 7, bezier = "quick" })

-- Keybindings
local main_mod = "SUPER"

hl.bind(main_mod .. " + RETURN", hl.dsp.exec_cmd(terminal))
hl.bind(main_mod .. " + B", hl.dsp.exec_cmd(browser))
hl.bind(main_mod .. " + Q", hl.dsp.window.close())
hl.bind(main_mod .. " + ESCAPE", hl.dsp.exec_cmd("~/.config/hypr/scripts/power-menu.sh"))
hl.bind(main_mod .. " + SHIFT + Escape", hl.dsp.exec_cmd("pidof hyprlock || hyprlock"))
hl.bind(main_mod .. " + E", hl.dsp.exec_cmd(file_manager))
hl.bind(main_mod .. " + N", hl.dsp.exec_cmd(file_manager))
hl.bind(main_mod .. " + F", hl.dsp.window.float())
hl.bind(main_mod .. " + R", hl.dsp.exec_cmd(menu))
hl.bind(main_mod .. " + P", hl.dsp.window.pseudo())

-- Focus
hl.bind(main_mod .. " + h", hl.dsp.focus({ direction = "l" }))
hl.bind(main_mod .. " + l", hl.dsp.focus({ direction = "r" }))
hl.bind(main_mod .. " + k", hl.dsp.focus({ direction = "u" }))
hl.bind(main_mod .. " + j", hl.dsp.focus({ direction = "d" }))

-- Workspaces
for i = 1, 10 do
    local key = i % 10
    hl.bind(main_mod .. " + " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind(main_mod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i, follow = false }))
end

-- Toggle workspace between monitors
hl.bind(main_mod .. " + SHIFT + RETURN", hl.dsp.exec_cmd("~/.config/hypr/scripts/toggle-monitor.sh"))

-- Move window
hl.bind(main_mod .. " + SHIFT + H", hl.dsp.window.move({ direction = "l" }))
hl.bind(main_mod .. " + SHIFT + L", hl.dsp.window.move({ direction = "r" }))
hl.bind(main_mod .. " + SHIFT + K", hl.dsp.window.move({ direction = "u" }))
hl.bind(main_mod .. " + SHIFT + J", hl.dsp.window.move({ direction = "d" }))

-- Resize window
hl.bind(main_mod .. " + CONTROL + h", hl.dsp.window.resize({ x = -50, y = 0, relative = true }))
hl.bind(main_mod .. " + CONTROL + l", hl.dsp.window.resize({ x = 50, y = 0, relative = true }))
hl.bind(main_mod .. " + CONTROL + k", hl.dsp.window.resize({ x = 0, y = -50, relative = true }))
hl.bind(main_mod .. " + CONTROL + j", hl.dsp.window.resize({ x = 0, y = 50, relative = true }))

-- Groups
hl.bind(main_mod .. " + G", hl.dsp.group.toggle())
hl.bind(main_mod .. " + TAB", hl.dsp.group.next())
hl.bind(main_mod .. " + SHIFT + TAB", hl.dsp.group.prev())
hl.bind(main_mod .. " + SHIFT + G", hl.dsp.window.move({ out_of_group = true }))
hl.bind(main_mod .. " + ALT + h", hl.dsp.window.move({ into_group = "l" }))
hl.bind(main_mod .. " + ALT + l", hl.dsp.window.move({ into_group = "r" }))
hl.bind(main_mod .. " + ALT + k", hl.dsp.window.move({ into_group = "u" }))
hl.bind(main_mod .. " + ALT + j", hl.dsp.window.move({ into_group = "d" }))
hl.bind(main_mod .. " + semicolon", hl.dsp.group.lock_active())

-- Special workspace
hl.bind(main_mod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(main_mod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic", follow = true }))

-- Mouse bindings
hl.bind(main_mod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(main_mod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(main_mod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(main_mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Media keys
local repeat_when_locked = { locked = true, repeating = true }
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), repeat_when_locked)
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), repeat_when_locked)
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), repeat_when_locked)
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), repeat_when_locked)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), repeat_when_locked)
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), repeat_when_locked)

local when_locked = { locked = true }
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), when_locked)
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), when_locked)
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), when_locked)
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), when_locked)

-- Screenshot
hl.bind("Print", hl.dsp.exec_cmd("grimblast --notify copysave area"))

-- Workspace assignments
for i = 1, 10 do
    hl.workspace_rule({
        workspace = tostring(i),
        monitor = "DP-1",
        default = i == 1,
    })
end

-- Window rules (order matters)
hl.window_rule({
    name = "suppress-maximize-events",
    match = { class = ".*" },
    suppress_event = "maximize",
})

hl.window_rule({
    name = "fix-xwayland-drags",
    match = {
        class = "^$",
        title = "^$",
        xwayland = true,
        float = true,
        fullscreen = false,
        pin = false,
    },
    no_focus = true,
})

hl.window_rule({
    name = "hyprland-run",
    match = { class = "hyprland-run" },
    move = "20 monitor_h-120",
    float = true,
})

hl.window_rule({
    name = "thunar-float",
    match = { class = "thunar" },
    float = true,
})

hl.window_rule({
    name = "pavucontrol-float",
    match = { class = "org.pulseaudio.pavucontrol" },
    float = true,
})

hl.window_rule({
    name = "steam-friends-float",
    match = { class = "steam", title = "Friends List" },
    float = true,
})

hl.window_rule({
    name = "1password-float",
    match = { class = "1password" },
    float = true,
})

hl.window_rule({
    name = "zathura-group",
    match = { class = "org.pwmt.zathura" },
    group = "set",
})
