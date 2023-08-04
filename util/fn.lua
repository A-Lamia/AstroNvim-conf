M = {}

--- Returns a 2D Array by file type with names and the paths.
--- @param fileType string: suffix of the file type.
--- @return Array
function M.get_files_by_end(fileType, path)
  fileType = (".*%." .. fileType .. "$") or ""
  path = path or false

  local function match_file(name)
    return name:match(fileType)
  end

  local find = vim.fs.find(match_file, { type = "file", limit = math.huge })
  local files = {}

  if #find > 1 then
    if path then
      for _, value in ipairs(find) do
        local name = vim.fs.basename(value)
        local new_path = value:gsub(vim.fn.getcwd(), "")
        table.insert(files, { tostring(name), tostring(new_path) })
      end
    else
      for _, value in ipairs(find) do
        local name = vim.fs.basename(value)
        table.insert(files, { tostring(name), tostring(value) })
      end
    end
  end

  return files
end

--- Returns working directory.
--- @return string
function M.is_win()
  return ""
end

--- Returns the active buffers path or name.
--- Defaults to name.
--- @param fullPath boolean? Default is false
--- @return string
function M.get_buffer_name(fullPath)
  fullPath = fullPath or false
  local buffer_name
  if fullPath == true then
    buffer_name = vim.api.nvim_buf_get_name(0)
  else
    buffer_name = string.match(vim.api.nvim_buf_get_name(0), "(%w+)$")
  end
  return buffer_name
end

--- Clears the extmark on all windows.
--- @param name string Default is false
function M.clear_extmark(name)
  local ns_id = vim.api.nvim_get_namespaces()[name]
  local window_ids = vim.api.nvim_list_wins()
  local bufnr
  for _, winid in pairs(window_ids) do
    bufnr = vim.api.nvim_win_get_buf(winid)
    vim.api.nvim_buf_clear_namespace(bufnr, ns_id, 0, -1)
  end
end

return M
