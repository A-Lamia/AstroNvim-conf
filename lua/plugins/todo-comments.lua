return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    keywords = {
      DEV = {
        icon = "",
        color = "default",
        alt = { "DEVSTART", "DEVEND", "END" },
      },
      REL = {
        icon = "",
        color = "default",
        alt = { "PROD", "RELSTART", "RELEND", "PRODSTART", "PRODEND" },
      },
    },
  },
}
