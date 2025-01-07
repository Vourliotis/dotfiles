local dpi = BEAUTIFUL.xresources.apply_dpi

local notification_toggle = {}
local notifications_enabled = true

notification_toggle.widget = WIBOX.widget({
  widget = WIBOX.widget.imagebox,
  image = GEARS.color.recolor_image(BEAUTIFUL.notification_on, BEAUTIFUL.fg_normal),
  resize = true,
  forced_width = dpi(24),
})

local function toggle_notifications()
  notifications_enabled = not notifications_enabled

  if notifications_enabled then
    notification_toggle.widget.image = GEARS.color.recolor_image(BEAUTIFUL.notification_on, BEAUTIFUL.fg_normal)
    NAUGHTY.resume()
  else
    notification_toggle.widget.image = GEARS.color.recolor_image(BEAUTIFUL.notification_off, BEAUTIFUL.fg_normal)
    NAUGHTY.suspend()
  end
end

notification_toggle.widget:buttons(GEARS.table.join(AWFUL.button({}, 1, function()
  toggle_notifications()
end)))

return notification_toggle.widget
