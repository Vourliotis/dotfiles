-- Give focus to spawned clients
require('awful.autofocus')

-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require('awful.hotkeys_popup.keys')

-- Layouts
AWFUL.layout.layouts = {
  AWFUL.layout.suit.tile,
  AWFUL.layout.suit.max.fullscreen,
}

-- Rules to apply to new clients (through the "manage" signal)
AWFUL.rules.rules = {
  -- Disable the floating property for fullscreen to work properly
  {
    rule_any = { class = { 'Google-chrome', 'google-chrome' } },
    properties = { floating = false },
  },

  -- All clients will match this rule
  {
    rule = {},
    properties = {
      border_width = BEAUTIFUL.border_width,
      border_color = BEAUTIFUL.border_normal,
      focus = AWFUL.client.focus.filter,
      raise = true,
      keys = CLIENT_KEYS,
      buttons = CLIENT_BUTTONS,
      screen = AWFUL.screen.preferred,
      placement = AWFUL.placement.no_overlap + AWFUL.placement.no_offscreen,
    },
  },

  -- Floating clients
  {
    rule_any = {
      instance = {},
      class = {
        'Arandr',
        'Blueman-manager',
        'Org.gnome.Nautilus',
        '1Password',
        'Pavucontrol',
        'Gnome-calculator',
        'libreoffice-calc',
        'Cloudflare WARP'
      },
      name = {},
      role = {
        'pop-up',
      },
    },
    properties = { floating = true },
  },

  -- Add titlebars to normal clients and dialogs
  { rule_any = { type = { 'normal', 'dialog' } }, properties = { titlebars_enabled = false } },
}
