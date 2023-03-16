-- vim.api.nvim_create_augroup("relative_number_switch", { clear = true })
-- vim.api.nvim_create_autocmd("InsertEnter", {
--   pattern = "*",
--   group = "relative_number_switch",
--   command = "set norelativenumber",
-- })
-- vim.api.nvim_create_autocmd("InsertLeave", {
--   pattern = "*",
--   group = "relative_number_switch",
--   command = "set relativenumber",
-- })
--
vim.api.nvim_create_augroup("winblend", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "mason", "lazy", "grapple" },
  group = "winblend",
  command = "setlocal winblend=" .. vim.g.winblend,
})
