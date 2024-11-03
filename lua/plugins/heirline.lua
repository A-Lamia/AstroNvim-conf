return {
  "rebelot/heirline.nvim",
  enabled = true,
  init = function()
    if not vim.g.default_heirline then
      _G.THEME = require("util.theme").setup()

      vim.api.nvim_create_autocmd("ColorScheme", {
        callback = function()
          _G.THEME = require("util.theme").setup()
        end,
      })
    end
  end,
  opts = function(_, opts)
    if not _G.THEME or vim.g.default_heirline then
      opts.winbar = nil
      opts.foldcolumn = false
      return
    end

    local icons = require "util.icons"
    local separator = require("util.icons").separator

    local status = {
      user = require "util.statusline",
      astro = require "astroui.status",
    }

    -- require("astroui.status").heirline.refresh_colors()
    -- redraw

    local mode_text_color_2 = {
      normal = "#E0FFFF",
      insert = "#C8F7C5",
      visual = "#FFECDB",
      replace = "#FFECDB",
      command = "#FFFACD",
    }

    -- the first element of the configuration table is the statusline
    opts.statusline = {
      -- default highlight for the entire statusline
      hl = { fg = "fg", bg = "bg" },

      -----------------------------------
      ---- NOTE: Left side of neovim.----
      -----------------------------------
      {
        -- Vim mode compnonent, using custom
        status.astro.component.builder {
          { provider = status.user.mode },
          hl = { fg = "bg" },
          surround = {
            separator = { "", separator.honeycomb.right },
            color = function()
              return {
                main = status.user.mode_color(THEME.mode),
                right = status.user.mode_color(THEME.grapple),
              }
            end,
          },
          update = {
            "ModeChanged",
            callback = vim.schedule_wrap(function()
              vim.cmd.redrawstatus()
            end),
          },
        },
        -- Custom component for grapple
        status.astro.component.builder {
          { provider = status.user.grapple },
          hl = function()
            return { fg = status.user.set_grapple_color(mode_text_color_2) }
          end,
          surround = {
            separator = { "", separator.honeycomb.right },
            color = function()
              return {
                main = status.user.mode_color(THEME.grapple),
                right = status.user.mode_color(THEME.tools),
              }
            end,
          },
        },
        -- Custom compnent for macro recordings
        status.astro.component.builder {
          { provider = status.user.macro_recording },
          hl = function()
            return { fg = status.user.mode_color(mode_text_color_2), bold = true }
          end,
          surround = {
            separator = { "", separator.honeycomb.right },
            color = function()
              return { main = status.user.mode_color(THEME.tools), right = "bg" }
            end,
          },
          update = {
            "RecordingEnter",
            "RecordingLeave",
            callback = vim.schedule_wrap(function()
              vim.cmd.redrawstatus()
            end),
          },
        },
      },
      -- Add spacer
      status.astro.component.builder {
        { provider = "" },
        surround = {
          separator = "left",
          -- color = { main = "blank_bg", right = "file_info_bg" },
          color = { main = "NONE", right = "file_info_bg" },
        },
      },

      -------------------------------------
      ---- NOTE: Center side of neovim.----
      -------------------------------------

      -- add a component for the current git branch if it exists and use no separator for the sections
      status.astro.component.git_branch { surround = { separator = { "", "" } } },

      -- add a component for git diff data
      status.astro.component.git_diff {
        padding = { left = 1 },
        surround = { separator = { " ", "" } },
      },

      -- fill the rest of the statusline
      -- the elements after this will appear in the middle of the statusline
      status.astro.component.fill(),

      -- add a component to display if the LSP is loading, disable showing running client names, and use no separator
      -- status.astro.component.lsp { lsp_client_names = false, surround = { separator = "none", color = "bg" } },
      status.astro.component.builder {
        { provider = status.user.lsp_status },
        surround = { separator = "none", color = "bg" },
        update = {
          "User",
          pattern = { "AstroLspProgress" },
          callback = vim.schedule_wrap(function()
            vim.cmd.redrawstatus()
          end),
        },
      },

      -- fill the rest of the statusline
      -- the elements after this will appear on the right of the statusline
      status.astro.component.fill(),

      ------------------------------------
      ---- NOTE: Right side of neovim.----
      ------------------------------------

      -- add a component for the current diagnostics if it exists and use the right separator for the section
      status.astro.component.diagnostics { surround = { separator = "right" } },

      -- add a component to display LSP clients, disable showing LSP progress, and use the right separator
      status.astro.component.lsp {
        lsp_client_names = false,
        lsp_progress = false,
        surround = { separator = "none" },
      },

      -- Add spacer
      status.astro.component.builder {
        { provider = "" },
        surround = {
          separator = "right",
          -- color = { main = "blank_bg", right = "file_info_bg" },
          color = { main = "NONE", right = "file_info_bg" },
        },
      },

      {
        -- define a simple component where the provider is just a folder icon
        status.astro.component.builder {
          { provider = icons.folder },
          padding = { right = 1 },
          hl = { fg = "bg" },
          surround = {
            separator = { separator.half_circle.left, "" },
            color = function()
              return { main = THEME.folder_icon_bg }
            end,
          },
        },
        status.astro.component.builder {
          { provider = "" },
          surround = {
            separator = { "", separator.hard_divider.right },
            color = function()
              return { main = THEME.folder_icon_bg, right = THEME.folder_bg }
            end,
          },
        },
        -- add a file information component and only show the current working directory name
        status.astro.component.file_info {
          filename = {
            fname = function(nr)
              return vim.fn.getcwd(nr)
            end,
            padding = { left = 0 },
          },
          hl = function()
            return { fg = THEME.folder_icon_bg }
          end,
          file_icon = false,
          file_modified = false,
          file_read_only = false,
          filetype = false,
          surround = {
            separator = "none",
            color = function()
              return THEME.folder_bg
            end,
          },
        },
      },

      -- add navigation information and show percentage
      {
        status.astro.component.builder {
          { provider = icons.file },
          padding = { right = 1 },
          hl = { fg = "bg" },
          surround = {
            separator = { separator.half_circle.left, "" },
            color = function()
              return { main = THEME.nav_icon_bg, left = THEME.folder_bg }
            end,
          },
        },
        status.astro.component.builder {
          { provider = "" },
          surround = {
            separator = { "", separator.hard_divider.right },
            color = function()
              return { main = THEME.nav_icon_bg, right = THEME.nav_bg }
            end,
          },
        },
        status.astro.component.nav {
          percentage = { padding = { left = 0, right = 1 } },
          ruler = false,
          scrollbar = false,
          hl = function()
            return { fg = THEME.nav_icon_bg }
          end,
          surround = {
            separator = "none",
            color = function()
              return THEME.nav_bg
            end,
          },
        },
      },
    }

    -- opts.winbar = status.astro.component.breadcrumbs {
    --   condition = status.astro.condition.is_active,
    --   hl = { fg = "winbar_fg", bg = "winbar_fg" },
    -- }

    opts.winbar = nil
    opts.foldcolumn = false

    opts.tabline[2] = status.astro.heirline.make_buflist {
      {
        provider = function(self)
          return not self.is_visible and "" or separator.half_circle.left
        end,
        hl = { fg = "buffer_bg", bg = "buffer_visible_bg" },
      },

      status.astro.component.tabline_file_info {
        hl = function(self)
          if self.is_visible then
            return { bg = "buffer_bg", italic = true, bold = true }
          else
            return {
              fg = "buffer_fg",
              bg = "buffer_visible_bg",
              italic = false,
              bold = false,
            }
          end
        end,
        close_button = false,
      },
      {
        provider = function(self)
          return not self.is_visible and "" or separator.half_circle.right
        end,
        hl = { fg = "buffer_bg", bg = "buffer_visible_bg" },
      },
    }

    opts.tabline[3] = status.astro.component.fill { hl = { bg = "buffer_visible_bg" } }

    return opts
  end,
}
