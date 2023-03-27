local M = {
  data = 0,
  luminanceMode = 1,
}

function M.round(x) return x >= 0 and math.floor(x + 0.5) or math.ceil(x - 0.5) end

local function clamp(int) return math.max(math.min(int, 255), 0) end

local function remap(int, min, max) return math.max(math.min(int, max), min) end

function M.max(rgb)
  local max = math.max(rgb.r, rgb.g, rgb.b)
  local max_rgb = { value = max }

  for channel, value in pairs(rgb) do
    if value == max then max_rgb.channel = channel end
  end

  return max_rgb
end

function M.min(rgb)
  local min = math.min(rgb.r, rgb.g, rgb.b)
  local min_rgb = { value = min }

  for channel, value in pairs(rgb) do
    if value == min then min_rgb.channel = channel end
  end

  return min_rgb
end

local function order(rgb)
  local min = M.min(rgb)
  local max = M.max(rgb)
  local mid = (function()
    for channel, value in pairs(rgb) do
      if max.channel ~= channel and min.channel ~= channel then
        return {
          value = value,
          channel = channel,
        }
      end
    end
  end)()

  return {
    min = {
      value = min.value,
      channel = min.channel,
    },
    mid = {
      value = mid.value,
      channel = mid.channel,
    },
    max = {
      value = max.value,
      channel = max.channel,
    },
  }
end

function M.rawToHex(raw) return "#" .. string.format("%06x", raw) end

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
  return table.concat {
    "#",
    string.format("%02x", rgb.r),
    string.format("%02x", rgb.g),
    string.format("%02x", rgb.b),
  }
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

function M.mix(rgb1, rgb2, int)
  local function mix(c1, c2)
    c2 = c1 + (c2 - c1) * (int / 100)
    c1 = c1 * c1
    c2 = c2 * c2
    local add = c1 + c2
    local devide = add / 2
    local sum = math.sqrt(devide)
    return math.floor(sum)
  end

  return {
    r = mix(rgb1.r, rgb2.r),
    g = mix(rgb1.g, rgb2.g),
    b = mix(rgb1.b, rgb2.b),
  }
end

function M.lerp(rgb1, rgb2, float)
  local function lerp(c1, c2) return math.floor(c1 + (c2 - c1) * float) end

  return {
    r = lerp(rgb1.r, rgb2.r),
    g = lerp(rgb1.g, rgb2.g),
    b = lerp(rgb1.b, rgb2.b),
  }
end

function M.add(rgb1, rgb2)
  return {
    r = clamp(rgb1.r + rgb2.r),
    g = clamp(rgb1.g + rgb2.g),
    b = clamp(rgb1.b + rgb2.b),
  }
end

function M.subtract(rgb1, rgb2)
  return {
    r = clamp(rgb1.r - rgb2.r),
    g = clamp(rgb1.g - rgb2.g),
    b = clamp(rgb1.b - rgb2.b),
  }
end

function M.multiply(rgb1, rgb2)
  local function multiply(c1, c2)
    local sum = clamp(c1 * c2 / 255)
    return math.ceil(sum)
  end

  return {
    r = multiply(rgb1.r, rgb2.r),
    g = multiply(rgb1.g, rgb2.g),
    b = multiply(rgb1.b, rgb2.b),
  }
end

function M.darkenPercent(rgb, percent)
  local float = percent * 0.01
  return {
    r = clamp((rgb.r * -float) + rgb.r),
    g = clamp((rgb.g * -float) + rgb.g),
    b = clamp((rgb.b * -float) + rgb.b),
  }
end

-- function M.darken(rgb, int)
--   return {
--     r = clamp(rgb.r - (0.2126 * int)),
--     g = clamp(rgb.g - (0.7152 * int)),
--     b = clamp(rgb.b - (0.0722 * int)),
--   }
-- end
--
-- function M.lighten(rgb, int)
--   return {
--     r = clamp(rgb.r + (0.2126 * int)),
--     g = clamp(rgb.g + (0.7152 * int)),
--     b = clamp(rgb.b + (0.0722 * int)),
--   }
-- end

-- function M.darken(rgb, int)
--   return {
--     r = clamp(rgb.r - (0.299 * int)),
--     g = clamp(rgb.g - (0.587 * int)),
--     b = clamp(rgb.b - (0.114 * int)),
--   }
-- end
--
-- function M.lighten(rgb, int)
--   return {
--     r = clamp(rgb.r + (0.299 * int)),
--     g = clamp(rgb.g + (0.587 * int)),
--     b = clamp(rgb.b + (0.114 * int)),
--   }
-- end

function M.darken(rgb, int)
  return {
    r = clamp(rgb.r - int),
    g = clamp(rgb.g - int),
    b = clamp(rgb.b - int),
  }
end

function M.lighten(rgb, int)
  return {
    r = clamp(rgb.r + int),
    g = clamp(rgb.g + int),
    b = clamp(rgb.b + int),
  }
end

function M.hue(rgb, hue)
  local U = math.cos(hue * math.pi / 180)
  local W = math.sin(hue * math.pi / 180)

  return {
    r = (0.299 + 0.701 * U + 0.168 * W) * rgb.r
      + (0.587 - 0.587 * U + 0.330 * W) * rgb.g
      + (0.114 - 0.114 * U - 0.497 * W) * rgb.b,
    g = (0.299 - 0.299 * U - 0.328 * W) * rgb.r
      + (0.587 + 0.413 * U + 0.035 * W) * rgb.g
      + (0.114 - 0.114 * U + 0.292 * W) * rgb.b,
    b = (0.299 - 0.3 * U + 1.25 * W) * rgb.r
      + (0.587 - 0.588 * U - 1.05 * W) * rgb.g
      + (0.114 + 0.886 * U - 0.203 * W) * rgb.b,
  }
end

function M.saturation(rgb, sat)
  local c = order(rgb)
  local min, mid, max = c.min, c.mid, c.max
  local a = max.value - min.value
  local b = mid.value - min.value

  local new_rgb = {
    r = max.value,
    g = max.value,
    b = max.value,
  }

  if min.value == max.value then
    min.value = max.value
    a = 1
  end

  new_rgb[max.channel] = max.value
  new_rgb[mid.channel] = math.floor(max.value * ((1 - sat) + sat * b / a))
  new_rgb[min.channel] = math.floor(max.value * (1 - sat))

  return new_rgb
end

function M.value(rgb, val)
  local max = M.max(rgb).value
  if max == 0 then
    return {
      r = math.floor(255 * val),
      g = math.floor(255 * val),
      b = math.floor(255 * val),
    }
  end

  max = 255 * val / max
  return {
    r = math.floor(rgb.r * max),
    g = math.floor(rgb.g * max),
    b = math.floor(rgb.b * max),
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

function M.getLuminance(rgb, ver)
  if ver == 0 then
    -- Algorithm based on http://alienryderflex.com/hsp.html
    return (0.299 * rgb.r) + (0.587 * rgb.g) + (0.114 * rgb.b)
  elseif ver == 1 then
    -- Algorithm based on https://www.w3.org/TR/2008/REC-WCAG20-20081211/#relativeluminancedef
    return (0.2126 * rgb.r) + (0.7152 * rgb.g) + (0.0722 * rgb.b)
  else
    return (rgb.r + rgb.g + rgb.b) / 3
  end
end

function M.greyScale(rgb)
  local value = M.getLuminance(rgb, M.luminanceMode)
  return {
    r = value,
    g = value,
    b = value,
  }
end

function M.toValue(rgb)
  return {
    rgb,
    M.get_value(rgb),
  }
end

function M.valueOffsetPos(rgb, origin, amount)
  local rgb_value = M.getLuminance(rgb, M.luminanceMode)
  local origin_value = M.getLuminance(origin, M.luminanceMode)

  return math.floor(amount - (rgb_value - origin_value))
end

function M.valueOffsetNeg(rgb, origin, amount)
  local rgb_value = M.getLuminance(rgb, M.luminanceMode)
  local origin_value = M.getLuminance(origin, M.luminanceMode)

  return math.floor(amount + (rgb_value - origin_value))
end

function M.getOffset(rgb, origin, amount)
  local main_value = M.getLuminance(rgb, M.luminanceMode)
  local origin_value = M.getLuminance(origin, M.luminanceMode)
  local difference = math.abs(origin_value - main_value)
  local max_offset_amount = amount
  local offset_amount = 0

  if difference >= max_offset_amount then
    offset_amount = offset_amount
  elseif main_value > origin_value then
    offset_amount = max_offset_amount - difference
  elseif main_value < origin_value then
    offset_amount = max_offset_amount + difference
  elseif main_value == origin_value then
    offset_amount = max_offset_amount
  end
  return math.abs(offset_amount)
end

function M.offsetValue(rgb, origin, amount)
  return {
    rgb,
    M.getOffset(rgb, origin, amount),
  }
end

function M.lightOrDark(table, value)
  local base_value = M.getLuminance(value, M.luminanceMode)
  local new_color = table[1]
  local offset = table[2]

  if base_value >= 127.5 then
    new_color = M.darken(table[1], offset)
  elseif base_value < 127.5 then
    new_color = M.lighten(table[1], offset)
  end

  return new_color
end

function M.autoValue(rgb, offset_color, max_offset)
  local base_value = M.getLuminance(offset_color, M.luminanceMode)
  local offset = M.getOffset(rgb, offset_color, max_offset)
  local new_color = rgb

  if base_value >= 127.5 then
    new_color = M.darken(rgb, offset)
  elseif base_value < 127.5 then
    new_color = M.lighten(rgb, offset)
  end

  return new_color
end

function M.get_hlgroup(table)
  local hl
  for _, name in ipairs(table) do
    if vim.fn.hlexists(name) == 1 then
      -- WARN: nvim_get_hl_by_name is being depricated use nvim_get_hl.
      hl = vim.api.nvim_get_hl(0, { name = name })
      if not hl.fg then goto continue end
      if not hl.bg then goto continue end
      hl = {
        fg = M.rawToRgb(hl.fg),
        bg = M.rawToRgb(hl.bg),
      }
      return hl
    end
    ::continue::
  end
  vim.print(hl)
  return hl
end

function M:editor(color, call_stack)
  self["data"] = color or 0
  for i, call in ipairs(call_stack) do
    if type(call) == "table" then
      local method = call[1]
      local value1 = call[2]
      local value2 = call[3]
      self.data = self[method](self.data, value1, value2)
    else
      local func = call()
      self.data = func
    end
  end
  return self.data
end

return M
