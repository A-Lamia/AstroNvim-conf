return {
  "Exafunction/codeium.vim",
  cmd = "Codeium",
  init = function()
    vim.g.codeium_enabled = 0
    vim.g.codeium_disable_bindings = 1
    vim.g.codeium_idle_delay = 1500
    -- match function
  end,
  config = function()
    vim.keymap.set("i", "<C-CR>", function() return vim.fn["codeium#Accept"]() end, { expr = true })
    vim.keymap.set("i", "<S-Left>", function() return vim.fn["codeium#CycleCompletions"](1) end, { expr = true })
    vim.keymap.set("i", "<S-Right>", function() return vim.fn["codeium#CycleCompletions"]( -1) end, { expr = true })
    vim.keymap.set("i", "<C-BS>", function() return vim.fn["codeium#Clear"]() end, { expr = true })

    vim.api.nvim_set_hl(0, "CodeiumSuggestion", { link = "Comment" })
  end,
}
