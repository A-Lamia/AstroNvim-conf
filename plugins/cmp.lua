return {
  "hrsh7th/nvim-cmp",
  opts = {
    performance = {
      debounce = 300,
      throttle = 120,
      fetching_timeout = 100
    },
    experimental = {
      ghost_text = true,
    },
    sources = {
      { name = "nvim_lsp", priority = 1000 },
      -- { name = "codeium",  priority = 750 },
      { name = "luasnip",  priority = 700 },
      { name = "path",     priority = 650 },
      { name = "buffer",   priority = 400 },
    }
  }
}
