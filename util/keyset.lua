M = {}

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local g = vim.g

g.key_set_on = false

function M.toggle()
  if g.key_set_on then
    g.key_set_on = false
    print "Alt Keymap off"
  else
    g.key_set_on = true
    -- map()
    print "Alt Keymap on"
  end
end

function M.command(command, key_press, mode)
  if g.key_set_on then
    vim.api.nvim_command(command)
  else
    -- local key = vim.api.nvim_replace_termcodes(key_press)
    -- vim.api.nvim_feedkeys(key_press, mode, true)
    vim.api.nvim_input(key_press)
  end
end

return M
