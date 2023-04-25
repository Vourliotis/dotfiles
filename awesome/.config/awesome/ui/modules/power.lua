local power_button = WIBOX.widget({
  {
    {
      text = '⏻',
      widget = WIBOX.widget.textbox,
      font = BEAUTIFUL.font .. ' 19',
    },
    top = 0,
    bottom = 0,
    left = 0,
    right = 0,
    widget = WIBOX.container.margin,
  },
  fg = BEAUTIFUL.fg_normal,
  bg = BEAUTIFUL.bg_normal,
  widget = WIBOX.container.background,
})

power_button:connect_signal('button::press', function(_, _, _, button)
  if button == 1 then
    AWFUL.spawn.with_shell('~/.config/rofi/scripts/powermenu.sh')
  end
end)

return power_button
