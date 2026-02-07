-- Neovim 0.11 Native LSP Configuration

-- Global configuration for all LSP servers
vim.lsp.config('*', {
  root_markers = { '.git' },
  capabilities = {
    textDocument = {
      completion = {
        completionItem = {
          documentationFormat = { 'markdown', 'plaintext' },
          snippetSupport = true,
          preselectSupport = true,
          insertReplaceSupport = true,
          labelDetailsSupport = true,
          deprecatedSupport = true,
          commitCharactersSupport = true,
          tagSupport = { valueSet = { 1 } },
          resolveSupport = {
            properties = { 'documentation', 'detail', 'additionalTextEdits' },
          },
        },
      },
    },
  },
})

-- Enable all LSP servers (configs loaded from lsp/ directory)
vim.lsp.enable({
  'lua_ls', 'ts_ls', 'phpactor', 'gopls', 'ruby_lsp', 'zls',
})

-- LspAttach autocmd for keymaps
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', { clear = true }),
  callback = function(ev)
    local bufnr = ev.buf
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    local function opts(desc)
      return { buffer = bufnr, desc = 'LSP ' .. desc }
    end
    local buf = vim.lsp.buf

    vim.keymap.set('n', 'gD', buf.declaration, opts('Go to declaration'))
    vim.keymap.set('n', 'gd', buf.definition, opts('Go to definition'))
    vim.keymap.set('n', 'gi', buf.implementation, opts('Go to implementation'))
    vim.keymap.set('n', 'gr', buf.references, opts('Show references'))
    vim.keymap.set('n', '<leader>D', buf.type_definition, opts('Go to type definition'))
    vim.keymap.set('n', '<leader>sh', buf.signature_help, opts('Show signature help'))
    vim.keymap.set('n', '<leader>wa', buf.add_workspace_folder, opts('Add workspace folder'))
    vim.keymap.set('n', '<leader>wr', buf.remove_workspace_folder, opts('Remove workspace folder'))
    vim.keymap.set('n', '<leader>wl', function()
      print(vim.inspect(buf.list_workspace_folders()))
    end, opts('List workspace folders'))
    vim.keymap.set({ 'n', 'v' }, '<leader>ca', buf.code_action, opts('Code action'))

    -- Disable semantic tokens
    if client and client.supports_method('textDocument/semanticTokens') then
      client.server_capabilities.semanticTokensProvider = nil
    end
  end,
})
