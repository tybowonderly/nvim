--- Colorscheme entry: :colorscheme monokai-pro-iterm
local theme = require("config.colors.monokai-pro-iterm")
require("monokai").setup({
  palette = theme.palette,
  custom_hlgroups = theme.custom_hlgroups,
})
