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
  local icon = "󰚌 "
  if mode == "n" then
    icon = " "
  elseif mode == "i" then
    icon = "󰞇 "
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
  return string
end

function M.grapple()
  local key_exists = require("grapple").exists()
  local key_name = "󰜢 "
  if key_exists then
    local tag = require("grapple").key()
    key_name = "󰓹 " .. tag .. " "
  end
  return key_name
end

function M.set_grapple_color(hl)
  local key = require("grapple").exists()
  local key_color = "bg"
  if key then key_color = M.mode_color(hl) end
  return key_color
end

function M.lsp_status()
  local _, lsp = next(astronvim.lsp.progress or {})
  if lsp ~= nil then
    if lsp.percentage and (lsp.percentage <= 100) then
      local message
      if vim.o.columns <= 95 then
        message = table.concat {
          string.sub(lsp.title, 1, 7),
          "...",
        }
      elseif vim.o.columns > 130 then
        message = table.concat {
          lsp.title,
          " ",
          lsp.message,
        }
      else
        message = lsp.title
      end

      local load = require "user.util.spinner"
      local spinner = load:new(load.style.smiley)
      local laps = load:new(load.style.hexagon)

      return spinner:prog(lsp.percentage) .. " " .. message .. " " .. laps:prog(lsp.percentage)
    end
  else
    return ""
  end
end

return M
