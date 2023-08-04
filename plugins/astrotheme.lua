return {
  {
    "AstroNvim/astrotheme",
    dev = true,
    lazy = false,
    -- config = true,
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
        -- vim.g.border = "round"
        return {
          border = false,
          -- inactive = false,
          title_invert = true,
        }
      end)(),
      highlights = {
        global = {
          modify_hl_groups = function(hl)
            hl.Title.italic = true
            hl.PopupTitle.italic = true

            local blend_fix = (vim.g.neovide and vim.o.winblend and 100)
              or (vim.env.WEZTERM and vim.o.winblend)
              or 0
            hl.TelescopePromptNormal.blend = blend_fix
            hl.TelescopeResultsNormal.blend = blend_fix
            hl.TelescopePreviewNormal.blend = blend_fix

            -- hl.NotifyERRORBorder = (vim.g.neovide and vim.o.winbar and 100) or 0
            -- hl.NotifyWARNBorder = (vim.g.neovide and vim.o.winbar and 100) or 0
            -- hl.NotifyINFOBorder = (vim.g.neovide and vim.o.winbar and 100) or 0
            -- hl.NotifyDEBUGBorder = (vim.g.neovide and vim.o.winbar and 100) or 0
            -- hl.NotifyTRACERBorder = (vim.g.neovide and vim.o.winbar and 100) or 0
            -- hl.NotifyERRORBorder = (vim.g.neovide and vim.o.winbar and 100) or 0
          end,
        },
        astrodark = {},
      },
    },
  },
}
