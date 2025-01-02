local data = vim.fn.stdpath "data"
local lazypath = data .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.g.astronvim_first_install = true -- lets AstroNvim know that this is an initial installation
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("lazy").setup {
  spec = {
    { "AstroNvim/AstroNvim", branch = "main", version = nil, import = "astronvim.plugins" },
    { import = "plugins" },
  },
  change_detection = {
    enabled = true,
    notify = false,
  },
  dev = {
    path = data .. "/dev",
  },
  ui = {
    border = vim.g.border,
  },
  defaults = {},
  install = { colorscheme = { "astrodark", "habamax" } },
  checker = { enabled = false }, -- automatically check for plugin updates
  performance = {
    rtp = {
      -- disable some rtp plugins, add more to your liking
      disabled_plugins = {
        "gzip",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "zipPlugin",
      },
    },
  },
}
