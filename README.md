# Neovim Configuration

Personal Neovim configuration with LSP, Treesitter, and modern plugins.

## Requirements

- **Neovim** 0.11+
- **tree-sitter-cli** 0.26.1+
- **Git**
- **C compiler** (clang or gcc)
- **Nerd Font** (for icons)

## Font Setup (Required for Icons)

nvim-tree やステータスラインのアイコン表示には Nerd Font が必要です。

### macOS

```bash
brew install --cask font-jetbrains-mono-nerd-font
```

他の選択肢:
```bash
brew install --cask font-fira-code-nerd-font
brew install --cask font-hack-nerd-font
```

### ターミナル設定

**iTerm2:**
1. `Cmd + ,` → Profiles → Text
2. Font で「JetBrainsMono Nerd Font」を選択

**Terminal.app:**
1. `Cmd + ,` → プロファイル → テキスト → フォント変更
2. 「JetBrainsMono Nerd Font」を選択

### 確認方法

```bash
echo -e "\uf015 \uf07c \uf121"
```
家、フォルダ、コードのアイコンが表示されれば OK。

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

## External Tools

### Language Runtimes

- Go, Node.js, Ruby, PHP, Python

### Formatters

**Homebrew:**
```bash
brew install stylua yamlfmt terraform biome
```

**npm:**
```bash
npm install -g @fsouza/prettierd
```

**pip:**
```bash
pip install mbake sqlfluff
```

**gem:**
```bash
gem install rubocop
```

**go:**
```bash
go install golang.org/x/tools/cmd/goimports@latest
```

**composer:**
```bash
composer global require squizlabs/php_codesniffer
```

### LSP Servers

**Homebrew:**
```bash
brew install lua-language-server zls
```

**npm:**
```bash
npm install -g typescript typescript-language-server
```

**gem:**
```bash
gem install ruby-lsp
```

**go:**
```bash
go install golang.org/x/tools/gopls@latest
```

**composer:**
```bash
composer global require phpactor/phpactor
```

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
