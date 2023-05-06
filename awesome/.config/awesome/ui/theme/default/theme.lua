local xresources = require('beautiful.xresources')
local dpi = xresources.apply_dpi
local colors = xresources.get_current_theme()
local config_path = AWFUL.util.getdir('config') .. '/ui/'

local theme = {}

theme.font = 'FiraCode Nerd Font 10'
theme.wallpaper = config_path .. 'wallpapers/' .. WALLPAPER
theme.icon_theme = nil
theme.systray_icon_spacing = dpi(1)
theme.rounded = dpi(8)
theme.useless_gap = dpi(0)
theme.bar_height = dpi(26)

theme.bg_normal = colors.background
theme.bg_focus = colors.color4
theme.bg_urgent = colors.color4
theme.bg_minimize = colors.background
theme.bg_systray = colors.background

theme.fg_normal = colors.foreground
theme.fg_focus = colors.color4
theme.fg_urgent = colors.color1
theme.fg_minimize = colors.color6

theme.border_width = dpi(1)
theme.border_normal = colors.color0
theme.border_focus = colors.color4
theme.border_marked = colors.color4

theme.taglist_fg = colors.color8
theme.taglist_fg_occupied = colors.foreground
theme.taglist_fg_focus = colors.color11
theme.taglist_fg_urgent = colors.color9

theme.taglist_bg = colors.background
theme.taglist_bg_urgent = colors.background
theme.taglist_bg_focus = colors.background

theme.tasklist_bg_normal = colors.color15
theme.tasklist_bg_focus = colors.color15
theme.tasklist_fg_focus = colors.color2

theme.titlebar_bg_normal = colors.color0
theme.titlebar_bg_focus = colors.color0
theme.titlebar_fg_focus = colors.color0

theme.menu_height = 20
theme.menu_width = 180
theme.menu_context_height = 20
theme.menu_bg_normal = colors.color0
theme.menu_bg_focus = colors.color8
theme.menu_fg_focus = colors.foreground
theme.menu_border_color = colors.color15
theme.menu_border_width = 1

-- Naughty
theme.notification_fg = colors.foreground
theme.notification_bg = colors.background
theme.notification_max_width = 600
theme.notification_max_height = 150

-- Assets
theme.normal_tag_format = config_path .. 'assets/tags/ghost.svg'
theme.occupied_tag_format = config_path .. 'assets/tags/ghost.svg'
theme.selected_tag_format = config_path .. 'assets/tags/pacman.svg'

theme.battery_charging = config_path .. 'assets/battery/battery_charging.png'
theme.battery_empty = config_path .. 'assets/battery/battery_empty.png'
theme.battery_quarter = config_path .. 'assets/battery/battery_quarter.png'
theme.battery_half = config_path .. 'assets/battery/battery_half.png'
theme.battery_three_quarters = config_path .. 'assets/battery/battery_three_quarters.png'
theme.battery_full = config_path .. 'assets/battery/battery_full.png'

theme.keyboard = config_path .. 'assets/lang/keyboard.png'

return theme
