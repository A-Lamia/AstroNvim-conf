return {
  "cbochs/grapple.nvim",
  -- branch = "dev",
  lazy = false,
  config = function()
    require("grapple").setup {
      setup = require("grapple.scope").fallback {
        require("grapple").resolvers.lsp_fallback,
        require("grapple").resolvers.git_fallback,
        require("grapple").resolvers.static,
      },
    }
  end,
}
