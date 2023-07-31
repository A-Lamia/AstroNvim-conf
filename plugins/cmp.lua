local border = require "user.util.border"

local style_opts = {
  border = border.default[vim.g.border],
  -- winhighlight = "Normal:NormalCmp,FloatBorder:CmpBorder,CursorLine:CmpSelect,Search:None",
}
return {
  "hrsh7th/nvim-cmp",
  opts = {
    performance = {
      debounce = 300,
      throttle = 120,
      fetching_timeout = 100
    window = {
      completion = style_opts,

      documentation = style_opts,
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
