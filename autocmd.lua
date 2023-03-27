vim.api.nvim_create_augroup("winblend", { clear = true })
vim.api.nvim_create_autocmd("VimEnter", {
  group = "winblend",
  callback = function()
    if vim.g.neovide then
      vim.o.winblend = vim.g.winblend
      vim.cmd("hi! NormalFloat blend=" .. vim.g.winblend)
    end
  end,
})

-- vim.api.nvim_create_augroup("DiagnosticPopup", { clear = true })
-- vim.api.nvim_create_autocmd("CursorHold", {
--   group = "DiagnosticPopup",
--   callback = function()
--     local row, col = vim.api.nvim_win_get_cursor(0)
--     local line_diagnostic = vim.diagnostic.get(0, { lnum = row })
--     if vim.lsp.buf.server_ready() then vim.diagnostic.open_float() end
--   end,
-- })

vim.api.nvim_create_augroup("DiagnosticMode", { clear = true })
vim.api.nvim_create_autocmd("ModeChanged", {
  pattern = { "i", "v" },
  group = "DiagnosticMode",
  callback = function()
    if vim.lsp.buf.server_ready() then vim.diagnostic.hide() end
  end,
})

vim.api.nvim_create_autocmd("ModeChanged", {
  pattern = "n",
  group = "DiagnosticMode",
  callback = function()
    if vim.lsp.buf.server_ready() then vim.diagnostic.show() end
  end,
})
