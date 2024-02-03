-- Standard awesome library
GEARS = require('gears')
AWFUL = require('awful')

-- Widget and layout library
WIBOX = require('wibox')

-- Notification library
NAUGHTY = require('naughty')

-- Theme name
THEME = 'default'

-- Theme handling library
BEAUTIFUL = require('beautiful')
DPI = BEAUTIFUL.xresources.apply_dpi

-- Themes define colours, icons, font and wallpapers.
BEAUTIFUL.init(GEARS.filesystem.get_configuration_dir() .. 'ui/theme/' .. THEME .. '/theme.lua')

-- Helper functions
HELPERS = require('core.helpers')
