return {
  "saghen/blink.cmp",
  lazy = false,
  dependencies = { "rafamadriz/friendly-snippets" },
  version = "v0.*",
  opts = {
    keymap = {
      preset = "default",
      ["<C-Space>"] = { "show", "show_documentation", "hide_documentation", "fallback" },
      ["<C-CR>"] = { "accept", "fallback" },
      ["<Tab>"] = { "accept", "fallback" },
      ["<DOWN>"] = { "select_next", "fallback" },
      ["<UP>"] = { "select_prev", "fallback" },
      ["<C-K>"] = { "select_prev", "fallback" },
      ["<C-J>"] = { "select_next", "fallback" },
      ["<C-D>"] = { "scroll_documentation_up", "fallback" },
      ["<C-U>"] = { "scroll_documentation_down", "fallback" },
    },
    completion = {
      menu = {
        border = vim.g.border,
        winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
      },
      documentation = {
        border = vim.g.border,
        window = {
          winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
        },
      },
      signature = {
        border = vim.g.border,
        window = {
          winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
        },
      },
      ghost_text = {
        border = vim.g.border,
        enabled = true,
      },
    },
  },
  specs = {
    { "hrsh7th/nvim-cmp", enabled = false },
    { "rcarriga/cmp-dap", enabled = false },
    { "L3MON4D3/LuaSnip", enabled = false },
    { "onsails/lspkind.nvim", enabled = false },
  },
}
