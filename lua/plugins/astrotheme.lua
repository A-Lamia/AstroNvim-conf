return {
  {
    "AstroNvim/astrotheme",
    dev = true,
    lazy = false,
    -- priority = 1000,
    opts = {
      dev = true,
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
          modify_hl_groups = function(hl, C)
            hl.Title.italic = true
            hl.FloatTitle.italic = true
            hl.TelescopePromptTitle.italic = true
            hl.TelescopePreviewTitle.italic = true
            --
            local blend_fix = (vim.o.winblend == 0 and 0)
              or (vim.g.neovide and 100)
              or (vim.env.WEZTERM and vim.o.winblend)
              or 0
            hl.TelescopePromptNormal.blend = blend_fix
            hl.TelescopeResultsNormal.blend = blend_fix
            hl.TelescopePreviewNormal.blend = blend_fix

            -- hl.SpotlightNormalNC.bg = C.ui.tabline

            hl.HeirlineYellow = { fg = C.ui.yellow }
            hl.HeirlineGreen = { fg = C.ui.green }
            hl.HeirlineTextInactive = { fg = C.ui.text_inactive }

            hl.PmenuSel = { fg = C.ui.base, bg = C.ui.accent, bold = true, blend = 0 }
            return hl
          end,
        },
      },
    },
    -- config = true,
  },
}
