local cmp = require "cmp"
local border = require "util.border"

local style_opts = {
  border = border.default[vim.g.border],
  -- winhighlight = "Normal:NormalCmp,FloatBorder:CmpBorder,CursorLine:CmpSelect,Search:None",
}

return {
  "iguanacucumber/magazine.nvim",
  name = "nvim-cmp",
  opts = {
    window = {
      completion = style_opts,
      documentation = style_opts,
    },

    experimental = {
      ghost_text = true,
      native_menu = false,
    },

    sources = {
      { name = "luasnip", priority = 700 },
      { name = "path", priority = 600, keyword_length = 5 },
      { name = "buffer", priority = 550 },
    },
    --
    --   sorting = {
    --     comparators = {
    --       cmp.config.compare.offset,
    --       cmp.config.compare.exact,
    --       cmp.config.compare.score,
    --
    --       -- copied from cmp-under, but I don't think I need the plugin for this.
    --       -- I might add some more of my own.
    --       function(entry1, entry2)
    --         local _, entry1_under = entry1.completion_item.label:find "^_+"
    --         local _, entry2_under = entry2.completion_item.label:find "^_+"
    --         entry1_under = entry1_under or 0
    --         entry2_under = entry2_under or 0
    --         if entry1_under > entry2_under then
    --           return false
    --         elseif entry1_under < entry2_under then
    --           return true
    --         end
    --       end,
    --
    --       cmp.config.compare.locality,
    --       cmp.config.compare.kind,
    --       cmp.config.compare.sort_text,
    --       cmp.config.compare.length,
    --       cmp.config.compare.order,
    --     },
    --   },
  },
}

-- return {
--   "hrsh7th/nvim-cmp",
--   enabled = false,
--   opts = {
--     window = {
--       completion = style_opts,
--       documentation = style_opts,
--     },
--
--     experimental = {
--       ghost_text = true,
--       native_menu = false,
--     },
--
--     sources = {
--       -- { name = "nvim_lsp", priority = 900 },
--       { name = "luasnip", priority = 700 },
--       -- { name = "codeium", priority = 650 },
--       { name = "path", priority = 600, keyword_length = 5 },
--       { name = "buffer", priority = 550 },
--     },
--     --
--     --   sorting = {
--     --     comparators = {
--     --       cmp.config.compare.offset,
--     --       cmp.config.compare.exact,
--     --       cmp.config.compare.score,
--     --
--     --       -- copied from cmp-under, but I don't think I need the plugin for this.
--     --       -- I might add some more of my own.
--     --       function(entry1, entry2)
--     --         local _, entry1_under = entry1.completion_item.label:find "^_+"
--     --         local _, entry2_under = entry2.completion_item.label:find "^_+"
--     --         entry1_under = entry1_under or 0
--     --         entry2_under = entry2_under or 0
--     --         if entry1_under > entry2_under then
--     --           return false
--     --         elseif entry1_under < entry2_under then
--     --           return true
--     --         end
--     --       end,
--     --
--     --       cmp.config.compare.locality,
--     --       cmp.config.compare.kind,
--     --       cmp.config.compare.sort_text,
--     --       cmp.config.compare.length,
--     --       cmp.config.compare.order,
--     --     },
--     --   },
--   },
-- }
