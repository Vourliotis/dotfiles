local function update_tags(self, index, s)
  local markup_role = self:get_children_by_id('markup_role')[1]

  local found = false
  local i = 1

  while i <= #s.selected_tags do
    if s.selected_tags[i].index == index then
      found = true
    end
    i = i + 1
  end

  if found then
    markup_role.image = GEARS.color.recolor_image(BEAUTIFUL.selected_tag_format, BEAUTIFUL.taglist_fg_focus)
  else
    markup_role.image = GEARS.color.recolor_image(BEAUTIFUL.normal_tag_format, BEAUTIFUL.taglist_fg)
    for _, c in ipairs(client.get(s)) do
      for _, t in ipairs(c:tags()) do
        if t.index == index then
          if AWFUL.tag.getproperty(t, 'urgent') then
            markup_role.image = GEARS.color.recolor_image(BEAUTIFUL.occupied_tag_format, BEAUTIFUL.taglist_fg_urgent)
          else
            markup_role.image = GEARS.color.recolor_image(BEAUTIFUL.occupied_tag_format, BEAUTIFUL.taglist_fg_occupied)
          end
        end
      end
    end
  end
end

local function get_taglist(s)
  return AWFUL.widget.taglist({
    screen = s,
    filter = AWFUL.widget.taglist.filter.all,
    layout = {
      layout = WIBOX.layout.fixed.horizontal,
      spacing = 13,
    },
    style = {
      shape = GEARS.shape.circle,
    },
    buttons = GEARS.table.join(
      AWFUL.button({}, 1, function(t)
        t:view_only()
      end),
      AWFUL.button({ MOD_KEY }, 1, function(t)
        if client.focus then
          client.focus:move_to_tag(t)
        end
      end),
      AWFUL.button({}, 3, AWFUL.tag.viewtoggle),
      AWFUL.button({ MOD_KEY }, 3, function(t)
        if client.focus then
          client.focus:toggle_tag(t)
        end
      end),
      AWFUL.button({}, 4, function(t)
        AWFUL.tag.viewprev(t.screen)
      end),
      AWFUL.button({}, 5, function(t)
        AWFUL.tag.viewnext(t.screen)
      end)
    ),
    widget_template = {
      {
        id = 'markup_role',
        image = nil,
        valign = 'center',
        halign = 'center',
        forced_height = 16,
        forced_width = 16,
        widget = WIBOX.widget.imagebox,
      },
      id = 'background_role',
      widget = WIBOX.container.background,
      shape = GEARS.shape.circle,
      update_callback = function(self, _, index)
        update_tags(self, index, s)
      end,
      create_callback = function(self, _, index)
        update_tags(self, index, s)
      end,
    },
  })
end

return get_taglist
