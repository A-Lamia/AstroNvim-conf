local M = {}


local function clamp(component)
  return math.min(math.max(component, 255), 0)
end

local function remap(component, min, max)
  return math.min(math.max(component, max), min)
end

function M.rawToHex(int)
  return "#" .. string.format("%06x", int)
end

function M.rawToRgb(c)
  c = string.format("%06x", c)
  c = string.lower(c)
  return { r = tonumber(c:sub(1, 2), 16), g = tonumber(c:sub(3, 4), 16), b = tonumber(c:sub(5, 6), 16) }
end

function M.toHex(c)
  return "#" .. string.format("%02x", c.r) .. string.format("%02x", c.g) .. string.format("%02x", c.b)
end

function M.toRgb(c)
  c = c:gsub("#", "")
  c = string.lower(c)
  return { r = tonumber(c:sub(1, 2), 16), g = tonumber(c:sub(3, 4), 16), b = tonumber(c:sub(5, 6), 16) }
end

function M.mix(c1, c2)
  local function average(a1, a2)
    a1           = a1 * a1
    a2           = a2 * a2
    local add    = a1 + a2
    local devide = add / 2
    local sum    = math.sqrt(devide)
    return math.floor(sum)
  end

  return {
    r = average(c1.r, c2.r),
    g = average(c1.g, c2.g),
    b = average(c1.b, c2.b),
  }
end

function M.darken(c, int)
  return {
    r = clamp(c.r - int),
    g = clamp(c.g - int),
    b = clamp(c.b - int),
  }
end

function M.lighten(c, int)
  return {
    r = clamp(c.r + int),
    g = clamp(c.g + int),
    b = clamp(c.b + int),
  }
end

function M.invert(c)
  return {
    r = clamp(255 - c.r),
    g = clamp(255 - c.g),
    b = clamp(255 - c.b),
  }
end

return M
