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
    require("astronvim.utils").set_mappings {
      n = {
        ["gt"] = { ":GrappleToggle<cr>", desc = "Tags current buffer" },
        ["gp"] = { ":GrapplePopup tags<cr>", desc = "Grapple tag popup menu" },
      },
    }
  end,
}
