# CLAUDE.md

Instructions for AI assistants working in this repository.

## Purpose

This repository is the user's **Neovim / LazyVim configuration** and the workspace for an ongoing **learning and support chat**. The user is learning Neovim and uses Cursor to ask questions, troubleshoot issues, and edit config files.

Do not treat this as a generic application codebase. Prioritize explaining Neovim concepts, LazyVim conventions, and targeted config changes over large refactors.

## User context

- Beginner learning Neovim with LazyVim
- Primary languages: **Python**, **TypeScript**, **Lua** (Neovim config)
- Prefers guided explanations, not just config dumps
- Human-readable learning guide lives in Obsidian: `/Users/tybo/Documents/Obsidian Vault/Neovim/`
  - Hub note: `Neovim Setup Guide.md`
  - Daily key reference: `04 - Keybind Cheatsheet.md`

When keybinds or plugins change materially, update the relevant Obsidian notes to stay in sync.

## Config layout

```
~/.config/nvim/
├── init.lua                    # Entry point → require("config.lazy")
├── CLAUDE.md                   # This file
├── lazy-lock.json              # Plugin version lockfile
├── lazyvim.json                # LazyVim extras and install state
└── lua/
    ├── config/
    │   ├── lazy.lua            # lazy.nvim + LazyVim bootstrap
    │   ├── keymaps.lua         # User keymaps (override/extend here)
    │   ├── options.lua         # User options
    │   └── autocmds.lua        # User autocommands
    └── plugins/
        ├── monokai.lua         # Custom colorscheme (Monokai Pro)
        └── example.lua         # Disabled examples — do not load
```

LazyVim plugin sources (defaults, keymaps) live at:

```
~/.local/share/nvim/lazy/LazyVim/
```

Read LazyVim source for default keymaps when the user has not overridden them locally. Do not edit files under `~/.local/share/nvim/lazy/` — changes get overwritten on plugin update.

## Current setup facts

| Setting | Value |
|---------|-------|
| Distribution | LazyVim v8 (`install_version: 8` in lazyvim.json) |
| Leader | Space (`vim.g.mapleader = " "`) |
| Local leader | `\` |
| Colorscheme | Monokai Pro default; last choice via `<leader>uC` persisted to `stdpath("state")/last_colorscheme` |
| File explorer | Snacks Explorer (`<leader>e`) |
| File picker | Snacks Picker (`<leader><space>`) |
| Completion | blink.cmp (lazy-loads on InsertEnter) |
| Formatting | conform.nvim, auto-format on save enabled |
| LazyVim extras | None enabled (empty `extras` in lazyvim.json) |

## How to help

### Answering questions

- Reference actual config files in this repo and LazyVim defaults in `~/.local/share/nvim/lazy/LazyVim/`
- Explain *why*, not just *what* — the user is learning
- Distinguish Neovim core vs LazyVim additions vs plugin-specific behavior
- Point to `:help`, which-key (`<Space>`), and Obsidian cheatsheet for self-serve discovery

### Editing config

- Prefer minimal, targeted changes in `lua/plugins/` or `lua/config/`
- Add new plugins as files in `lua/plugins/` — they auto-load via lazy.nvim
- Override LazyVim plugins by returning a spec with the same plugin name and `opts` or `keys`
- Use `vim.keymap.set` in `lua/config/keymaps.lua` for custom keymaps
- Do **not** use `LazyVim.safe_keymap_set` in user config (LazyVim internal only)
- Match existing Lua style (see `stylua.toml`)

### Troubleshooting

Common diagnostic commands:

| Command | Purpose |
|---------|---------|
| `:checkhealth` | Overall health |
| `:checkhealth lazyvim` | LazyVim-specific |
| `:Lazy` | Plugin status |
| `:Mason` | LSP/formatter installs |
| `:LspInfo` / `<leader>cl` | LSP attachment |
| `:LspLog` | LSP server logs |
| `:ConformInfo` | Formatter status |

### Git

- Do not commit unless the user explicitly asks
- Do not force-push to main/master
- Do not update git config

## Useful reference paths

| Topic | LazyVim source |
|-------|----------------|
| Default keymaps | `lua/lazyvim/config/keymaps.lua` |
| Default options | `lua/lazyvim/config/options.lua` |
| LSP keymaps | `lua/lazyvim/plugins/lsp/init.lua` |
| Snacks picker keys | `lua/lazyvim/plugins/extras/editor/snacks_picker.lua` |
| Snacks explorer keys | `lua/lazyvim/plugins/extras/editor/snacks_explorer.lua` |
| Editor plugins (git, flash, trouble) | `lua/lazyvim/plugins/editor.lua` |
| Coding (mini.ai, pairs) | `lua/lazyvim/plugins/coding.lua` |

## Obsidian guide structure

```
/Users/tybo/Documents/Obsidian Vault/Neovim/
├── Neovim Setup Guide.md       # Hub
├── 01 - Neovim Basics.md
├── 02 - Buffers, Windows, and Tabs.md
├── 03 - LazyVim Overview.md
├── 04 - Keybind Cheatsheet.md  # Primary daily reference
├── 05 - LSP and Mason.md
├── 06 - Installed Plugins.md
└── 07 - Python Virtual Environments.md
```

Keep wikilinks consistent (`[[04 - Keybind Cheatsheet]]`) when editing guide notes.
