
local colors = {
    white = "#cccccc",
    grey = "#303030",
    black = "#080808"
}

local custom = require'lualine.themes.palenight'

custom.normal.c.fg = colors.white
custom.normal.c.gui = ""

require('lualine').setup {
  options = {
    icons_enabled = false,
    theme = custom,
    component_separators = { left = ' ', right = '|'},
    section_separators = { left = ' ', right = ' '},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
}
