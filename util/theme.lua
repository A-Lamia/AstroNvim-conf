local color = require("user.util.color")

M = {}

function M.setup()
  local mode = {
    N = "#7AA2F7",
    I = "#9ECE6A",
    V = "#BB9AF7",
    C = "#E0AF68",
    R = "#F7768E",
  }
  local string = vim.api.nvim_get_hl_by_name("String", true).foreground
  local substitute = vim.api.nvim_get_hl_by_name("Substitute", true).background
  local normalNC = vim.api.nvim_get_hl_by_name("StatusLine", true).background

  local nav_mix = color.toHex(color.mix(color.rawToRgb(normalNC), color.rawToRgb(string)))
  local folder_mix = color.toHex(color.mix(color.rawToRgb(normalNC), color.rawToRgb(substitute)))

  local c = {
    nav_icon_bg = color.rawToHex(string),
    folder_icon_bg = color.rawToHex(substitute),
    nav_bg = nav_mix,
    folder_bg = folder_mix,
  }
  return c
end

return M
