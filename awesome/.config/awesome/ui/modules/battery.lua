local function battery()
  local widget = WIBOX.widget({
    {
      id = 'icon',
      widget = WIBOX.widget.imagebox,
    },
    {
      id = 'percentage',
      widget = WIBOX.widget.textbox,
      forced_width = 40,
      align = 'center',
    },
    layout = WIBOX.layout.fixed.horizontal,
  })

  local function update_widget()
    local full_percentagle = 95

    AWFUL.spawn.easy_async('acpi -b', function(stdout)
      local status, charge_text = stdout:match('(%w+), (%d+)%%')
      local charge = tonumber(charge_text)

      if charge >= full_percentagle then
        charge_text = '100'
      end
      widget.percentage.text = charge_text .. '%'

      if status == 'Discharging' then
        if charge <= 25 then
          widget.icon.image = GEARS.color.recolor_image(BEAUTIFUL.battery_empty, BEAUTIFUL.fg_normal)
        elseif charge <= 50 then
          widget.icon.image = GEARS.color.recolor_image(BEAUTIFUL.battery_quarter, BEAUTIFUL.fg_normal)
        elseif charge <= 75 then
          widget.icon.image = GEARS.color.recolor_image(BEAUTIFUL.battery_half, BEAUTIFUL.fg_normal)
        elseif charge <= full_percentagle then
          widget.icon.image = GEARS.color.recolor_image(BEAUTIFUL.battery_three_quarters, BEAUTIFUL.fg_normal)
        else
          widget.icon.image = GEARS.color.recolor_image(BEAUTIFUL.battery_full, BEAUTIFUL.fg_normal)
        end
      else
        widget.icon:set_image(GEARS.color.recolor_image(BEAUTIFUL.battery_charging, BEAUTIFUL.fg_normal))
      end
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

  return widget
end

return battery()
