M = {
  style = {
    line = { "|", "/", "-", "\\" },
    arrow = { "←", "↖", "↑", "↗", "→", "↘", "↓", "↙" },
    binary = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" },
    rectangle = { "⣷", "⣯", "⣟", "⡿", "⢿", "⣻", "⣽", "⣾" },
    star = { "✶", "✷", "✸", "✹", "✺", "✹", "✸", "✷" },
    half_circle = { "◐", "◓", "◑", "◒" },
    circle = { "󰪞", "󰪟", "󰪠", "󰪡", "󰪢", "󰪣", "󰪤", "󰪥" },
    hexagon = { "󰫃", "󰫄", "󰫅", "󰫆", "󰫇", "󰫈" },
    smiley = { "😭", "😅", "😀", "😃", "😄", "😁", "😆", "😂", "🤣" },
  },
  kind = {},
}

function M:new(style)
  local object = {}
  object.kind = style or self.binary

  setmetatable(object, self)
  self.__index = self

  return object
end

function M:loading(percent)
  local spinner = self.kind
  local frame = (percent % #spinner) + 1 or #spinner
  return spinner[frame]
end

function M:prog(percent)
  local spinner = self.kind
  local frame = math.floor(((percent + 20) * (#spinner / 120)))
  -- can be used if you want 100% safety.
  -- local safe_frame = timer < #spinner and timer or #spinner
  return spinner[frame]
end

function M:len()
  return #self.func.kind
end

return M
