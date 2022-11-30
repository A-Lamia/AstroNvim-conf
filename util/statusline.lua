local M = {}


function M.mode_color(colors)
  local get_mode = vim.fn.mode()
  local mode = get_mode:lower()
  if mode == "n" then return colors[1]
  elseif mode == "i" or mode == "t" then return colors[2]
  elseif mode == "v" or mode == "" or mode == "s" then return colors[3]
  elseif mode == "r" then return colors[4]
  elseif mode == "c" then return colors[5]
  end
end

function M.mode()
  local mode_text = astronvim.status.env.modes[vim.fn.mode()][1]
  local get_mode = vim.fn.mode()
  local mode = get_mode:lower()
  local icon = "ﮊ "
  if mode == "n" then icon = " "
  elseif mode == "i" then icon = "ﲅ "
  elseif mode == "v" or mode == "" or mode == "s" then icon = " "
  elseif mode == "r" then icon = " "
  elseif mode == "c" or mode == "t" then icon = " "
  end
  return " " .. icon .. mode_text .. " "
end

function M.macro_recording()
  local recording_register = vim.fn.reg_recording()
  if recording_register == "" then
    return ""
  else
    return "壘" .. recording_register .. " "
  end
end

function M.get_grapple()
  local key_exists = require("grapple").exists()
  local key_name = "ﰠ "
  if key_exists then
    local tag = require("grapple").key()
    key_name = "笠" .. tag .. " "
  end
  return key_name
end

function M.set_grapple_color(colors)
  local key = require("grapple").exists()
  local key_color = "bg"
  if key then
    key_color = M.mode_color(colors)
  end
  return key_color
end

return M
