local status = require "astronvim.utils.status"

local M = {}

function M.mode_color(hl)
  local get_mode = vim.fn.mode()
  local mode = get_mode:lower()
  if mode == "n" then
    return hl.normal
  elseif mode == "i" or mode == "t" then
    return hl.insert
  elseif mode == "v" or mode == "" or mode == "s" then
    return hl.visual
  elseif mode == "r" then
    return hl.replace
  elseif mode == "c" then
    return hl.command
  end
end

function M.mode()
  local mode_text = status.env.modes[vim.fn.mode()][1]
  local get_mode = vim.fn.mode()
  local mode = get_mode:lower()
  local icon = "ﮊ "
  if mode == "n" then
    icon = " "
  elseif mode == "i" then
    icon = "ﲅ "
  elseif mode == "v" or mode == "" or mode == "s" then
    icon = " "
  elseif mode == "r" then
    icon = " "
  elseif mode == "c" or mode == "t" then
    icon = " "
  end
  return " " .. icon .. mode_text .. " "
end

function M.macro_recording()
  local recording_register = vim.fn.reg_recording()
  local string = ""
  if #recording_register > 0 then string = "壘" .. recording_register .. " " end
  -- vim.cmd "redrawstatus"
  return string
end

function M.grapple()
  local key_exists = require("grapple").exists()
  local key_name = "ﰠ "
  if key_exists then
    local tag = require("grapple").key()
    key_name = "笠" .. tag .. " "
  end
  return key_name
end

function M.set_grapple_color(hl)
  local key = require("grapple").exists()
  local key_color = "bg"
  if key then key_color = M.mode_color(hl) end
  return key_color
end

return M
