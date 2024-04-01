local astrolsp = require "astrolsp"
local icons = require "util.icons"

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
  local cur_mode = vim.fn.mode()
  local mode_text = require("util.modes")[cur_mode][1]
  local mode = cur_mode:lower()

  local icon = icons.error
  if mode == "n" then
    icon = icons.normal
  elseif mode == "i" then
    icon = icons.insert
  elseif mode == "v" or mode == "" or mode == "s" then
    icon = icons.visual
  elseif mode == "r" then
    icon = icons.replace
  elseif mode == "c" or mode == "t" then
    icon = icons.terminal
  end

  return " " .. icon .. mode_text .. " "
end

function M.macro_recording()
  local recording_register = vim.fn.reg_recording()
  local output = ""
  if #recording_register > 0 then
    output = icons.recording .. recording_register .. " "
  end
  return output
end

function M.grapple()
  local ok, grapple = pcall(require, "grapple")
  local statusline = ok and grapple.statusline() or nil
  return statusline and statusline .. " " or icons.addtag
end

function M.set_grapple_color(hl)
  local key = require("grapple").exists()
  local key_color = "bg"
  if key then
    key_color = M.mode_color(hl)
  end
  return key_color
end

function M.lsp_status()
  local _, lsp = next(astrolsp.lsp_progress or {})
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

      local load = require "util.spinner"
      local spinner = load:new(load.style.smiley)
      local laps = load:new(load.style.hexagon)

      return spinner:prog(lsp.percentage)
        .. " "
        .. message
        .. " "
        .. laps:prog(lsp.percentage)
    end
  else
    return ""
  end
end

return M
