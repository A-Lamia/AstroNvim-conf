-- vim.api.nvim_create_augroup("winblend", { clear = true })
-- vim.api.nvim_create_autocmd("VimEnter", {
--   group = "winblend",
--   callback = function()
--     if vim.g.neovide then
--       vim.o.winblend = vim.g.winblend
--       vim.cmd("hi! NormalFloat blend=" .. vim.g.winblend)
--     end
--   end,
-- })

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

-- vim.api.nvim_create_augroup("InlayHints", { clear = true })
-- vim.api.nvim_create_autocmd({ "ModeChanged", "LspAttach" }, {
-- pattern = { "i", "v" },
-- group = "InlayHints",
-- callback = function(args)
-- local bufnr = args.buf
-- local is_attached = vim.lsp.buf_is_attached(bufnr, 1)
-- if vim.g.inlayhints then
-- local client = vim.lsp.get_client_by_id(args.data.client_id)
-- if client and client.server_capabilities.inlayHintProvider then
-- local active = vim.api.nvim_buf_get_var(bufnr, "inlayhints_active") or false
-- if active then
-- require("lsp-inlayhints.core").toggle()
-- vim.api.nvim_buf_set_var(bufnr, "inlayhints_active", false)
-- end
-- end
-- end
-- end,
-- })

-- vim.api.nvim_create_autocmd({ "ModeChanged", "LspAttach" }, {
-- pattern = "n",
-- group = "InlayHints",
-- callback = function(args)
-- local bufnr = args.buf
-- if vim.g.inlayhints then
-- local is_attached = vim.lsp.buf_is_attached(bufnr, 1)
-- local client = vim.lsp.get_client_by_id(args.data.client_id)
-- if client and client.server_capabilities.inlayHintProvider then
-- local active = vim.api.nvim_buf_get_var(bufnr, "inlayhints_active") or false
-- if not active then
-- require("lsp-inlayhints.core").toggle()
-- vim.api.nvim_buf_set_var(bufnr, "inlayhints_active", true)
-- end
-- end
-- end
-- end,
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
