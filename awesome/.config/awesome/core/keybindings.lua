MOD_KEY = 'Mod4'
ALT = 'Mod1'

-- Mouse bindings
-- root.buttons(GEARS.table.join(AWFUL.button({}, 4, AWFUL.tag.viewnext), AWFUL.button({}, 5, AWFUL.tag.viewprev)))

-- Key bindings
GLOBAL_KEYS = GEARS.table.join(
  -- Show help
  AWFUL.key({ MOD_KEY, ALT }, 's', function()
    local hotkeys_popup = require('awful.hotkeys_popup')

    hotkeys_popup.show_help()
  end, { description = 'show help', group = 'awesome' }),

  -- Core keybindings
  AWFUL.key({ MOD_KEY, ALT }, 'r', awesome.restart, { description = 'reload awesome', group = 'awesome' }),
  AWFUL.key({ MOD_KEY, ALT }, 'q', awesome.quit, { description = 'quit awesome', group = 'awesome' }),

  -- Program keybindings
  -- Terminal
  AWFUL.key({ MOD_KEY }, 'Return', function()
    AWFUL.spawn('kitty')
  end, { description = 'terminal', group = 'launcher' }),

  -- Powermenu
  AWFUL.key({ MOD_KEY }, 'Escape', function()
    AWFUL.spawn.with_shell('~/.config/rofi/scripts/powermenu.sh')
  end, { description = 'powermenu', group = 'launcher' }),

  -- Run prompt
  AWFUL.key({ MOD_KEY }, 'r', function()
    AWFUL.spawn.with_shell('rofi -modi drun -show run -terminal kitty')
  end, { description = 'run prompt', group = 'launcher' }),

  -- Run Chrome
  AWFUL.key({ MOD_KEY }, 'b', function()
    AWFUL.spawn.with_shell('google-chrome')
  end, { description = 'run chrome', group = 'launcher' }),

  -- Run Slack
  AWFUL.key({ MOD_KEY }, 's', function()
    AWFUL.spawn.with_shell('slack')
  end, { description = 'run slack', group = 'launcher' }),

  -- Run Enpass
  AWFUL.key({ MOD_KEY }, 'p', function()
    AWFUL.spawn.with_shell('enpass')
  end, { description = 'run enpass', group = 'launcher' }),

  -- Run Nautilus
  AWFUL.key({ MOD_KEY }, 'n', function()
    AWFUL.spawn.with_shell('nautilus')
  end, { description = 'run nautilus', group = 'launcher' }),

  -- Print Screen
  AWFUL.key({}, 'Print', function()
    AWFUL.spawn.with_shell('~/.config/bspwm/scripts/screenshot.sh')
  end, { description = 'print screen', group = 'awesome' }),

  -- Resize
  AWFUL.key({ MOD_KEY, 'Control' }, 'l', function()
    AWFUL.tag.incmwfact(0.05)
  end, { description = 'increase master width factor', group = 'layout' }),
  AWFUL.key({ MOD_KEY, 'Control' }, 'h', function()
    AWFUL.tag.incmwfact(-0.05)
  end, { description = 'decrease master width factor', group = 'layout' }),
  AWFUL.key({ MOD_KEY, 'Control' }, 'j', function()
    AWFUL.client.incwfact(0.05)
  end, { description = 'change master height factor', group = 'layout' }),
  AWFUL.key({ MOD_KEY, 'Control' }, 'k', function()
    AWFUL.client.incwfact(-0.05)
  end, { description = 'change master height factor', group = 'layout' }),

  -- Master clients
  AWFUL.key({ MOD_KEY, 'Control' }, 'n', function()
    AWFUL.tag.incnmaster(1, nil, true)
  end, { description = 'increase the number of master clients', group = 'layout' }),
  AWFUL.key({ MOD_KEY, 'Control' }, 'p', function()
    AWFUL.tag.incnmaster(-1, nil, true)
  end, { description = 'decrease the number of master clients', group = 'layout' }),

  -- Layout
  AWFUL.key({ MOD_KEY }, 'space', function()
    AWFUL.layout.inc(1)
  end, { description = 'next layout', group = 'layout' }),

  -- Screen/client focus
  AWFUL.key({ MOD_KEY }, 'h', function()
    if #AWFUL.screen.focused().selected_tag:clients() == 0 then
      AWFUL.screen.focus_bydirection('left')
    else
      AWFUL.client.focus.global_bydirection('left')
    end
    if client.focus then
      client.focus:raise()
    end
  end, { description = 'move focus by direction', group = 'client' }),
  AWFUL.key({ MOD_KEY }, 'j', function()
    if #AWFUL.screen.focused().selected_tag:clients() == 0 then
      AWFUL.screen.focus_bydirection('down')
    else
      AWFUL.client.focus.global_bydirection('down')
    end
    if client.focus then
      client.focus:raise()
    end
  end, { description = 'move focus by direction', group = 'client' }),
  AWFUL.key({ MOD_KEY }, 'k', function()
    if #AWFUL.screen.focused().selected_tag:clients() == 0 then
      AWFUL.screen.focus_bydirection('up')
    else
      AWFUL.client.focus.global_bydirection('up')
    end
    if client.focus then
      client.focus:raise()
    end
  end, { description = 'move focus by direction', group = 'client' }),
  AWFUL.key({ MOD_KEY }, 'l', function()
    if #AWFUL.screen.focused().selected_tag:clients() == 0 then
      AWFUL.screen.focus_bydirection('right')
    else
      AWFUL.client.focus.global_bydirection('right')
    end
    if client.focus then
      client.focus:raise()
    end
  end, { description = 'move focus by direction', group = 'client' })
)

CLIENT_KEYS = GEARS.table.join(
  -- Fullscreen
  AWFUL.key({ MOD_KEY }, 'f', function(c)
    c.fullscreen = not c.fullscreen
    c:raise()
  end, { description = 'toggle fullscreen', group = 'client' }),

  -- Close client
  AWFUL.key({ MOD_KEY }, 'q', function(c)
    c:kill()
  end, { description = 'close', group = 'client' }),

  -- Toggle floating
  AWFUL.key(
    { MOD_KEY, 'Control' },
    'space',
    AWFUL.client.floating.toggle,
    { description = 'toggle floating', group = 'client' }
  ),

  -- Move to master
  AWFUL.key({ MOD_KEY, 'Control' }, 'Return', function(c)
    c:swap(AWFUL.client.getmaster())
  end, { description = 'move to master', group = 'client' }),

  -- Swap clients
  AWFUL.key({ MOD_KEY, ALT }, 'h', function()
    AWFUL.client.swap.global_bydirection('left')
    if client.focus then
      client.focus:raise()
    end
  end, { description = 'swap client by direction', group = 'client' }),
  AWFUL.key({ MOD_KEY, ALT }, 'j', function()
    AWFUL.client.swap.global_bydirection('down')
    if client.focus then
      client.focus:raise()
    end
  end, { description = 'swap client by direction', group = 'client' }),
  AWFUL.key({ MOD_KEY, ALT }, 'k', function()
    AWFUL.client.swap.global_bydirection('up')
    if client.focus then
      client.focus:raise()
    end
  end, { description = 'swap client by direction', group = 'client' }),
  AWFUL.key({ MOD_KEY, ALT }, 'l', function()
    AWFUL.client.swap.global_bydirection('right')
    if client.focus then
      client.focus:raise()
    end
  end, { description = 'swap client by direction', group = 'client' }),

  -- Move by direction
  AWFUL.key({ MOD_KEY, 'Shift' }, 'h', function(c)
    HELPERS.move_or_swap_client_bydirection(c, 'left')
  end, { description = 'move or swap client by direction', group = 'client' }),
  AWFUL.key({ MOD_KEY, 'Shift' }, 'j', function(c)
    HELPERS.move_or_swap_client_bydirection(c, 'down')
  end, { description = 'move or swap client by direction', group = 'client' }),
  AWFUL.key({ MOD_KEY, 'Shift' }, 'k', function(c)
    HELPERS.move_or_swap_client_bydirection(c, 'up')
  end, { description = 'move or swap client by direction', group = 'client' }),
  AWFUL.key({ MOD_KEY, 'Shift' }, 'l', function(c)
    HELPERS.move_or_swap_client_bydirection(c, 'right')
  end, { description = 'move or swap client by direction', group = 'client' })
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
  GLOBAL_KEYS = GEARS.table.join(
    GLOBAL_KEYS,

    -- View tag only
    AWFUL.key({ MOD_KEY }, '#' .. i + 9, function()
      local screen = AWFUL.screen.focused()
      local tag = screen.tags[i]
      if tag then
        tag:view_only()
      end
    end, { description = 'view tag #' .. i, group = 'tag' }),

    -- Toggle tag display
    AWFUL.key({ MOD_KEY, 'Control' }, '#' .. i + 9, function()
      local screen = AWFUL.screen.focused()
      local tag = screen.tags[i]
      if tag then
        AWFUL.tag.viewtoggle(tag)
      end
    end, { description = 'toggle tag #' .. i, group = 'tag' }),

    -- Move client to tag
    AWFUL.key({ MOD_KEY, 'Shift' }, '#' .. i + 9, function()
      if client.focus then
        local tag = client.focus.screen.tags[i]
        if tag then
          client.focus:move_to_tag(tag)
        end
      end
    end, { description = 'move focused client to tag #' .. i, group = 'tag' }),

    -- Toggle tag on focused client
    AWFUL.key({ MOD_KEY, 'Control', 'Shift' }, '#' .. i + 9, function()
      if client.focus then
        local tag = client.focus.screen.tags[i]
        if tag then
          client.focus:toggle_tag(tag)
        end
      end
    end, { description = 'toggle focused client on tag #' .. i, group = 'tag' })
  )
end

CLIENT_BUTTONS = GEARS.table.join(
  AWFUL.button({}, 1, function(c)
    c:emit_signal('request::activate', 'mouse_click', { raise = true })
  end),
  AWFUL.button({ MOD_KEY }, 1, function(c)
    c:emit_signal('request::activate', 'mouse_click', { raise = true })
    AWFUL.mouse.client.move(c)
  end),
  AWFUL.button({ MOD_KEY }, 3, function(c)
    c:emit_signal('request::activate', 'mouse_click', { raise = true })
    AWFUL.mouse.client.resize(c)
  end)
)

-- Set keys
root.keys(GLOBAL_KEYS)
