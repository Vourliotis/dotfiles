local widgets = {
  keyboard = require('ui.modules.keyboard'),
  power = require('ui.modules.power'),
  tags = require('ui.modules.tags'),
  date = require('ui.modules.date'),
  battery = require('ui.modules.battery'),
  brightness = require('ui.modules.brightness'),
  volume = require('ui.modules.volume'),
}

AWFUL.screen.connect_for_each_screen(function(s)
  -- Set wallpaper when connecting a screen
  AWFUL.spawn.with_shell('nitrogen --restore --set-scaled')

  -- Each screen has its own tag table.
  AWFUL.tag({ '1', '2', '3', '4', '5', '6', '7', '8', '9' }, s, AWFUL.layout.layouts[1])

  -- Create the wibox
  s.wibox = AWFUL.wibar({ position = 'top', screen = s, height = BEAUTIFUL.bar_height })

  -- Add widgets to the wibox
  s.wibox:setup({
    layout = WIBOX.layout.stack,
    {
      layout = WIBOX.layout.align.horizontal,
      {
        -- Left widgets
        layout = WIBOX.container.place,
        valign = 'center',
        halign = 'center',
        HELPERS.widget_margin(widgets.tags(s), 2),
      },
      nil,
      {
        -- Right widgets
        layout = WIBOX.layout.fixed.horizontal,
        HELPERS.widget_margin(widgets.volume, 4),
        HELPERS.widget_margin(widgets.brightness, 4),
        HELPERS.horizontal_pad(5),
        HELPERS.widget_margin(widgets.battery, 1),
        HELPERS.horizontal_pad(5),
        HELPERS.widget_margin(widgets.keyboard.layout, 1),
        HELPERS.widget_margin(WIBOX.widget.systray(), 3),
        HELPERS.horizontal_pad(5),
        widgets.power,
      },
    },
    {
      -- Middle widgets
      layout = WIBOX.container.place,
      valign = 'center',
      halign = 'center',
      WIBOX.container.background(widgets.date),
    },
  })
end)
