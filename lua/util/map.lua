local M = {}

function M._which_key_add(tbl)
  require("which-key").add(tbl)
end

function M._key_add(tbl)
  local options = { silent = true, noremap = true }

  for key, value in pairs(tbl) do
    if key ~= 1 or key ~= 2 or key ~= "mode" then
      options[key] = value
    end
  end

  vim.keymap.set(tbl["mode"] or "n", tbl[1], tbl[2] or "", options)
end

function M.set(tbl)
  local func
  local has_wk, _ = pcall(require, "which-key")

  if has_wk then
    func = M._which_key_add
  else
    func = M._key_add
  end

  func(tbl)
end

-- recursive function for adding keymaps and overrides.
function M.set_keymaps(tbl, perant_override)
  perant_override = perant_override or {}
  local override = {}

  -- build overrides
  for key, value in pairs(tbl) do
    if type(key) ~= "number" then
      override[key] = value
    end
  end

  local options = vim.tbl_extend("force", perant_override, override)

  for key, value in pairs(tbl) do
    if type(key) == "number" then
      local has_tbl = false
      local is_group = false

      for k, v in pairs(value) do
        if type(v) == "table" then
          has_tbl = true
          break
        elseif k == "group" then
          is_group = true
        elseif k == "mode" then
          is_group = true
        end
      end

      if has_tbl then
        M.set_keymaps(value, options)
      elseif is_group then -- don't add options to which-key groups
        M.set(value)
      else
        local map = vim.tbl_extend("keep", value, options)
        M.set(map)
      end
    end
  end
end

return M
