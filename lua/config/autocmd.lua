vim.api.nvim_create_augroup("DiagnosticMode", { clear = true })
vim.api.nvim_create_autocmd("ModeChanged", {
  pattern = { "i", "v", "n" },
  group = "DiagnosticMode",
  callback = function(args)
    local bufnr = args.buf
    local is_attached = vim.lsp.buf_is_attached(bufnr, 1)
    local mode = vim.fn.mode()
    if is_attached and mode == "n" then
      vim.diagnostic.show()
    else
      vim.diagnostic.hide()
    end
  end,
})

vim.api.nvim_create_autocmd("BufLeave", {
  callback = function()
    vim.g.neovide_scroll_animation_length = 0
    vim.g.neovide_cursor_animation_length = 0
    vim.g.neovide_cursor_vfx_particle_lifetime = 0
  end,
})
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    vim.fn.timer_start(70, function()
      vim.g.neovide_cursor_vfx_particle_lifetime = 1.5
      vim.g.neovide_scroll_animation_length = 0.25
      vim.g.neovide_cursor_animation_length = 0.06
    end)
  end,
})

-- vim.api.nvim_create_augroup("KeyPress", { clear = true })
-- vim.api.nvim_create_autocmd("ModeChanged", {
--   pattern = { "i", "v" },
--   group = "KeyPress",
--   callback = function(args)
--     local bufnr = args.buf
--     local is_attached = vim.lsp.buf_is_attached(bufnr, 1)
--     if is_attached then vim.diagnostic.hide() end
--   end,
-- })

-- vim.o.updatetime = 250 -- global hold time setting
-- vim.api.nvim_create_autocmd("CursorHold", {
--   buffer = bufnr,
--   callback = function()
--     local opts = {
--       focusable = false,
--       close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
--       border = "rounded",
--       source = "always",
--       prefix = " ",
--       scope = "line",
--       max_width = 70,
--       pad_top = 1,
--       pad_bottom = 1,
--     }
--     vim.diagnostic.open_float(nil, opts)
--   end,
-- })
