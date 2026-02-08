local map = vim.api.nvim_set_keymap
-- move window
map('n', '<Leader>j', '<C-w>j', { noremap = true, silent = true })
map('n', '<Leader>k', '<C-w>k', { noremap = true, silent = true })
map('n', '<Leader>l', '<C-w>l', { noremap = true, silent = true })
map('n', '<Leader>h', '<C-w>h', { noremap = true, silent = true })

-- split window
map('n', '<Leader>s', ':sp\n', { noremap = true })
map('n', '<Leader>v', ':vs\n', { noremap = true })

-- close window
map('n', '<Leader>w', ':w\n', { noremap = true })
map('n', '<Leader>q', ':q\n', { noremap = true })
map('n', '<Leader>wq', ':wq\n', { noremap = true })

-- open terminal
map('n', '<Leader>tt', ':terminal\n', { noremap = true })

map('i', '<C-k>', '<Up>', {})
map('i', '<C-j>', '<Down>', {})
map('i', '<C-h>', '<Left>', {})
map('i', '<C-l>', '<Right>', {})

-- show diagnostics
map('n', '<Leader>d', ':lua vim.diagnostic.open_float()<CR>', { noremap = true })

-- rebind embeded command
map('n', '<C-_>', 'gcc', { noremap = false })
map('v', '<C-_>', 'gc', { noremap = false })
map('i', 'jj', '<Esc>', { noremap = true, silent = true })

-- Git (fugitive)
map('n', '<Leader>gg', ':Git<CR>', { noremap = true, silent = true })
map('n', '<Leader>gc', ':Git commit<CR>', { noremap = true, silent = true })
map('n', '<Leader>gp', ':Git push<CR>', { noremap = true, silent = true })
map('n', '<Leader>gl', ':Git pull<CR>', { noremap = true, silent = true })
map('n', '<Leader>gb', ':Git blame<CR>', { noremap = true, silent = true })
-- map('n', '<Leader>gd', ':Git diff<CR>', { noremap = true, silent = true })
map('n', '<Leader>gd', ':Gvdiffsplit<CR>', { noremap = true, silent = true })
map('n', '<Leader>ga', ':Gwrite<CR>', { noremap = true, silent = true })
map('n', '<Leader>gss', ':Git stash push -m ""<Left>', { noremap = true })
map('n', '<Leader>gsa', ':Git stash apply<CR>', { noremap = true, silent = true })
map('n', '<Leader>gP', ':Git commit<CR>:Git push<CR>', { noremap = true, silent = true })

-- GitHub (rhubarb)
map('n', '<Leader>go', ':GBrowse<CR>', { noremap = true, silent = true })
map('v', '<Leader>go', ':GBrowse<CR>', { noremap = true, silent = true })
