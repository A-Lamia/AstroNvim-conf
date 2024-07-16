local border = require "util.border"

return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  keys = {
    "<C-p>",
    "<C-S-p>",
    "<C-f>",
    "<TAB>",
  },
  dependencies = {
    "debugloop/telescope-undo.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      enabled = vim.fn.executable "make" == 1,
      build = "make",
    },
  },
  opts = function(_, opts)
    -- local telescope = require "telescope"
    -- telescope.load_extension "undo"

    local actions = require "telescope.actions"

    local tbl = vim.tbl_deep_extend("force", (opts or {}), {
      defaults = {
        file_ignore_patterns = {
          "%.jpg",
          "%.gif",
          "%.png",
          "%.tif",
          "%.tiff",
          "%.tga",
          "%.o$",
          "%.dll",
          "%.pyc",
          "%.exe",
          "%.fbx",
          "%.obj",
          "%.gltf",
          "%.glb",
        },
        winblend = vim.o.winblend,
        -- borderchars = {
        --   prompt = border.telescope[vim.g.border],
        --   results = border.telescope[vim.g.border],
        --   preview = border.telescope[vim.g.border],
        -- },
        prompt_title = false,
        results_title = false,
        dynamic_preview_title = true,
        selection_caret = "",
        prompt_prefix = " ",
        path_display = { "truncate" },
        sorting_strategy = "ascending",
        layout_strategy = "flex",
        -- layout_config = {
        --   -- width = 0.90,
        --   -- height = 0.85,
        --
        --   horizontal = {
        --     prompt_position = "top",
        --     preview_width = 0.6,
        --     preview_cutoff = 120,
        --   },
        --   vertical = {
        --     width = 0.9,
        --     height = 0.9,
        --     -- preview_cutoff = 0,
        --     -- preview_height = 0.5,
        --     prompt_position = "top",
        --     -- mirror = true,
        --   },
        --   flex = {
        --     flip_columns = 120,
        --     -- horizontal = {
        --     --   preview_width = 0.9,
        --     -- },
        --   },
        -- },
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
    }) or opts

    require("util.map").set_keymaps {
      mode = "n",
      { "<C-p>", "<cmd>Telescope fd<CR>", desc = "Activates Telescope fd" },
      {
        "<C-S-p>",
        "<cmd>Telescope commands<CR>",
        desc = "Activates Telescope commands",
      },
      {
        "<C-f>",
        "<cmd>Telescope live_grep<CR>",
        desc = "Activates Telescope live_grep",
      },
      {
        "<Tab>",
        function()
          if #vim.t.bufs > 1 then
            require("telescope.builtin").buffers {
              sort_mru = true,
              ignore_current_buffer = true,
            }
          else
            require "notify" { "No other buffers open" }
          end
        end,
        desc = "Switch Buffers",
      },
      -- {"<C-z>", "<cmd>Telescope undo<CR>" },
    }

    return tbl
  end,
}
