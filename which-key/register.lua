return {
  n = {
    ["<M-f>"] = {
      name = "Hop",
      f = { "<cmd>HopChar1<cr>", "Hop to Char 1." },
      F = { "<cmd>HopChar2<cr>", "Hop to Char 2." },
      j = { "<cmd>HopChar1AC<cr>", "Hop to Char 1 after cursor." },
      J = { "<cmd>HopLineAC<cr>", "Hop to line after cursor." },
      k = { "<cmd>HopChar1BC<cr>", "Hop to Char 1 before cursor." },
      K = { "<cmd>HopLineBC<cr>", "Hop to line before cursor." },
      h = { "<cmd>HopChar1CurrentLineBC<cr>", "Hop current line before cursor." },
      l = { "<cmd>HopChar1CurrentLineAC<cr>", "Hop current line after cursor." },
      L = { "<cmd>HopLine<cr>", "Hop to line." },
      ["w"] = { "<cmd>HopWord<cr>", "Hop to word." },
      ["Wa"] = { "<cmd>HopWordAC<cr>", "Hop to word after cursor." },
      ["Wb"] = { "<cmd>HopWordBC<cr>", "Hop to word before cursor." },
      ["Wm"] = { "<cmd>HopWordMW<cr>", "Hop to char in multi windows." },
      ["p"] = { "<cmd>HopPattern<cr>", "Hop to current line before cursor." },
      ["/"] = { "<cmd>HopPatternMW<cr>", "Hop to pattern in multi windows." },
    },
  },

  -- Visual
  v = {
    ["<M-f>"] = {
      name = "Hop",
      f = { "<cmd>HopChar1<cr>", "Hop to Char 1." },
      F = { "<cmd>HopChar2<cr>", "Hop to Char 2." },
      j = { "<cmd>HopChar1AC<cr>", "Hop to Char 1 after cursor." },
      J = { "<cmd>HopLineAC<cr>", "Hop to line after cursor." },
      k = { "<cmd>HopChar1BC<cr>", "Hop to Char 1 before cursor." },
      K = { "<cmd>HopLineBC<cr>", "Hop to line before cursor." },
      h = { "<cmd>HopChar1CurrentLineBC<cr>", "Hop current line before cursor." },
      l = { "<cmd>HopChar1CurrentLineAC<cr>", "Hop current line after cursor." },
      L = { "<cmd>HopLine<cr>", "Hop to line." },
      ["w"] = { "<cmd>HopWord<cr>", "Hop to word." },
      ["Wa"] = { "<cmd>HopWordAC<cr>", "Hop to word after cursor." },
      ["Wb"] = { "<cmd>HopWordBC<cr>", "Hop to word before cursor." },
      ["Wm"] = { "<cmd>HopWordMW<cr>", "Hop to char in multi windows." },
      ["p"] = { "<cmd>HopPattern<cr>", "Hop to current line before cursor." },
      ["/"] = { "<cmd>HopPatternMW<cr>", "Hop to pattern in multi windows." },
    },
  },
}
