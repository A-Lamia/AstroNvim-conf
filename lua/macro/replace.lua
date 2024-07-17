M = {}

local function check_char(byte)
  if byte == nil then
    return false
  elseif byte == 95 then
    return true
  elseif byte >= 65 and byte <= 90 then
    return true
  elseif byte >= 97 and byte <= 122 then
    return true
  end

  return false
end

function M.under_cursor()
  vim.cmd "normal! yiw"
  local yanked = vim.fn.getreg "0"
  local format = yanked
  local cursor_position = vim.api.nvim_win_get_cursor(0)

  local ns_id = vim.api.nvim_create_namespace "replace_hl_ns"
  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)

  for lnum, line in ipairs(lines) do
    local word_start, word_end, _ = string.find(line, format)
    while word_start do
      if not check_char(line:byte(word_end + 1)) then
        vim.api.nvim_buf_set_extmark(0, ns_id, lnum - 1, word_start - 1, {
          end_col = word_end,
          hl_group = "StatusReplace",
        })
      end
      word_start, word_end = string.find(line, format, word_end + 1)
    end
  end

  vim.ui.input({ prompt = "Replace: " }, function(input)
    if not input then
      vim.api.nvim_buf_clear_namespace(0, ns_id, 0, -1)
      return
    end

    vim.cmd(":%s/\\C\\<" .. yanked .. "\\>/" .. input .. "/g")
    vim.api.nvim_win_set_cursor(0, cursor_position)
    vim.api.nvim_buf_clear_namespace(0, ns_id, 0, -1)
  end)
end

return M
