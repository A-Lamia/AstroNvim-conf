local util = require "lspconfig.util"
-- local ols = require("mason-registry").get_package("ols"):get_install_path() .. "/ols-x86_64-pc-windows-msvc.exe"

return {
  cmd = { "ols" },
  filetypes = { "odin" },
  root_dir = util.root_pattern("ols.json", ".git"),
  single_file_support = true,
}
