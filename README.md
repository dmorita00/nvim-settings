# Neovim Configuration

Personal Neovim configuration with LSP, Treesitter, and modern plugins.

## Requirements

- **Neovim** 0.11+
- **tree-sitter-cli** 0.26.1+
- **Git**
- **C compiler** (clang or gcc)

## Installation

```bash
# Install dependencies (macOS)
brew install neovim tree-sitter-cli

# Clone configuration
git clone <repo-url> ~/.config/nvim

# Launch Neovim (plugins install automatically)
nvim
```

## Plugins

| Plugin | Description |
|--------|-------------|
| nvim-treesitter | Syntax highlighting |
| telescope.nvim | Fuzzy finder |
| nvim-tree.lua | File explorer |
| nvim-lspconfig | LSP support |
| conform.nvim | Formatter |
| lualine.nvim | Status line |
| tokyonight.nvim | Color scheme |
| vim-fugitive | Git integration |
| git-conflict.nvim | Conflict resolution |

## LSP Support

- Go (gopls)
- Lua (lua_ls)
- PHP (phpactor)
- Ruby (ruby_lsp)
- TypeScript/JavaScript (ts_ls)
- Zig (zls)

## Structure

```
~/.config/nvim/
├── init.lua          # Entry point
├── lazy-lock.json    # Plugin lock file
├── lua/
│   ├── base.lua      # Base settings
│   ├── keymaps.lua   # Key mappings
│   ├── config/       # Configuration
│   └── plugins/      # Plugin configs
└── lsp/              # LSP configs
```
