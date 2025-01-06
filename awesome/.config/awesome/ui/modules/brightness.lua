local function brightness()
  local handle = io.popen('which xbacklight')
  if not handle then
    return WIBOX.widget({})
  end

  local result = handle:read('*a')
  handle:close()
  if #result == 0 then
    return WIBOX.widget({})
  end

  local widget = WIBOX.widget({
    {
      id = 'icon',
      widget = WIBOX.widget.imagebox,
    },
    {
      id = 'slider',
      bar_shape = GEARS.shape.bar,
      bar_height = 4,
      bar_color = BEAUTIFUL.fg_normal,
      handle_color = BEAUTIFUL.fg_focus,
      handle_shape = GEARS.shape.bar,
      handle_width = 8,
      maximum = 100,
      minimum = 10,
      value = 0,
      forced_width = 60,
      forced_height = 1,
      widget = WIBOX.widget.slider,
    },
    layout = WIBOX.layout.fixed.horizontal,
    spacing = 5,
    set_value = function(self, value)
      self.slider.value = value
    end,
    update_style = function(self)
      local brightness_level = self.slider.value

      if brightness_level < 33 then
        self.icon.image = GEARS.color.recolor_image(BEAUTIFUL.brightness_low, BEAUTIFUL.fg_normal)
      elseif brightness_level < 66 then
        self.icon.image = GEARS.color.recolor_image(BEAUTIFUL.brightness_medium, BEAUTIFUL.fg_normal)
      else
        self.icon.image = GEARS.color.recolor_image(BEAUTIFUL.brightness_high, BEAUTIFUL.fg_normal)
      end
    end,
  })

  AWFUL.spawn.easy_async('xbacklight -get', function(stdout)
    widget:set_value(tonumber(stdout:match('([^%.]+)')))
  end)

  widget.slider:connect_signal('button::press', function(_, _, _, button)
    if button == 4 then
      widget:set_value(widget.slider.value + 10)
    elseif button == 5 then
      widget:set_value(widget.slider.value - 10)
    end
  end)

  widget.slider:connect_signal('property::value', function()
    AWFUL.spawn('xbacklight -set ' .. widget.slider.value)
    widget:update_style()
  end)

  return widget
end

return brightness()
