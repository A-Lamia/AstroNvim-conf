local status = require("user.util.statusline")
THEME = require("user.util.theme").setup()

local mode_bg = {
  THEME.mode.normal,
  THEME.mode.insert,
  THEME.mode.visual,
  THEME.mode.replace,
  THEME.mode.command,
}
local grapple_bg = {
  THEME.grapple.normal,
  THEME.grapple.insert,
  THEME.grapple.visual,
  THEME.grapple.replace,
  THEME.grapple.command,
}
local macro_bg = {
  THEME.macro.normal,
  THEME.macro.insert,
  THEME.macro.visual,
  THEME.macro.replace,
  THEME.macro.command,
}


vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()

    THEME = require("user.util.theme").setup()

    mode_bg = {
      THEME.mode.normal,
      THEME.mode.insert,
      THEME.mode.visual,
      THEME.mode.replace,
      THEME.mode.command,
    }
    grapple_bg = {
      THEME.grapple.normal,
      THEME.grapple.insert,
      THEME.grapple.visual,
      THEME.grapple.replace,
      THEME.grapple.command,
    }
    macro_bg = {
      THEME.macro.normal,
      THEME.macro.insert,
      THEME.macro.visual,
      THEME.macro.replace,
      THEME.macro.command,
    }
  end
})

local mode_text_color_1 = { "#1C2A43", "#002627", "#1C1836", "#2B0000", "#1D1905" }
local mode_text_color_2 = { "#E0FFFF", "#C8F7C5", "#FFECDB", "#FFECDB", "#FFFACD" }


local heirline = function(config)
  -- the first element of the configuration table is the statusline
  config[1] = {
    -- default highlight for the entire statusline
    hl = { fg = "fg", bg = "bg" },


    -----------------------------------
    ---- NOTE: Left side of neovim.----
    -----------------------------------


    -- Vim mode compnonent, using custom
    astronvim.status.component.builder {
      { provider = status.mode },
      -- mode_text = { icon = "test", padding = { right = 1, left = 1 } },
      -- hl = function() return { fg = mode_color(mode_text_color_1) } end,
      hl = { fg = "bg" },
      surround = {
        separator = "left",
        color = function()
          return {
            main = status.mode_color(mode_bg),
            right = status.mode_color(grapple_bg)
          }
        end,
      },

    },

    -- Custom component for grapple
    astronvim.status.component.builder {
      { provider = status.get_grapple },
      hl = function() return { fg = status.set_grapple_color(mode_text_color_2) } end,
      surround = {
        separator = "left",
        color = function() return { main = status.mode_color(grapple_bg), right = status.mode_color(macro_bg) } end,
      },
    },

    -- Custom compnent for macro recordings
    astronvim.status.component.builder {
      { provider = status.macro_recording },
      hl = function() return { fg = status.mode_color(mode_text_color_2), bold = true } end,
      -- hl = { fg = "#FF6347", bold = true },
      surround = {
        separator = "left",
        color = function() return { main = status.mode_color(macro_bg), right = "bg" } end,
      },
    },


    -------------------------------------
    ---- NOTE: Center side of neovim.----
    -------------------------------------


    -- add a component for the current git branch if it exists and use no separator for the sections
    astronvim.status.component.git_branch { surround = { separator = "none" } },

    -- add a component for the current git diff if it exists and use no separator for the sections
    astronvim.status.component.git_diff { padding = { left = 1 }, surround = { separator = "none" } },

    -- fill the rest of the statusline
    -- the elements after this will appear in the middle of the statusline
    astronvim.status.component.fill(),

    -- add a component to display if the LSP is loading, disable showing running client names, and use no separator
    astronvim.status.component.lsp { lsp_client_names = false, surround = { separator = "none", color = "bg" } },

    -- fill the rest of the statusline
    -- the elements after this will appear on the right of the statusline
    astronvim.status.component.fill(),

    ------------------------------------
    ---- NOTE: Right side of neovim.----
    ------------------------------------

    -- add a component for the current diagnostics if it exists and use the right separator for the section
    astronvim.status.component.diagnostics { surround = { separator = "right" } },

    -- add a component to display LSP clients, disable showing LSP progress, and use the right separator
    astronvim.status.component.lsp { lsp_progress = false, surround = { separator = "right" } },

    {
      -- define a simple component where the provider is just a folder icon
      astronvim.status.component.builder {
        { provider = astronvim.get_icon "FolderClosed" },
        padding = { right = 1 },
        hl = { fg = "bg" },
        surround = {
          separator = "right",
          color = function() return { main = THEME.folder_icon_bg } end
        },
      },
      astronvim.status.component.builder {
        { provider = "" },
        surround = { separator = "right_accent",
          color = function() return { main = THEME.folder_icon_bg, right = THEME.folder_bg } end },
      },
      -- add a file information component and only show the current working directory name
      astronvim.status.component.file_info {
        filename = { fname = function() return vim.fn.getcwd() end, padding = { left = 0 } },
        hl = function() return { fg = THEME.folder_icon_bg } end,
        file_icon = false,
        file_modified = false,
        file_read_only = false,
        surround = {
          separator = "none",
          color = function() return THEME.folder_bg end
        },
      },
    },

    {
      astronvim.status.component.builder {
        { provider = astronvim.get_icon "DefaultFile" },
        padding = { right = 1 },
        hl = { fg = "bg" },
        surround = {
          separator = "right",
          color = function() return { main = THEME.nav_icon_bg, left = THEME.folder_bg } end
        },
      },
      astronvim.status.component.builder {
        { provider = "" },
        surround = {
          separator = "right_accent",
          color = function() return { main = THEME.nav_icon_bg, right = THEME.nav_bg } end
        },
      },
      astronvim.status.component.nav {
        percentage = { padding = { left = 0, right = 1 } },
        ruler = false,
        scrollbar = false,
        hl = function() return { fg = THEME.nav_icon_bg } end,
        surround = {
          separator = "none",
          color = function() return THEME.nav_bg end
        },
      },
    },
  }

  -- a second element in the heirline setup would override the winbar
  -- by only providing a single element we will only override the statusline
  -- and use the default winbar in AstroNvim

  -- return the final confiuration table
  return config
end
return heirline
