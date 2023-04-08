-- local fn = require "user.util.fn"
-- local telescope = require "user.util.telescope"

return {
  "mfussenegger/nvim-dap",
  enabled = true,
  dependencies = {
    -- { "theHamsta/nvim-dap-virtual-text", config = true },
  },
  config = function()
    local dap = require "dap"
    local CODELLDB_DIR = require("mason-registry").get_package("codelldb"):get_install_path()
      .. "/extension/adapter/codelldb"
    local PYTHON_DIR = require("mason-registry").get_package("debugpy"):get_install_path() .. "/venv/Scripts/python"
    local NODE_DIR = require("mason-registry").get_package("node-debug2-adapter"):get_install_path()
      .. "/out/src/nodeDebug.js"

    dap.adapters.codelldb = {
      name = "codelldb",
      type = "server",
      host = "127.0.0.1",
      port = "${port}",
      executable = {
        command = CODELLDB_DIR,
        args = { "--port", "${port}" },
      },
      detatched = false,
    }
    dap.adapters.py = {
      -- name = 'py',
      type = "executable",
      command = PYTHON_DIR,
      args = { "-m", "debugpy.adapter" },
      detatched = false,
    }
    dap.adapters.node = {
      type = "executable",
      command = "node",
      args = { NODE_DIR },
    }

    -- configurations --

    dap.configurations.python = {
      {
        name = "Launch file",
        type = "py", -- the type here established the link to the adapter definition: `dap.adapters.python`
        request = "launch",
        program = "${file}", -- This configuration will launch the current file if used.
      },
    }

    local function set_program()
      local function run_scene(prompt_bufnr, map)
        telescope.actions.select_default:replace(function()
          telescope.actions.close(prompt_bufnr)
          local selected = telescope.actions_state.get_selected_entry()
          vim.g.dap_program = selected.path
        end)
        return true
      end
      telescope.run_func_on_file {
        name = "Executable",
        attach_mappings = run_scene,
        results = fn.get_files_by_end,
        results_args = fn.is_win() and ".exe" or "",
      }
      return true
    end

    require("astronvim.utils").set_mappings {
      n = {
        ["<leader>de"] = { set_program, desc = "Set program path" },
      },
    }

    local lldb = {
      name = "Launch",
      type = "codelldb",
      request = "launch",
      program = function()
        if not vim.g.dap_program or #vim.g.dap_program == 0 then
          vim.g.dap_program = vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end
        return vim.g.dap_program
      end,
      cwd = "${workspaceFolder}",
      stopOnEntry = false,
      args = {},
    }

    dap.configurations.c = {
      lldb,
    }
    dap.configurations.cpp = {
      lldb,
    }
    dap.configurations.rust = {
      lldb,
    }
    dap.configurations.javascript = {
      {
        name = "Launch",
        type = "node",
        request = "launch",
        program = "${file}",
        cwd = vim.fn.getcwd(),
        sourceMaps = true,
        protocol = "inspector",
        console = "integratedTerminal",
      },
      {
        -- For this to work you need to make sure the node process is started with the `--inspect` flag.
        name = "Attach to process - test",
        type = "node",
        request = "attach",
        processId = require("dap.utils").pick_process,
      },
    }
  end,
}
