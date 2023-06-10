return {
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "rust_analyzer",
      },
    },
  },
  {
    "lvimuser/lsp-inlayhints.nvim",
    -- branch = "anticonceal",
    event = "LspAttach",
    init = function()
      vim.api.nvim_create_augroup("LspAttach_inlayhints", {})
      vim.api.nvim_create_autocmd("LspAttach", {
        group = "LspAttach_inlayhints",
        callback = function(args)
          if not (args.data and args.data.client_id) then return end

          local client = vim.lsp.get_client_by_id(args.data.client_id)
          local bufnr = args.buf

          if client.server_capabilities.inlayHintProvider then
            local inlayhints = require "lsp-inlayhints"
            inlayhints.on_attach(client, bufnr, true)
            require("astronvim.utils").set_mappings({
              n = {
                ["<leader>uH"] = { inlayhints.toggle, desc = "Toggle inlay hints" },
              },
            }, { buffer = bufnr })
          end
        end,
      })
    end,
    opts = {
      inlay_hints = {
        highlight = "Comment",
      },
    },
  },
  {
    "Maan2003/lsp_lines.nvim",
    event = "User AstroFile",
    config = function() require("lsp_lines").setup() end,
  },

  {
    "p00f/clangd_extensions.nvim",
    dependencies = { "williamboman/mason-lspconfig.nvim" },
    ft = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
    opts = function()
      return {
        server = require("astronvim.utils.lsp").config "clangd",
        extensions = { autoSetHints = false },
      }
    end,
  },
  {
    "simrat39/rust-tools.nvim",
    dependencies = { "williamboman/mason-lspconfig.nvim" },
    ft = { "rust" },
    opts = function()
      return {
        server = require("astronvim.utils.lsp").config "rust_analyzer",
        tools = { inlay_hints = { auto = false } },
      }
    end,
  },
}
