return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  config = function()
    local ts = require('nvim-treesitter')
    ts.setup()

    -- Install parsers
    local parsers = {
      'ruby', 'php', 'go', 'gotmpl', 'gomod', 'gosum', 'zig',
      'tsx', 'javascript', 'typescript', 'json', 'yaml', 'html', 'css',
      'lua', 'luadoc', 'vim', 'vimdoc', 'markdown_inline', 'markdown',
      'sql', 'git_config', 'git_rebase', 'gitattributes', 'gitcommit',
      'gitignore', 'graphql', 'c', 'cpp', 'c_sharp',
    }
    ts.install(parsers)

    -- Enable highlighting via FileType autocmd
    vim.api.nvim_create_autocmd('FileType', {
      group = vim.api.nvim_create_augroup('UserTreesitter', { clear = true }),
      pattern = '*',
      callback = function()
        pcall(vim.treesitter.start)
      end,
    })
  end,
}
