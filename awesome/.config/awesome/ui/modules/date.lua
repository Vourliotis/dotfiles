local dpi = require('beautiful.xresources').apply_dpi

local date = WIBOX.widget({
  {
    fg = BEAUTIFUL.blue,
    widget = WIBOX.container.background,
    {
      widget = WIBOX.widget.textclock,
      font = BEAUTIFUL.font .. ' Bold 11',
    },
  },
  margins = DPI(7),
  widget = WIBOX.container.margin,
})

local function initialize_calendar(screen)
  screen.calendar = {}

  screen.calendar.widget = WIBOX.widget({
    date = os.date('*t'),
    font = BEAUTIFUL.font .. ' 11',
    spacing = DPI(2),
    widget = WIBOX.widget.calendar.month,
    fn_embed = function(widget, flag, input_date)
      local focus_date = (flag == 'focus' and input_date.month == os.date('*t').month)
      if not focus_date then widget.markup = widget.text end

      return WIBOX.widget({
        {
          widget,
          margins = DPI(5),
          widget = WIBOX.container.margin,
        },
        fg = focus_date and BEAUTIFUL.fg_focus or BEAUTIFUL.fg_normal,
        bg = BEAUTIFUL.bg_normal,
        widget = WIBOX.container.background,
      })
    end,
  })

  screen.calendar.popup = AWFUL.popup({
    visible = false,
    ontop = true,
    placement = function(d)
      return AWFUL.placement.top(d, {
        margins = {
          top = BEAUTIFUL.bar_height + dpi(5),
        },
      })
    end,
    shape = HELPERS.rounded_rectangle(),
    screen = screen,
    widget = screen.calendar.widget,
  })

  local self = screen.calendar.popup

  function screen.calendar.show()
    self.visible = true
  end

  function screen.calendar.hide()
    self.visible = false
  end

  function screen.calendar.toggle()
    self.visible = not self.visible
  end

  function screen.calendar.reset()
    screen.calendar.widget.date = os.date('*t')
  end
end

local function update_calendar(widget, change)
  local new_month = widget.date.month + change
  local new_year = widget.date.year

  if new_month < 1 then
    new_month = 12
    new_year = new_year - 1
  elseif new_month > 12 then
    new_month = 1
    new_year = new_year + 1
  end

  widget:set_date({ year = new_year, month = new_month, day = widget.date.day })
end

local function get_calendar()
  return AWFUL.screen.focused().calendar
end

-- Widget keybindings
date:buttons(GEARS.table.join(
  AWFUL.button({}, 1, function()
    awesome.emit_signal('calendar::toggle')
  end),
  AWFUL.button({}, 4, function()
    update_calendar(get_calendar().widget, 1)
  end),
  AWFUL.button({}, 5, function()
    update_calendar(get_calendar().widget, -1)
  end)
))

-- Signals
AWFUL.screen.connect_for_each_screen(function(s)
  initialize_calendar(s)
end)

awesome.connect_signal('calendar::toggle', function()
  get_calendar().reset()
  get_calendar().toggle()
end)

awesome.connect_signal('calendar::visibility', function(visible)
  if visible then
    get_calendar().show()
  else
    get_calendar().hide()
  end
end)

-- Re-initialize calendar when a screen's geometry changes (e.g. different resolution)
screen.connect_signal('property::geometry', function(s)
  initialize_calendar(s)
end)

return date
