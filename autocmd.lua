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

vim.api.nvim_create_augroup("DiagnosticMode", { clear = true })
vim.api.nvim_create_autocmd("ModeChanged", {
  pattern = { "i", "v" },
  group = "DiagnosticMode",
  callback = function(args)
    local bufnr = args.buf
    local is_attached = vim.lsp.buf_is_attached(bufnr, 1)
    if is_attached then vim.diagnostic.hide() end
  end,
})

vim.api.nvim_create_autocmd({ "ModeChanged" }, {
  pattern = "n",
  group = "DiagnosticMode",
  callback = function(args)
    local bufnr = args.buf
    local is_attached = vim.lsp.buf_is_attached(bufnr, 1)
    if is_attached then vim.diagnostic.show() end
  end,
})
