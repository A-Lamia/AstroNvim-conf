local color = require("user.util.color")

M = {}


function M.setup()

  local function new_mode_color(c)
    local base = color.rawToRgb(
      vim.api.nvim_get_hl_by_name("StatusLine", true).background
    )
    return color.toHex(
      color.mix(base, color.toRgb(c))
    )
  end

  local fallback = {
    normal = new_mode_color("#57ACDC"),
    insert = new_mode_color("#60C689"),
    visual = new_mode_color("#9C27B0"),
    replace = new_mode_color("#E91E63"),
    command = new_mode_color("#FADA5E"),
  }

  local hl = {
    statusbar = vim.api.nvim_get_hl_by_name("StatusLine", true),
    folder = vim.api.nvim_get_hl_by_name("Substitute", true),
    nav = vim.api.nvim_get_hl_by_name("String", true),

    -- Returns hex
    normal = astronvim.get_hlgroup("HeirlineNormal", { fg = nil }).fg
        or astronvim.status.hl.lualine_mode("normal", fallback.normal),

    insert = astronvim.get_hlgroup("HeirlineInsert", { fg = nil }).fg
        or astronvim.status.hl.lualine_mode("insert", fallback.insert),

    visual = astronvim.get_hlgroup("HeirlineVisual", { fg = nil }).fg
        or astronvim.status.hl.lualine_mode("visual", fallback.visual),

    replace = astronvim.get_hlgroup("HeirlineReplace", { fg = nil }).fg
        or astronvim.status.hl.lualine_mode("replace", fallback.replace),

    command = astronvim.get_hlgroup("HeirlineCommand", { fg = nil }).fg
        or astronvim.status.hl.lualine_mode("command", fallback.command)
  }

  local function status_bg()
    return color.rawToRgb(hl.statusbar.background)
  end

  local function mix_mode_bg(mode)
    local status = status_bg()
    local mode_type = color.toRgb(mode)
    return color.toHex(
      color.mix(status, mode_type)
    )
  end

  -- NOTE: Nav section --

  local function nav_icon_bg()
    return color.rawToHex(hl.nav.foreground)
  end

  local function nav_mix()
    local icon_bg = color.toRgb(nav_icon_bg())
    local bg = status_bg()
    return color.toHex(
      color.mix(bg, icon_bg)
    )
  end

  -- NOTE: Folder section --

  local function folder_icon_bg()
    return color.rawToHex(hl.folder.background)
  end

  local function folder_mix()
    local folder_bg = color.toRgb(folder_icon_bg())
    local bg = status_bg()
    return color.toHex(
      color.mix(bg, folder_bg)
    )
  end

  -- NOTE: Export final colors --


  local grapple = {
    normal = mix_mode_bg(hl.normal),
    insert = mix_mode_bg(hl.insert),
    visual = mix_mode_bg(hl.visual),
    replace = mix_mode_bg(hl.replace),
    command = mix_mode_bg(hl.command),
  }

  local c = {
    nav_icon_bg = nav_icon_bg(),
    folder_icon_bg = folder_icon_bg(),
    nav_bg = nav_mix(),
    folder_bg = folder_mix(),

    mode = {
      normal = hl.normal,
      insert = hl.insert,
      visual = hl.visual,
      replace = hl.replace,
      command = hl.command,
    },

    -- Grapple mode background
    grapple = grapple,
    -- Macro mode background
    macro = {
      normal = mix_mode_bg(grapple.normal),
      insert = mix_mode_bg(grapple.insert),
      visual = mix_mode_bg(grapple.visual),
      replace = mix_mode_bg(grapple.replace),
      command = mix_mode_bg(grapple.command),
    }
  }

  return c
end

return M
