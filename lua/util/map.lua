local M = {}

function M._which_key(mode, key, command, desc, name, opts)
  command = command or ""
  desc = desc or ""
  name = name or nil
  local options = { silent = true, noremap = true, desc = desc }

  local wk = require "which-key"

  options.mode = mode
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end

  local reg = { [key] = (name and { name = name }) or { command, desc } }
  wk.register(reg, options)
end

function M._default(mode, key, command, desc, name, opts)
  command = command or ""
  desc = desc or ""
  name = name or nil

  local options = { silent = true, noremap = true, desc = desc }
  if type(command) == "function" then
    options.callback = command
    command = ""
  end

  if opts then
    options = vim.tbl_extend("force", options, opts)
  end

  vim.api.nvim_set_keymap(mode, key, command, options)
end

function M.set(...)
  local value = { ... }
  local func
  local has_wk, _ = pcall(require, "which-key")

  if has_wk then
    func = M._which_key
  else
    func = M._default
  end

  func(value[1], value[2], value[3], value[4], value[5], value[6])
end

function M.set_keymaps(tbl)
  for mode, keymaps in pairs(tbl) do
    for key, value in pairs(keymaps) do
      local is_value_empty = vim.tbl_isempty(value)

      if not is_value_empty then
        M.set(tostring(mode), tostring(key), value[1], value.desc, value.name, value.opts)
      end
    end
  end
end

return M
