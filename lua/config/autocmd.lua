vim.api.nvim_create_augroup("DiagnosticMode", { clear = true })
vim.api.nvim_create_autocmd({ "ModeChanged" }, {
  pattern = { "i", "v", "n" },
  group = "DiagnosticMode",
  callback = function(args)
    local bufnr = args.buf
    local is_attached = vim.lsp.buf_is_attached(bufnr, 1)
    local mode = vim.fn.mode()
    if is_attached and mode == "n" then
      vim.diagnostic.enable()
    else
      vim.diagnostic.disable()
    end
  end,
})

local timer = 0
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    vim.g.neovide_scroll_animation_length = 0
    vim.g.neovide_cursor_animation_length = 0
    vim.g.neovide_cursor_vfx_particle_lifetime = 0

    if vim.tbl_isempty(vim.fn.timer_info(timer)) then
      vim.fn.timer_stop(timer)
    end

    timer = vim.fn.timer_start(200, function()
      vim.g.neovide_cursor_vfx_particle_lifetime = 1.5
      vim.g.neovide_scroll_animation_length = 0.25
      vim.g.neovide_cursor_animation_length = 0.06
    end)
  end,
})

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
