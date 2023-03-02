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

    local telescope = require("user.util.telescope")
    local actions = telescope.actions
    local actions_state = telescope.actions_state

    local function run_scene(prompt_bufnr, map)
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local selected = actions_state.get_selected_entry()
        vim.fn["godot#run"](selected.path)
      end)
      return true
    end

    local set_command = vim.api.nvim_create_user_command
    set_command("GodotRunCurrent", "lua vim.fn['godot#run_current']()", {})
    set_command("GodotRunLast", "lua vim.fn['godot#run_last']()", {})
    set_command("GodotRun", function()
      telescope.run_func_on_file({
        name = "TSCN",
        attach_mappings = run_scene,
        results = require("user.util.fn").get_files_by_end,
        results_args = ".tscn",
      })
    end, {})

    local has_project = vim.fs.find("project.godot", { path = cwd })

    if #has_project == 1 then
      vim.api.nvim_set_keymap("n", "<F4>", ":GodotRunLast<CR>", {})
    end
  end
}
