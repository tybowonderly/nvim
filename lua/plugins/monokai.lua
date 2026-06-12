local STATE_FILE = vim.fn.stdpath("state") .. "/last_colorscheme"
local DEFAULT = "monokai"

local function read_saved()
  if vim.fn.filereadable(STATE_FILE) == 1 then
    local line = vim.fn.trim(vim.fn.readfile(STATE_FILE)[1] or "")
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

  vim.cmd.colorscheme(DEFAULT)
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
      require("monokai").setup({
        palette = require("monokai").pro,
      })
      apply_colorscheme(read_saved() or DEFAULT)
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      -- Applied in monokai config after plugins load (supports persisted choice)
      colorscheme = function() end,
    },
  },
}
