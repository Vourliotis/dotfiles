local xresources = require('beautiful.xresources')
local dpi = xresources.apply_dpi
local colors = xresources.get_current_theme()
local config_path = AWFUL.util.getdir('config') .. '/ui/'

local theme = {}

theme.font = 'JetBrainsMono Nerd Font 10'
theme.icon_theme = nil
theme.systray_icon_spacing = dpi(2)
theme.rounded = dpi(12)
theme.useless_gap = dpi(4)
theme.gap_single_client = true
theme.bar_height = dpi(32)

theme.bg_normal = colors.background
theme.bg_focus = colors.color4
theme.bg_urgent = colors.color1
theme.bg_minimize = colors.background
theme.bg_systray = colors.background

theme.fg_normal = colors.foreground
theme.fg_focus = colors.color4
theme.fg_urgent = colors.color1
theme.fg_minimize = colors.color7

theme.border_width = dpi(2)
theme.border_normal = colors.color0
theme.border_focus = colors.color4
theme.border_marked = colors.color5
theme.border_radius = dpi(12)

theme.taglist_fg = colors.color8
theme.taglist_fg_occupied = colors.color7
theme.taglist_fg_focus = colors.color11
theme.taglist_fg_urgent = colors.color9

theme.taglist_bg = colors.background .. '00'
theme.taglist_bg_urgent = colors.background .. '00'
theme.taglist_bg_focus = colors.background .. '00'

theme.tasklist_bg_normal = colors.color0
theme.tasklist_bg_focus = colors.color4
theme.tasklist_fg_focus = colors.background

theme.titlebar_bg_normal = colors.color0
theme.titlebar_bg_focus = colors.color0
theme.titlebar_fg_focus = colors.color4

theme.menu_height = dpi(24)
theme.menu_width = dpi(200)
theme.menu_context_height = dpi(24)
theme.menu_bg_normal = colors.color0
theme.menu_bg_focus = colors.color4
theme.menu_fg_focus = colors.background
theme.menu_border_color = colors.color4
theme.menu_border_width = dpi(2)

theme.notification_font = 'FiraCode Nerd Font 10'
theme.notification_bg = colors.background .. 'ee'
theme.notification_fg = colors.foreground
theme.notification_border_color = colors.color4
theme.notification_border_width = dpi(2)
theme.notification_border_radius = dpi(12)
theme.notification_margin = dpi(8)
theme.notification_spacing = dpi(8)
theme.notification_padding = dpi(16)
theme.notification_max_width = dpi(600)
theme.notification_max_height = dpi(200)
theme.notification_icon_size = dpi(48)
theme.notification_low_bg = colors.background .. 'ee'
theme.notification_normal_bg = colors.background .. 'ee'
theme.notification_critical_bg = colors.color1 .. 'ee'
theme.notification_progress_bg = colors.color8
theme.notification_progress_fg = colors.color4
theme.notification_progress_border_color = colors.color4
theme.notification_progress_border_width = dpi(0)
theme.notification_progress_height = dpi(8)
theme.notification_progress_margin = dpi(2)

theme.notification_on = config_path .. 'assets/notifications/notification_on.svg'
theme.notification_off = config_path .. 'assets/notifications/notification_off.svg'

theme.normal_tag_format = config_path .. 'assets/tags/ghost.svg'
theme.occupied_tag_format = config_path .. 'assets/tags/ghost.svg'
theme.selected_tag_format = config_path .. 'assets/tags/pacman.svg'

theme.battery_charging = config_path .. 'assets/battery/battery_charging.png'
theme.battery_empty = config_path .. 'assets/battery/battery_empty.png'
theme.battery_quarter = config_path .. 'assets/battery/battery_quarter.png'
theme.battery_half = config_path .. 'assets/battery/battery_half.png'
theme.battery_three_quarters = config_path .. 'assets/battery/battery_three_quarters.png'
theme.battery_full = config_path .. 'assets/battery/battery_full.png'

theme.brightness_low = config_path .. 'assets/brightness/brightness_low.svg'
theme.brightness_medium = config_path .. 'assets/brightness/brightness_medium.svg'
theme.brightness_high = config_path .. 'assets/brightness/brightness_high.svg'

theme.volume_mute = config_path .. 'assets/volume/volume_mute.svg'
theme.volume_low = config_path .. 'assets/volume/volume_low.svg'
theme.volume_medium = config_path .. 'assets/volume/volume_medium.svg'
theme.volume_high = config_path .. 'assets/volume/volume_high.svg'

theme.keyboard = config_path .. 'assets/lang/keyboard.png'

return theme
