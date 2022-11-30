require("grapple").setup({
  setup = require("grapple.scope").fallback({
    require("grapple.scope").resolvers.lsp_fallback,
    require("grapple.scope").resolvers.git_fallback,
    require("grapple.scope").resolvers.static
  })
})
