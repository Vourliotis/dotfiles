local xresources = require('beautiful.xresources')
local dpi = xresources.apply_dpi

local widgets = {
  keyboard = require('ui.modules.keyboard'),
  power = require('ui.modules.power'),
  tags = require('ui.modules.tags'),
  date = require('ui.modules.date'),
  battery = require('ui.modules.battery'),
  brightness = require('ui.modules.brightness'),
  volume = require('ui.modules.volume'),
  notification_toggle = require('ui.modules.notification_toggle'),
}

AWFUL.screen.connect_for_each_screen(function(s)
  AWFUL.spawn.with_shell('nitrogen --restore --set-scaled')
  AWFUL.tag({ '1', '2', '3', '4', '5', '6', '7', '8', '9' }, s, AWFUL.layout.layouts[1])

  s.wibox = AWFUL.wibar({
    position = 'top',
    screen = s,
    height = BEAUTIFUL.bar_height,
    bg = BEAUTIFUL.bg_normal .. 'cc',
  })

  local systray_container = nil
  if s == screen.primary then
    systray_container = {
      layout = WIBOX.container.background,
      bg = BEAUTIFUL.bg_normal,
      shape = function(cr, width, height)
        GEARS.shape.rounded_rect(cr, width, height, BEAUTIFUL.border_radius)
      end,
      {
        layout = WIBOX.container.margin,
        margins = dpi(8),
        WIBOX.widget.systray(),
      },
    }
  end

  s.wibox:setup({
    layout = WIBOX.layout.stack,
    {
      layout = WIBOX.layout.align.horizontal,
      {
        -- Left widgets
        layout = WIBOX.container.place,
        valign = 'center',
        halign = 'center',
        HELPERS.widget_margin(widgets.tags(s), 4),
      },
      nil,
      {
        -- Right widgets
        layout = WIBOX.layout.fixed.horizontal,
        {
          layout = WIBOX.container.background,
          fg = BEAUTIFUL.fg_normal,
          widgets.keyboard.layout,
        },
        HELPERS.horizontal_pad(10),
        HELPERS.widget_margin(widgets.brightness, 6),
        HELPERS.widget_margin(widgets.volume, 6),
        HELPERS.widget_margin(widgets.notification_toggle, 6),
        HELPERS.horizontal_pad(10),
        widgets.battery,
        widgets.battery and HELPERS.horizontal_pad(20) or nil,
        systray_container,
        systray_container and HELPERS.horizontal_pad(20) or nil,
        widgets.power,
        HELPERS.horizontal_pad(5),
      },
    },
    {
      -- Middle widgets
      layout = WIBOX.container.place,
      valign = 'center',
      halign = 'center',
      {
        layout = WIBOX.container.margin,
        {
          layout = WIBOX.container.background,
          bg = BEAUTIFUL.bg_normal .. '00',
          fg = BEAUTIFUL.fg_normal,
          widgets.date,
        },
      },
    },
  })
end)
