-- Show .env files in the sidebar and file finder.
-- Snacks hides dotfiles and gitignored files by default.
return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      sources = {
        explorer = {
          include = { "**/.env", "**/.env.*" },
        },
        files = {
          hidden = true,
          ignored = true,
          exclude = { "**/node_modules/**", "**/.git/**" },
        },
      },
    },
  },
}
