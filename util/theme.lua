local color = require "user.util.color"
local status = require "astronvim.utils.status"

M = {}

function M.setup()
  local hl = {
    statusbar = {
      bg = color.get_hlgroup({ "StatusLine", "Normal" }).bg,
      fg = color.get_hlgroup({ "StatusLine", "Normal" }).fg,
    },
  }

  local mode_value = 50
  local function modeAutoColor(rgb, value)
    return color:editor(rgb, {
      { "toRgb" },
      { "mix", hl.statusbar.bg, 100 },
      function()
        local status_value = color.getLuminance(hl.statusbar.bg, color.luminanceMode)
        local data

        if status_value > 127.5 then
          return color:editor(color.data, {
            { "value", 0.35 },
            { "saturation", 0.80 },
          })
        elseif status_value < 127.5 then
          return color:editor(color.data, {
            { "value", 0.80 },
            { "saturation", 0.60 },
          })
        end
      end,
      { "toHex" },
    })
  end

  local fallback = {
    normal = modeAutoColor("#64B4E5", mode_value),
    insert = modeAutoColor("#5ABE81", mode_value),
    visual = modeAutoColor("#F17DFF", mode_value),
    replace = modeAutoColor("#FF6293", mode_value),
    command = modeAutoColor("#C3A940", mode_value),
  }

  hl.folder = color.get_hlgroup({ "MiniStatusLineModeReplace", "StatusReplace" }).bg or color.toRgb(fallback.replace)
  hl.nav = color.get_hlgroup({ "MiniStatusLineModeInsert", "StatusInsert" }).bg or color.toRgb(fallback.insert)

  hl.normal = color.get_hlgroup({ "MiniStatuslineModeNormal", "HeirlineNormal", "StatusNormal" }).bg
    or color.toRgb(status.hl.lualine_mode("normal", fallback.normal))

  hl.insert = color.get_hlgroup({ "MiniStatuslineModeInsert", "HeirlineInsert", "StatusInsert" }).bg
    or color.toRgb(status.hl.lualine_mode("insert", fallback.insert))

  hl.visual = color.get_hlgroup({ "MiniStatuslineModeVisual", "HeirlineVisual", "StatusVisual" }).bg
    or color.toRgb(status.hl.lualine_mode("visual", fallback.visual))

  hl.replace = color.get_hlgroup({ "MiniStatuslineModeReplace", "HeirlineReplace", "StatusReplace" }).bg
    or color.toRgb(status.hl.lualine_mode("replace", fallback.replace))

  hl.command = color.get_hlgroup({ "MiniStatuslineModeCommand", "HeirlineCommand", "StatusCommand" }).bg
    or color.toRgb(status.hl.lualine_mode("command", fallback.command))

  local c = {}

  c.colors_name = vim.g.colors_name

  c.mode = {
    normal = color.toHex(hl.normal),
    insert = color.toHex(hl.insert),
    visual = color.toHex(hl.visual),
    replace = color.toHex(hl.replace),
    command = color.toHex(hl.command),
  }

  local grapple_mix = 5
  local grapple_value = 20
  local grapple_lerp = 0.2
  local function grapple_color(rgb, rgb2)
    return color:editor(rgb, {
      { "mix", hl.statusbar.bg, grapple_mix },
      -- { "autoValue", hl.normal, grapple_value },
      { "lerp", hl.statusbar.bg, grapple_lerp },
      { "hue", 5 },
      { "toHex" },
    })
  end

  c.grapple = {
    normal = grapple_color(hl.normal, hl.statusbar.bg),
    insert = grapple_color(hl.insert, hl.statusbar.bg),
    visual = grapple_color(hl.visual, hl.statusbar.bg),
    replace = grapple_color(hl.replace, hl.statusbar.bg),
    command = grapple_color(hl.command, hl.statusbar.bg),
  }

  local tool_mix = 5
  local tool_value = 40
  local tool_lerp = 0.4
  local function tool_color(rgb, rgb2)
    return color:editor(rgb, {
      { "mix", hl.statusbar.bg, tool_mix },
      -- { "autoValue", hl.normal, tool_value },
      { "lerp", hl.statusbar.bg, tool_lerp },
      { "hue", 5 },
      { "toHex" },
    })
  end

  c.tools = {
    normal = tool_color(hl.normal, hl.statusbar.bg),
    insert = tool_color(hl.insert, hl.statusbar.bg),
    visual = tool_color(hl.visual, hl.statusbar.bg),
    replace = tool_color(hl.replace, hl.statusbar.bg),
    command = tool_color(hl.command, hl.statusbar.bg),
  }

  c.nav_icon_bg = color.toHex(hl.insert)

  c.nav_bg = color:editor(hl.insert, {
    { "mix", hl.statusbar.bg, 5 },
    -- { "autoValue", hl.insert, 20 },
    { "lerp", hl.statusbar.bg, 0.4 },
    { "hue", 5 },
    { "toHex" },
  })

  c.folder_icon_bg = color.toHex(hl.replace)

  c.folder_bg = color:editor(hl.replace, {
    { "mix", hl.statusbar.bg, 5 },
    -- { "autoValue", hl.replace, 20 },
    { "lerp", hl.statusbar.bg, 0.4 },
    { "hue", 5 },
    { "toHex" },
  })

  return c
end

return M
