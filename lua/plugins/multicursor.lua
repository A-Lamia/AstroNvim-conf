return {
  "jake-stewart/multicursor.nvim",
  branch = "1.0",
  keys = function()
    local mc = require "multicursor-nvim"

    return {
      {
        "<up>",
        function()
          mc.addCursor "k"
        end,
        desc = "Add cursors above the main cursor",
        mode = { "n", "v" },
      },
      {
        "<down>",
        function()
          mc.addCursor "j"
        end,
        desc = "Add cursors bellow the main cursor",
        mode = { "n", "v" },
      },
      {
        "<c-n>",
        function()
          mc.addCursor "*"
        end,
        desc = "Jump to the next word under cursor but do not add a cursor",
        mode = { "n", "v" },
      },
      {
        "<c-s>",
        function()
          mc.skipCursor "*"
        end,
        desc = "Jump to the next word under cursor but do not add a cursor",
        mode = { "n", "v" },
      },
      {
        "<left>",
        mc.nextCursor,
        desc = "Move cursor left",
        mode = { "n", "v" },
      },
      {
        "<right>",
        mc.prevCursor,
        desc = "Move cursor right",
        mode = { "n", "v" },
      },
      {
        "<leader>xx",
        mc.deleteCursor,
        desc = "Delete main cursor",
        mode = { "n", "v" },
      },
      {
        "<c-leftmouse>",
        mc.handleMouse,
        desc = "Add cursor",
        mode = { "n" },
      },
      {
        "<c-q>",
        function()
          if mc.cursorsEnabled() then
            -- Stop other cursors from moving.
            -- This allows you to reposition the main cursor.
            mc.disableCursors()
          else
            mc.addCursor()
          end
        end,
        desc = "Stop sub curosors from moving",
        mode = { "n", "v" },
      },
      {
        "<esc>",
        function()
          if not mc.cursorsEnabled() then
            mc.enableCursors()
          elseif mc.hasCursors() then
            mc.clearCursors()
          else
            -- Default <esc> handler.
          end
        end,
        desc = "Clear cursors",
        mode = { "n" },
      },
      {
        "<leader>a",
        mc.alignCursors,
        desc = "Align Cursor Columns",
        mode = { "n" },
      },
      {
        "S",
        mc.splitCursors,
        desc = "Split visual selection by regex",
        mode = { "v" },
      },
      {
        "I",
        mc.insertVisual,
        desc = "Insert for each line of visual selection",
        mode = { "v" },
      },
      {
        "A",
        mc.appendVisual,
        desc = "Append for each line of visual selection",
        mode = { "v" },
      },
      {
        "M",
        mc.matchCursors,
        desc = "match new cursors within cisual selection regex",
        mode = { "v" },
      },
      {
        "<leader>t",
        function()
          mc.transposeCursors(1)
        end,
        desc = "Rotate visual selection contents",
        mode = { "v" },
      },
      {
        "<leader>T",
        function()
          mc.transposeCursors(-1)
        end,
        desc = "Rotate visual selection contents",
        mode = { "v" },
      },
    }
  end,
  config = function()
    local mc = require "multicursor-nvim"
    mc.setup()
    -- Customize how cursors look.
    vim.api.nvim_set_hl(0, "MultiCursorCursor", { link = "Cursor" })
    vim.api.nvim_set_hl(0, "MultiCursorVisual", { link = "Visual" })
    vim.api.nvim_set_hl(0, "MultiCursorDisabledCursor", { link = "Visual" })
    vim.api.nvim_set_hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
  end,
}
