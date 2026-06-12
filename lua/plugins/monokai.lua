local STATE_FILE = vim.fn.stdpath("state") .. "/last_colorscheme"
local DEFAULT = "monokai-pro-iterm"
local theme = require("config.colors.monokai-pro-iterm")

local function read_saved()
  if vim.fn.filereadable(STATE_FILE) == 1 then
    local line = vim.fn.trim(vim.fn.readfile(STATE_FILE)[1] or "")
    if line == "monokai" then
      return DEFAULT
    end
    if line ~= "" then
      return line
    end
  end
end

local function save_colorscheme(name)
  if name and name ~= "" then
    vim.fn.writefile({ name }, STATE_FILE, "S")
  end
end

local function apply_colorscheme(name)
  name = name or DEFAULT

  if name ~= DEFAULT then
    if package.loaded["lazy"] then
      require("lazy.core.loader").colorscheme(name)
    end
    if pcall(vim.cmd.colorscheme, name) then
      return
    end
  end

  require("monokai").setup({
    palette = theme.palette,
    custom_hlgroups = theme.custom_hlgroups,
  })
end

return {
  {
    "tanvirtin/monokai.nvim",
    priority = 1000,
    init = function()
      vim.api.nvim_create_autocmd("ColorScheme", {
        group = vim.api.nvim_create_augroup("user_colorscheme_persist", { clear = true }),
        callback = function()
          if vim.g.colors_name then
            save_colorscheme(vim.g.colors_name)
          end
        end,
      })
    end,
    config = function()
      apply_colorscheme(read_saved() or DEFAULT)
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = function() end,
    },
  },
}
