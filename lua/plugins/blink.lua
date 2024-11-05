return {
  "saghen/blink.cmp",
  lazy = false,
  dependencies = { "rafamadriz/friendly-snippets" },
  version = "v0.*",
  opts = {
    sources = {
      completion = {
        enabled_providers = { "lsp", "path", "snippets", "buffer", "lazydev" },
      },
      provider = {
        lsp = { fallback_for = { "lazydev" } },
        lazydev = { name = "LazyDev", module = "lazydev.integrations.blink" },
      },
    },
    keymap = {
      preset = "default",
      ["<C-Space>"] = { "show", "fallback" },
      ["<CR>"] = { "accept", "fallback" },
      ["<Tab>"] = { "select_next", "fallback" },
      ["<S-Tab>"] = { "select_prev", "fallback" },
      ["<DOWN>"] = { "select_next", "fallback" },
      ["<UP>"] = { "select_prev", "fallback" },
      ["<C-K>"] = { "select_prev", "fallback" },
      ["<C-J>"] = { "select_next", "fallback" },
      ["<C-D>"] = { "scroll_documentation_up", "fallback" },
      ["<C-U>"] = { "scroll_documentation_down", "fallback" },
    },
    windows = {
      autocomplete = {
        border = "rounded",
        winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
      },
      documentation = {
        border = "rounded",
        auto_show = true,
        winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
      },
      signature_help = {
        border = "rounded",
        winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder",
      },
      ghost_text = {
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
