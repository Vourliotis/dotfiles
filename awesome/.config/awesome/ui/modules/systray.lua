local dpi = BEAUTIFUL.xresources.apply_dpi

return {
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
