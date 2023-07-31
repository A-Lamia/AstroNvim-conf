M = {}

--- Returns a 2D Array by file type with names and the paths.
--- @param fileType string: suffix of the file type.
--- @return Array
function M.get_files_by_end(fileType)
  local find = vim.fs.find(function(x) return vim.endswith(x, fileType) end, { type = "file", limit = math.huge })
  local files = {}
  if #find > 1 then
    for _, value in ipairs(find) do
      local name = vim.fs.basename(value)
      table.insert(files, { tostring(name), tostring(value) })
    end
  end
  return files
end

--- Returns true if the system is windows.
--- @return boolean
function M.is_win()
  local bool = false
  if vim.fn.has "win32" == 1 then bool = true end
  return bool
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

--- Returns table compiled to plain text.
--- Defaults to empty string.
function M.compile_table(table, indent)
  local result = ""
  local currentIndent = indent or ""
  local nextIndent = currentIndent .. " "

  result = result .. currentIndent .. "{\n"

  for key, value in pairs(table) do
    if type(key) ~= "number" then key = tostring(key) end

    if type(value) == "table" then
      result = result .. nextIndent .. key .. " = " .. M.compile_table(value, nextIndent) .. ",\n"
    elseif type(value) == "function" then
      local output = value()
      if type(output) == "table" then
        result = result .. nextIndent .. key .. " = " .. M.compile_table(output, nextIndent) .. ",\n"
      else
        result = result .. nextIndent .. key .. " = " .. tostring(output) .. ",\n"
      end
    else
      result = result .. nextIndent .. key .. " = " .. tostring(value) .. ",\n"
    end
  end

  result = result .. currentIndent .. "}"

  return result
end

return M
