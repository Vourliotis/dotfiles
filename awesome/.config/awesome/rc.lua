-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, 'luarocks.loader')

-- Core settings
require('core')

-- UI Settings
require('ui')

-- Autostart applications
AWFUL.spawn.with_shell(GEARS.filesystem.get_configuration_dir() .. '/scripts/autostart.sh')

-- Autostart commands
AWFUL.spawn.with_shell("xset -dpms s off")
AWFUL.spawn.with_shell("numlockx on &")
AWFUL.spawn.with_shell("setxkbmap -layout us,gr -option grp:toggle")
