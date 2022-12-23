local M = {}


local function clamp(int)
  return math.max(math.min(int, 255), 0)
end

local function remap(int, min, max)
  return math.max(math.min(int, max), min)
end

function M.rawToHex(raw)
  return "#" .. string.format("%06x", raw)
end

function M.rawToRgb(raw)
  raw = string.format("%06x", raw)
  raw = string.lower(raw)
  return {
    r = tonumber(raw:sub(1, 2), 16),
    g = tonumber(raw:sub(3, 4), 16),
    b = tonumber(raw:sub(5, 6), 16),
  }
end

function M.toHex(rgb)
  return table.concat({
    "#",
    string.format("%02x", rgb.r),
    string.format("%02x", rgb.g),
    string.format("%02x", rgb.b),
  })
end

function M.toRgb(hex)
  hex = hex:gsub("#", "")
  hex = string.lower(hex)
  return {
    r = tonumber(hex:sub(1, 2), 16),
    g = tonumber(hex:sub(3, 4), 16),
    b = tonumber(hex:sub(5, 6), 16),
  }
end

function M.mix(rgb1, rgb2)
  local function average(c1, c2)
    c1           = c1 * c1
    c2           = c2 * c2
    local add    = c1 + c2
    local devide = add / 2
    local sum    = math.sqrt(devide)
    return math.floor(sum)
  end

  return {
    r = average(rgb1.r, rgb2.r),
    g = average(rgb1.g, rgb2.g),
    b = average(rgb1.b, rgb2.b),
  }
end

function M.darkenPercent(rgb, percent)
  local float = percent * 0.01
  return {
    r = clamp((rgb.r * (-float)) + rgb.r),
    g = clamp((rgb.g * (-float)) + rgb.g),
    b = clamp((rgb.b * (-float)) + rgb.b),
  }
end

function M.darken(rgb, int)
  return {
    r = clamp(rgb.r - int),
    g = clamp(rgb.g - int),
    b = clamp(rgb.b - int),
  }
end

function M.hue(rgb, percent)
  local float = 1 + (percent * 0.01)
  return {
    r = clamp(rgb.r * float),
    g = clamp(rgb.g * float),
    b = clamp(rgb.b * float),
  }
end

function M.lighten(rgb, int)
  return {
    r = clamp(rgb.r + int),
    g = clamp(rgb.g + int),
    b = clamp(rgb.b + int),
  }
end

function M.invert(rgb)
  return {
    r = clamp(255 - rgb.r),
    g = clamp(255 - rgb.g),
    b = clamp(255 - rgb.b),
  }
end

function M.invertValue(rgb)
  local r = rgb.r
  local g = rgb.g
  local b = rgb.b

  if r > g and r > b then
    r = 255 - r
  elseif g > r and g > b then
    g = 255 - g
  elseif b > r and b > g then
    b = 255 - b
  end

  return {
    r = clamp(r),
    g = clamp(g),
    b = clamp(b),
  }
end

-- Algorithm based on http://alienryderflex.com/hsp.html
function M.getValue(rgb)
  return (0.299 * rgb.r) + (0.587 * rgb.g) + (0.114 * rgb.b)
end

function M.getOffset(rgb, origin, amount)
  local main_value = M.getValue(rgb)
  local origin_value = M.getValue(origin)
  local difference = math.abs(origin_value - main_value)
  local max_offset_amount = amount
  local offset_amount = 0

  if max_offset_amount >= difference then
    offset_amount = offset_amount
  elseif main_value > origin_value then
    offset_amount = max_offset_amount - difference
  elseif main_value < origin_value then
    offset_amount = max_offset_amount + difference
  elseif main_value == origin_value then
    offset_amount = max_offset_amount
  end
  return offset_amount

end

return M
