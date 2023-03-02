local M = {}

local notify = require("astronvim.utils").notify

function M.better_search(key)
  return function()
    -- attempt to search
    local searched, error =
        pcall(vim.cmd.normal, { args = { (vim.v.count > 0 and vim.v.count or "") .. key }, bang = true })
    -- if search successful
    if searched then
      -- center and unfold with protection from errors
      pcall(vim.cmd.normal, "zzzv")
      -- set hlsearch to true
      vim.opt.hlsearch = true
      -- if search unsuccessful (if match not found)
    else
      -- show error as notification
      notify(error, "error", { timeout = 0 })
      -- disable hlsearch
      vim.opt.hlsearch = false
    end
  end
end

return M

