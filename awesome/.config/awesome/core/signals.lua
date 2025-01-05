-- Handle the fullscreen signal properly
client.connect_signal('property::fullscreen', function(c)
  c.floating = false

  if c.fullscreen then
    GEARS.timer.delayed_call(function()
      if c.valid then
        c:geometry(c.screen.geometry)
      end
    end)
  end
end)

-- Signal function to execute when a new client appears
client.connect_signal('manage', function(c)
  if not awesome.startup then
    AWFUL.client.setslave(c)
  end

  if awesome.startup and not c.size_hints.user_position and not c.size_hints.program_position then
    -- Prevent clients from being unreachable after screen count changes
    AWFUL.placement.no_offscreen(c)
  end

  if c.floating or AWFUL.layout.get(c.screen) == AWFUL.layout.suit.floating then
    local screen_geometry = c.screen.workarea

    c:geometry({
      x = screen_geometry.x + (screen_geometry.width - c.width) / 2,
      y = screen_geometry.y + (screen_geometry.height - c.height) / 2,
    })
  end
end)

-- Add a titlebar if titlebars_enabled is set to true in the rules
client.connect_signal('request::titlebars', function(c)
  -- buttons for the titlebar
  local buttons = GEARS.table.join(
    AWFUL.button({}, 1, function()
      c:emit_signal('request::activate', 'titlebar', { raise = true })
      AWFUL.mouse.client.move(c)
    end),
    AWFUL.button({}, 3, function()
      c:emit_signal('request::activate', 'titlebar', { raise = true })
      AWFUL.mouse.client.resize(c)
    end)
  )

  AWFUL.titlebar(c):setup({
    {
      -- Left
      AWFUL.titlebar.widget.iconwidget(c),
      buttons = buttons,
      layout = WIBOX.layout.fixed.horizontal,
    },
    {
      -- Middle
      {
        -- Title
        align = 'center',
        widget = AWFUL.titlebar.widget.titlewidget(c),
      },
      buttons = buttons,
      layout = WIBOX.layout.flex.horizontal,
    },
    {
      -- Right
      AWFUL.titlebar.widget.floatingbutton(c),
      AWFUL.titlebar.widget.maximizedbutton(c),
      AWFUL.titlebar.widget.stickybutton(c),
      AWFUL.titlebar.widget.ontopbutton(c),
      AWFUL.titlebar.widget.closebutton(c),
      layout = WIBOX.layout.fixed.horizontal(),
    },
    layout = WIBOX.layout.align.horizontal,
  })
end)

-- Enable sloppy focus, so that focus follows mouse
client.connect_signal('mouse::enter', function(c)
  c:emit_signal('request::activate', 'mouse_enter', { raise = false })
end)

client.connect_signal('focus', function(c)
  c.border_color = BEAUTIFUL.border_focus
end)

client.connect_signal('unfocus', function(c)
  c.border_color = BEAUTIFUL.border_normal
end)

client.connect_signal('property::floating', function(c)
  if c.floating then
    c.ontop = true
  else
    c.ontop = false
  end
end)

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal('property::geometry', function()
  AWFUL.spawn.with_shell('nitrogen --restore --set-scaled')
end)

client.connect_signal('manage', function(c)
  c.shape = function(cr, w, h)
    GEARS.shape.rounded_rect(cr, w, h, BEAUTIFUL.border_radius)
  end
end)
