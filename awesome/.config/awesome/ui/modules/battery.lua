local function battery()
  local handle = io.popen('acpi -b')
  if not handle then
    return WIBOX.widget({})
  end

  local result = handle:read('*a')
  handle:close()
  if #result == 0 then
    return WIBOX.widget({})
  end

  local battery_icon = WIBOX.widget({
    {
      image = GEARS.color.recolor_image(BEAUTIFUL.battery_full, BEAUTIFUL.fg_normal),
      forced_width = 22,
      widget = WIBOX.widget.imagebox,
    },
    valign = 'center',
    halign = 'center',
    widget = WIBOX.container.place,
  })

  local battery_tooltip = AWFUL.tooltip({
    objects = { battery_icon },
    bg = BEAUTIFUL.bg_normal .. 'cc',
    fg = BEAUTIFUL.fg_normal,
    border_width = 0,
    font = BEAUTIFUL.font .. ' 12',
    mode = 'outside',
    preferred_alignments = 'middle',
  })

  local function update_widget()
    local full_percentagle = 95

    AWFUL.spawn.easy_async('acpi -b', function(stdout)
      local status, charge_text = stdout:match('(%w+), (%d+)%%')
      local charge = tonumber(charge_text)

      if charge >= full_percentagle then
        charge_text = '100'
      end

      battery_tooltip.markup = '<span color="#ffffff"><b>' .. charge_text .. '%</b></span>'

      local icon_image
      if status == 'Discharging' then
        if charge <= 25 then
          icon_image = BEAUTIFUL.battery_empty
        elseif charge <= 50 then
          icon_image = BEAUTIFUL.battery_quarter
        elseif charge <= 75 then
          icon_image = BEAUTIFUL.battery_half
        elseif charge <= full_percentagle then
          icon_image = BEAUTIFUL.battery_three_quarters
        else
          icon_image = BEAUTIFUL.battery_full
        end
      else
        icon_image = BEAUTIFUL.battery_charging
      end
      battery_icon.widget.image = GEARS.color.recolor_image(icon_image, BEAUTIFUL.fg_normal)
    end)
  end

  GEARS.timer({
    timeout = 30,
    call_now = true,
    autostart = true,
    callback = function()
      update_widget()
    end,
  })

  return battery_icon
end

return battery()
