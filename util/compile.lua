local M = {}

--- Returns table compiled to plain text.
--- Defaults to empty string.
function M.compile_table(tbl, indent)
  local result = ""
  local current_indent = indent or ""
  local next_indent = current_indent .. " "

  local function build_line(key, value)
    result = table.concat {
      result,
      next_indent,
      key and key .. " = " or "",
      value,
      ",\n",
    }
  end

  result = table.concat {
    result,
    current_indent,
    "{\n",
  }

  for key, value in pairs(tbl) do
    if type(key) ~= "number" then
      key = tostring(key)
    else
      key = false
    end

    if type(value) == "function" then
      value = value()
    end

    if type(value) == "table" then
      build_line(key, M.compile_table(value, next_indent))
      goto continue
    end

    if type(value) == "string" then
      build_line(key, tostring('"' .. value .. '"'))
    else
      build_line(key, tostring(value))
    end

    ::continue::
  end

  result = table.concat {
    result,
    current_indent,
    "}",
  }

  return result
end

return M
