local colors = {
  black        = '#06080a',
  white        = '#d4daf5',
  red          = '#F7768E',
  green        = '#9ECE6A',
  blue         = '#7AA2F7',
  yellow       = '#FF9E64',
  gray         = '#444B6A',
  darkgray     = '#1a1b26',
  lightgray    = '#32344a',
  inactivegray = '#7c6f64',
}
local test_theme = {
  normal = {
    a = {bg = colors.blue, fg = colors.darkgray, gui = 'NONE'},
    b = {bg = colors.lightgray, fg = colors.white},
    c = {bg = colors.lightgray, fg = colors.white}
  },
  insert = {
    a = {bg = colors.green, fg = colors.darkgray, gui = 'NONE'},
    b = {bg = colors.lightgray, fg = colors.white},
    c = {bg = colors.lightgray, fg = colors.white}
  },
  visual = {
    a = {bg = colors.red, fg = colors.darkgray, gui = 'NONE'},
    b = {bg = colors.lightgray, fg = colors.white},
    c = {bg = colors.lightgray, fg = colors.white}
  },
  replace = {
    a = {bg = colors.red, fg = colors.darkgray, gui = 'NONE'},
    b = {bg = colors.lightgray, fg = colors.white},
    c = {bg = colors.lightgray, fg = colors.white}
  },
  command = {
    a = {bg = colors.blue, fg = colors.darkgray, gui = 'NONE'},
    b = {bg = colors.lightgray, fg = colors.white},
    c = {bg = colors.lightgray, fg = colors.white}
  },
  inactive = {
    a = {bg = colors.darkgray, fg = colors.gray, gui = 'NONE'},
    b = {bg = colors.lightgray, fg = colors.white},
    c = {bg = colors.lightgray, fg = colors.white}
  }
}
require('lualine').setup {options = {theme = test_theme}}
