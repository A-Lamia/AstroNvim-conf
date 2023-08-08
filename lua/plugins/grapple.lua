local border = require "util.border"

return {
  "cbochs/grapple.nvim",
  -- branch = "dev",
  lazy = false,
  config = function()
    require("grapple").setup {
      popup_options = {
        border = border.default[vim.g.border],
      },
      setup = require("grapple.scope").fallback {
        require("grapple").resolvers.lsp_fallback,
        require("grapple").resolvers.git_fallback,
        require("grapple").resolvers.static,
      },
    }

    require("util.map").set_keymaps {
      n = {
        ["gt"] = { ":GrappleToggle<cr>", desc = "Tags current buffer" },
        ["gp"] = { ":GrapplePopup tags<cr>", desc = "Grapple tag popup menu" },
      },
    }
  end,
}
