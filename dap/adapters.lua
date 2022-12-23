local CODELLDB_DIR = require('mason-registry').get_package('codelldb'):get_install_path() ..
    '/extension/adapter/codelldb'
local PYTHON_DIR = require('mason-registry').get_package('debugpy'):get_install_path() ..
    '/venv/Scripts/python'
local NODE_DIR = require('mason-registry').get_package('node-debug2-adapter'):get_install_path() ..
    '/out/src/nodeDebug.js'

return {
  codelldb = {
    name = 'codelldb',
    type = 'server',
    host = '127.0.0.1',
    port = '${port}',
    executable = {
      command = CODELLDB_DIR,
      args = { '--port', "${port}" }
    },
    detatched = false,
  },
  py = {
    -- name = 'py',
    type = 'executable',
    command = PYTHON_DIR,
    args = { '-m', "debugpy.adapter" },
    detatched = false,
  },
  node = {
    type = 'executable',
    command = 'node',
    args = { NODE_DIR }
  },
}
