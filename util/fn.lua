M = {}

function M.get_files_by_end(string) --> table
  local find = vim.fs.find(function(x) return vim.endswith(x, string) end, { type = "file", limit = math.huge })
  local files = {}
  if #find > 1 then
    for _, value in ipairs(find) do
      local name = vim.fs.basename(value)
      table.insert(files, { tostring(name), tostring(value) })
    end
  end
  return files
end

function M.is_win()
  local bool = false
  if vim.fn.has "win32" == 1 then bool = true end
  return bool
end

return M
