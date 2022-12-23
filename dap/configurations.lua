local lldb = {
  name = "Launch",
  type = 'codelldb',
  request = "launch",
  program = function()
    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
  end,
  cwd = '${workspaceFolder}',
  stopOnEntry = false,
  args = {},
}

return {
  python = {
    {
      name = 'Launch file',
      type = 'py', -- the type here established the link to the adapter definition: `dap.adapters.python`
      request = 'launch',
      program = '${file}', -- This configuration will launch the current file if used.
    }
  },
  c = {
    lldb
  },
  cpp = {
    lldb
  },
  rust = {
    lldb
  },
  javascript = {
    {
      name = 'Launch',
      type = 'node',
      request = 'launch',
      program = '${file}',
      cwd = vim.fn.getcwd(),
      sourceMaps = true,
      protocol = 'inspector',
      console = 'integratedTerminal',
    },
    -- {
    --   -- For this to work you need to make sure the node process is started with the `--inspect` flag.
    --   name = 'Attach to process - test',
    --   type = 'node',
    --   request = 'attach',
    --   processId = require 'dap.utils'.pick_process,
    -- },
  }
}
