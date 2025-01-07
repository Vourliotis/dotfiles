local dpi = BEAUTIFUL.xresources.apply_dpi

NAUGHTY.config.padding = BEAUTIFUL.notification_padding
NAUGHTY.config.spacing = BEAUTIFUL.notification_spacing
NAUGHTY.config.defaults.margin = BEAUTIFUL.notification_margin
NAUGHTY.config.defaults.border_width = BEAUTIFUL.notification_border_width

NAUGHTY.config.presets.normal = {
  position = 'top_right',
  ontop = true,
  timeout = 5,
  widget_template = {
    widget = WIBOX.container.background,
    bg = BEAUTIFUL.notification_bg,
    shape = function(cr, width, height)
      GEARS.shape.rounded_rect(cr, width, height, BEAUTIFUL.notification_border_radius)
    end,
    {
      widget = WIBOX.container.margin,
      margins = BEAUTIFUL.notification_padding,
      {
        layout = WIBOX.layout.fixed.horizontal,
        spacing = dpi(10),
        {
          widget = WIBOX.container.constraint,
          width = BEAUTIFUL.notification_icon_size,
          height = BEAUTIFUL.notification_icon_size,
          strategy = 'exact',
          {
            widget = WIBOX.widget.imagebox,
            id = 'icon_role',
          },
        },
        {
          layout = WIBOX.layout.fixed.vertical,
          spacing = dpi(4),
          {
            widget = WIBOX.container.margin,
            margins = { bottom = dpi(4) },
            {
              widget = WIBOX.widget.textbox,
              id = 'title_role',
              font = BEAUTIFUL.notification_font:gsub('%s%d+$', ' Bold 12'),
            },
          },
          {
            widget = WIBOX.widget.textbox,
            id = 'message_role',
          },
          {
            widget = WIBOX.container.margin,
            margins = { top = dpi(4) },
            {
              layout = WIBOX.layout.fixed.horizontal,
              spacing = dpi(8),
              {
                widget = WIBOX.container.background,
                id = 'action_list_role',
              },
            },
          },
        },
      },
    },
  },
}

NAUGHTY.config.presets.critical = {
  bg = BEAUTIFUL.notification_critical_bg,
  timeout = 0,
}

NAUGHTY.config.presets.low = {
  bg = BEAUTIFUL.notification_low_bg,
  timeout = 5,
}
