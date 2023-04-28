local keyboard_icon = WIBOX.widget({
  image = GEARS.color.recolor_image(BEAUTIFUL.keyboard, BEAUTIFUL.fg_normal),
  forced_width = 22,
  valign = 'center',
  align = 'center',
  widget = WIBOX.widget.imagebox,
})

local layout = WIBOX.widget({
  widget = WIBOX.container.background,
  fg = BEAUTIFUL.fg_normal,
  {
    widget = AWFUL.widget.keyboardlayout(),
  },
})

return {
  ['icon'] = keyboard_icon,
  ['layout'] = layout,
}
