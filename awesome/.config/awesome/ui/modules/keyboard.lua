local keyboard_icon = WIBOX.widget({
  image = GEARS.color.recolor_image(BEAUTIFUL.keyboard, BEAUTIFUL.fg_normal),
  forced_width = 22,
  valign = 'center',
  align = 'center',
  widget = WIBOX.widget.imagebox,
})

local keyboard_layout = AWFUL.widget.keyboardlayout()
local original_set_text = keyboard_layout.widget.set_text

keyboard_layout.widget.set_text = function(widget, text)
  if text then
    widget:set_markup('<b>' .. string.upper(text) .. '</b>')
  end
end

local layout = WIBOX.widget({
  widget = WIBOX.container.background,
  fg = BEAUTIFUL.fg_normal,
  {
    widget = keyboard_layout,
  },
})

return {
  ['icon'] = keyboard_icon,
  ['layout'] = layout,
}
