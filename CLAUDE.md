# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Personal Neovim 0.11+ configuration using native LSP (no nvim-lspconfig plugin), lazy.nvim for plugin management, and Tokyo Night Storm theme. Supports Go, Lua, TypeScript/JavaScript, Ruby, PHP, and Zig.

## Architecture

**Entry point**: `init.lua` loads four modules in order: `base` → `keymaps` → `config.lazy` → `config.lsp`

- `lua/base.lua` - vim options, diagnostics autocmd (CursorHold float)
- `lua/keymaps.lua` - all keybindings, leader=Space, localleader=\
- `lua/config/lazy.lua` - lazy.nvim bootstrap and plugin loader (imports `plugins/` dir)
- `lua/config/lsp.lua` - native Neovim 0.11 LSP setup with LspAttach autocmd, completion capabilities, semantic tokens disabled
- `lua/plugins/*.lua` - individual lazy.nvim plugin specs
- `lsp/*.lua` - per-language server configs (cmd, filetypes, root_markers) loaded by native `vim.lsp.config()`

**Key pattern**: LSP servers are configured via files in the top-level `lsp/` directory (not inside `lua/`), which is the Neovim 0.11 native convention. Each file exports `{ cmd, filetypes, root_markers, settings }`.

## Plugin Specs

Plugin specs live in `lua/plugins/` as separate files: `telescope.lua`, `treesitter.lua`, `tree.lua`, `theme.lua`, `git.lua`, `formatter.lua`, `lualine.lua`, `plugins.lua` (misc), `colorschema.lua` (alt themes, mostly commented), `fzf.lua`.

Formatter config (`formatter.lua`) uses conform.nvim with per-filetype formatter lists. Adding a new formatter means adding it to the `formatters_by_ft` table.

## Adding a New Language

1. Create `lsp/<server_name>.lua` with `cmd`, `filetypes`, `root_markers`
2. Add treesitter parser name to the `ensure_installed` list in `lua/plugins/treesitter.lua`
3. If needed, add formatter to `lua/plugins/formatter.lua` formatters_by_ft table
4. Install the LSP server and formatter binaries (see README.md)

## Conventions

- All config is Lua (no vimscript)
- 2-space indentation
- Plugin specs use lazy.nvim format with `opts` tables or `config` functions
- Keymaps use `vim.keymap.set` with `{ desc = "..." }` for discoverability
- README contains some Japanese text (bilingual documentation)
