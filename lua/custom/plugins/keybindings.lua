return {
  -- Terminal shortcut
  vim.keymap.set('n', '<leader>t', ':terminal<CR>'),

  -- Copy file name
  vim.keymap.set('n', '<leader>Y', function()
    local filepath = vim.fn.expand '%'
    vim.fn.setreg('+', filepath) -- write to clippoard
  end, { noremap = true, silent = true }),

  -- NOTE: Lang specific keybindings
  --
  -- JS keybindings
  vim.api.nvim_create_autocmd('FileType', {
    pattern = 'javascript',
    callback = function()
      vim.api.nvim_set_keymap('n', '<leader>R', ':!node %<CR>', { noremap = true, silent = true, desc = '[R]un current file' })
    end,
  }),

  -- C# keybindings
  vim.api.nvim_create_autocmd('FileType', {
    pattern = 'cs',
    callback = function()
      vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = 'LSP Rename' })
      vim.api.nvim_set_keymap('n', '<leader>R', ':!dotnet run<CR>', { desc = '[R]un current file' })
    end,
  }),

  -- Python keybindings
  vim.api.nvim_create_autocmd('FileType', {
    pattern = 'python',
    callback = function()
      vim.api.nvim_set_keymap('n', '<leader>R', ':!python %<CR>', { noremap = true, silent = true, desc = '[R]un current file' })
    end,
  }),

  -- GO keybindings
  vim.api.nvim_create_autocmd('FileType', {
    pattern = 'go',
    callback = function()
      vim.api.nvim_set_keymap('n', '<leader>R', ':!go run %<CR>', { noremap = true, silent = true, desc = '[R]un current file' })
    end,
  }),

  -- Racket keybindings
  vim.api.nvim_create_autocmd('FileType', {
    pattern = 'racket',
    callback = function()
      vim.api.nvim_set_keymap('n', '<leader>R', ':!racket %<CR>', { noremap = true, silent = true, desc = '[R]un current fi;e' })
      vim.api.nvim_set_keymap('n', '<leader>e', ':!raco test %<CR>', { noremap = true, silent = true, desc = '[T]est current file' })
      vim.diagnostic.config {
        virtual_text = {
          format = function(diagnostic)
            return diagnostic.message:gsub('^.+:(%d+):(%d+): ', '')
          end,
        },
      }
    end,
  }),
}
