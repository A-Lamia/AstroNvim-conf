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
    branch = "anticonceal",
    event = "LspAttach",
    init = function()
      vim.api.nvim_create_augroup("LspAttach_inlayhints", {})
      vim.api.nvim_create_autocmd("LspAttach", {
        group = "LspAttach_inlayhints",
        callback = function(args)
          if not (args.data and args.data.client_id) then return end

          local client = vim.lsp.get_client_by_id(args.data.client_id)
          local bufnr = args.buf

          -- vim.api.nvim_buf_set_var(bufnr, "inlayhints_active", false)
          if client.server_capabilities.inlayHintProvider then
            local inlayhints = require "lsp-inlayhints"
            inlayhints.on_attach(client, bufnr, false)
            vim.api.nvim_buf_set_var(bufnr, "inlayhints_active", true)
            -- if not enabled then inlayhints.toggle() end

            local function toggle()
              inlayhints.toggle()
              if vim.g.inlayhints then
                vim.g.inlayhints = false
              else
                vim.g.inlayhints = true
              end
            end
            require("astronvim.utils").set_mappings({
              n = {
                ["<leader>uH"] = { toggle, desc = "Toggle inlay hints" },
              },
            }, { buffer = bufnr })
          end
        end,
      })
    end,
    opts = {
      enabled_at_startup = vim.g.inlayhints,
      inlay_hints = {
        highlight = "Comment",
        only_current_line = false,
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
