local H = {}

H.set_wallpaper = function(screen)
  if BEAUTIFUL.wallpaper then
    local wallpaper = BEAUTIFUL.wallpaper

    if type(wallpaper) == 'function' then
      wallpaper = wallpaper(screen)
    end
    GEARS.wallpaper.maximized(wallpaper, screen, true)
  end
end

H.move_client_bydirection = function(c, direction)
  AWFUL.screen.focus_bydirection(direction, c.screen)

  c:move_to_screen(AWFUL.screen.focused().index)
  client.focus = c
  c:raise()
end

H.client_in_direction = function(c, direction)
  local client_geom = c:geometry()

  for _, target in ipairs(client.get(c.screen)) do
    if target ~= c then
      local target_geom = target:geometry()

      if direction == 'left' and target_geom.x + target_geom.width <= client_geom.x then
        return true
      elseif direction == 'right' and target_geom.x >= client_geom.x + client_geom.width then
        return true
      elseif direction == 'up' and target_geom.y + target_geom.height <= client_geom.y then
        return true
      elseif direction == 'down' and target_geom.y >= client_geom.y + client_geom.height then
        return true
      end
    end
  end

  return false
end

H.move_or_swap_client_bydirection = function(c, direction)
  if H.client_in_direction(c, direction) then
    AWFUL.client.swap.global_bydirection(direction, c)
    client.focus = c
  else
    H.move_client_bydirection(c, direction)
  end
end

H.vertical_pad = function(height)
  return WIBOX.widget({
    forced_height = height,
    layout = WIBOX.layout.fixed.vertical,
  })
end

H.horizontal_pad = function(width)
  return WIBOX.widget({
    forced_width = width,
    layout = WIBOX.layout.fixed.horizontal,
  })
end

H.widget_margin = function(widget, margin)
  margin = margin or 8

  return WIBOX.container.margin(
    WIBOX.widget({ widget, layout = WIBOX.layout.align.horizontal }),
    margin,
    margin,
    margin,
    margin
  )
end

H.rounded_rectangle = function(radius)
  radius = radius or DPI(7)
  return function(cr, w, h)
    return GEARS.shape.rounded_rect(cr, w, h, radius)
  end
end

return H
