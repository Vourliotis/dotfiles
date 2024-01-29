local function volume()
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
      forced_width = 60,
      forced_height = 1,
      widget = WIBOX.widget.slider,
    },
    layout = WIBOX.layout.fixed.horizontal,
    spacing = 5,
    set_value = function(self, value)
      self.slider.value = value
      self:update_style()
    end,
    update_style = function(self)
      if self.muted == true then
        self.icon.image = GEARS.color.recolor_image(BEAUTIFUL.volume_mute, BEAUTIFUL.fg_normal)
        self.slider.handle_color = BEAUTIFUL.taglist_fg_urgent
      else
        self.slider.handle_color = BEAUTIFUL.fg_focus

        if self.slider.value < 33 then
          self.icon.image = GEARS.color.recolor_image(BEAUTIFUL.volume_low, BEAUTIFUL.fg_normal)
        elseif self.slider.value < 66 then
          self.icon.image = GEARS.color.recolor_image(BEAUTIFUL.volume_medium, BEAUTIFUL.fg_normal)
        else
          self.icon.image = GEARS.color.recolor_image(BEAUTIFUL.volume_high, BEAUTIFUL.fg_normal)
        end
      end
    end,
    set_widget_attributes = function(self)
      local mute_command = "pactl get-sink-mute @DEFAULT_SINK@ | awk '{print $2}' | tr -d '\n'"
      local volume_command = "pactl get-sink-volume @DEFAULT_SINK@ | awk '{print $5}' | tr -d '%'"

      AWFUL.spawn.easy_async('sh -c "' .. mute_command .. '"', function(stdout)
        self.muted = (stdout:match("^%s*(.-)%s*$") == 'yes')
      end)

      AWFUL.spawn.easy_async('sh -c "' .. volume_command .. '"', function(stdout)
        self:set_value(tonumber(stdout))
      end)
    end,
  })

  widget.slider:connect_signal('button::press', function(_, _, _, button)
    if button == 2 then
      AWFUL.spawn('pactl set-sink-mute @DEFAULT_SINK@ toggle')
      widget:set_widget_attributes()
    elseif button == 3 then
      AWFUL.spawn('pavucontrol')
    elseif button == 4 then
      widget:set_value(widget.slider.value + 10)
    elseif button == 5 then
      widget:set_value(widget.slider.value - 10)
    end
  end)

  widget.slider:connect_signal('property::value', function()
    AWFUL.spawn('pactl set-sink-volume @DEFAULT_SINK@ ' .. widget.slider.value .. '%')
    widget:update_style()
  end)

  GEARS.timer({
    timeout = 3,
    call_now = true,
    autostart = true,
    callback = function()
      widget:set_widget_attributes()
    end,
  })

  return widget
end

return volume()
