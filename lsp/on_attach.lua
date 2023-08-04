local border = require "user.util.border"
return function(client, bufnr)
  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = border.default[vim.g.border],
  })
  vim.lsp.handlers["textDocument/signatureHelp"] =
    vim.lsp.with(vim.lsp.handlers.signature_help, {
      border = border.default[vim.g.border],
    })
  vim.diagnostic.config {
    float = { border = border.default[vim.g.border] },
  }
end
