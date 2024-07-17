local M = {}

M.replace = require "macro.replace"

function M.better_search(key)
  return function()
    local searched, _ = pcall(
      vim.cmd.normal,
      { args = { (vim.v.count > 0 and vim.v.count or "") .. key }, bang = true }
    )
    if searched then
      pcall(vim.cmd.normal, "zzzv")
      vim.opt.hlsearch = true
    else
      vim.opt.hlsearch = false
    end
  end
end

function M.diagnostics_next()
  local row, _ = vim.diagnostics.get_next_pos()
  vim.cmd(row)
end

function M.diagnostics_prev()
  local row, _ = vim.diagnostics.get_prev_pos()
  vim.cmd(row)
end

function M.toggle_fold()
  local lnum = vim.api.nvim_win_get_cursor(0)
  if vim.fn.foldclosed(lnum[1]) ~= -1 then
    print "Close"
    vim.cmd "foldopen"
  else
    print "Open"
    vim.cmd "foldclose"
  end
end

function M.focus_left_buffer()
  require("astrocore.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1))
end
function M.focus_right_buffer()
  require("astrocore.buffer").nav(vim.v.count > 0 and vim.v.count or 1)
end

return M
