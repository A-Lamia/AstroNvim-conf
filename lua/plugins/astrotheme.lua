return {
  {
    "AstroNvim/astrotheme",
    -- dev = true,
    lazy = false,
    priority = 1000,
    opts = {
      style = (function()
        if (vim.env.WT_SESSION or vim.env.WEZTERM) and not vim.g.neovide then
          return {
            transparent = true,
            inactive = false,
            neotree = false,
            -- popup = false,
            float = true,
            border = false,
            title_invert = true,
          }
        end
        return {
          border = false,
          inactive = false,
          title_invert = true,
        }
      end)(),

      palettes = {
        global = {},
      },

      highlights = {
        global = {
          modify_hl_groups = function(hl, c)
            local color = require "astrotheme.lib.color"
            if not vim.g.default_heirline then
              hl.Title.italic = true
              hl.FloatTitle.italic = true
              hl.TelescopePromptTitle.italic = true
              hl.TelescopePreviewTitle.italic = true

              hl.TelescopePromptNormal.blend = vim.o.winblend
              hl.TelescopeResultsNormal.blend = vim.o.winblend
              hl.TelescopePreviewNormal.blend = vim.o.winblend

              hl.NormalFloat.blend = vim.o.winblend
              hl.FloatBorder.blend = vim.o.winblend
              hl.FloatTitle.blend = vim.o.winblend

              -- hl.SpotlightNormalNC.bg = c.ui.tabline

              hl.HeirlineYellow = { fg = c.ui.yellow }
              hl.HeirlineGreen = { fg = c.ui.green }
              hl.HeirlineTextInactive = { fg = c.ui.text_inactive }

              hl.PmenuSel = { fg = c.ui.base, bg = c.ui.accent, bold = true, blend = 0 }
            end
            return hl
          end,
        },
      },
    },
    config = true,
  },
}
