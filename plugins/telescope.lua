return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "debugloop/telescope-undo.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
  },
  opts = function(_, opts)
    local actions = require "telescope.actions"
    return require("astronvim.utils").extend_tbl(opts, {
      defaults = {
        winblend = vim.g.winblend + 10,
        selection_caret = "  ",
        layout_config = {
          width = 0.90,
          height = 0.85,
          preview_cutoff = 120,
          horizontal = {
            preview_width = 0.6,
          },
          vertical = {
            width = 0.9,
            height = 0.95,
            preview_height = 0.5,
          },
          flex = {
            horizontal = {
              preview_width = 0.9,
            },
          },
        },
      },
      pickers = {
        buffers = {
          path_display = { "smart" },
          mappings = {
            i = {
              ["<c-d>"] = actions.delete_buffer,
              ["<Tab>"] = actions.select_default,
            },
            n = {
              ["d"] = actions.delete_buffer,
              ["<Tab>"] = actions.select_default,
            },
          },
        },
      },
    })
  end,
  config = function(...)
    require "plugins.configs.telescope"(...)
    local telescope = require "telescope"
    telescope.load_extension "undo"
    telescope.load_extension "file_browser"
  end,
}
