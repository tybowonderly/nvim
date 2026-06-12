--- Monokai Pro palette matched to iTerm2 `monokai_pro.itermcolors`
--- and the official Monokai Pro VS Code theme.
--- Source: ~/Documents/terminal setup/monokai_pro.itermcolors
local M = {}

M.palette = {
  name = "monokai-pro-iterm",

  -- UI surfaces (official Monokai Pro)
  base0 = "#19181a", -- activity bar / deepest
  base1 = "#221f22", -- sidebar, status bar
  base2 = "#2d2a2e", -- editor + iTerm background
  base3 = "#403e41", -- panels, floats, popups
  base4 = "#5b595c", -- inactive UI, indent guides
  base5 = "#727072", -- comments, muted chrome
  base6 = "#727072", -- comments (treesitter @comment)
  base7 = "#c1c0c0", -- secondary text
  base8 = "#fcfcfa", -- primary foreground

  border = "#403e41",
  brown = "#403e41",
  white = "#fcfcfa",
  grey = "#939293",
  black = "#2d2a2e",

  -- Accent colors (ANSI / syntax — match iTerm)
  pink = "#ff6188",
  green = "#a9dc76",
  aqua = "#78dce8",
  yellow = "#ffd866",
  orange = "#fc9867",
  purple = "#ab9df2",
  red = "#ff6188",

  diff_add = "#3a4d32",
  diff_remove = "#4a3238",
  diff_change = "#403e41",
  diff_text = "#5b595c",
}

-- Tweaks so syntax matches official Monokai Pro (not tanvirtin defaults)
M.custom_hlgroups = {
  Constant = { fg = M.palette.purple },
  Number = { fg = M.palette.purple },
  Float = { fg = M.palette.purple },
  Boolean = { fg = M.palette.purple },
  Delimiter = { fg = M.palette.grey },
  Special = { fg = M.palette.white },
  Function = { fg = M.palette.green },
  Keyword = { fg = M.palette.pink, style = "italic" },

  ["@comment"] = { fg = M.palette.base5, style = "italic" },
  ["@constant"] = { fg = M.palette.purple },
  ["@number"] = { fg = M.palette.purple },
  ["@float"] = { fg = M.palette.purple },
  ["@boolean"] = { fg = M.palette.purple },
  ["@punctuation.bracket"] = { fg = M.palette.grey },
  ["@punctuation.delimiter"] = { fg = M.palette.grey },
  ["@punctuation.special"] = { fg = M.palette.grey },
  ["@function"] = { fg = M.palette.green },
  ["@function.call"] = { fg = M.palette.green },
  ["@method"] = { fg = M.palette.green },
  ["@method.call"] = { fg = M.palette.green },
  ["@parameter"] = { fg = M.palette.orange, style = "italic" },
  ["@variable.parameter"] = { fg = M.palette.orange, style = "italic" },
  ["@tag"] = { fg = M.palette.pink },
  ["@tag.attribute"] = { fg = M.palette.aqua, style = "italic" },

  -- LazyVim / snacks picker selection (yellow accent like official UI)
  PmenuSel = { fg = M.palette.base2, bg = M.palette.yellow },
  CursorLine = { bg = "#fcfcfa0c" },
  Visual = { bg = "#c1c0c026" },
}

return M
