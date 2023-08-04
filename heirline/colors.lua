local util = require "user.util.color"

return {
  tabline_bg = "none",
  scrollbar = (C.ui.yellow and C.ui.yellow) or util.get_hlgroup({ "TypeDef" }).fg,
  treesitter_bg = (C.ui.green and C.ui.green) or util.get_hlgroup({ "String" }).fg,
  -- buffer_bg = "#16161E",
  blank_bg = "#545c7e",
}
