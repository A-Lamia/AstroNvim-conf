return {
  "habamax/vim-godot",
  cmd = {
    "GodotRunCurrent",
    "GodotRunLast",
    "GodotRun",
  },
  config = function()
    vim.g.godot_executable = os.getenv("GODOT")

    local cwd = vim.fs.normalize(vim.fn.getcwd())

    local finders = require("telescope.finders")
    local pickers = require("telescope.pickers")
    local conf = require("telescope.config").values
    local actions = require("telescope.actions")
    local action_state = require("telescope.actions.state")

    local function run_scene(prompt_bufnr, map)
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local selected = action_state.get_selected_entry()
        vim.fn["godot#run"](selected.path)
      end)
      return true
    end

    local function get_files_by_end(string)
      local find = vim.fs.find(function(x) return vim.endswith(x, string) end,
        { type = "file", limit = math.huge })
      local files = {}
      if #find > 1 then
        for _, value in ipairs(find) do
          local name = vim.fs.basename(value)
          table.insert(files, { tostring(name), tostring(value) })
        end
      end
      return files
    end

    local function get_scenes(opts)
      opts = opts or {}

      local drop_down = require("telescope.themes").get_dropdown {}
      drop_down.attach_mappings = run_scene
      opts = vim.tbl_deep_extend("force", drop_down, opts)
      pickers.new(opts, {
        prompt_title = "TSCN",
        finder = finders.new_table {
          results = get_files_by_end('.tscn'),
          entry_maker = function(entry)
            return {
              value = entry,
              display = entry[1],
              ordinal = entry[1],
              path = entry[2],
            }
          end
        },
        sorter = conf.file_sorter(opts),
      }):find()
    end

    local set_command = vim.api.nvim_create_user_command
    set_command("GodotRunCurrent", "lua vim.fn['godot#run_current']()", {})
    set_command("GodotRunLast", "lua vim.fn['godot#run_last']()", {})
    -- set_command("GodotRunFZF", "lua vim.fn['godot#fzf_run_scene']()", {})
    set_command("GodotRun", function()
      get_scenes()
    end, {})

    local has_project = vim.fs.find("project.godot", { path = cwd })

    if #has_project == 1 then
      vim.api.nvim_set_keymap("n", "<F4>", ":GodotRunLast<CR>", {})
    end
  end
}
