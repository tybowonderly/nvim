-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("user_python_keymaps", { clear = true }),
  pattern = "python",
  callback = function(event)
    vim.keymap.set("n", "<leader>cv", function()
      vim.cmd.VenvSelect()
    end, {
      buffer = event.buf,
      desc = "Select Python VirtualEnv",
      silent = true,
    })
  end,
})
