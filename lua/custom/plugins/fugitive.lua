return {
  'tpope/vim-fugitive',
  vim.keymap.set('n', '<leader>G', ':Git<CR>', { desc = '[G]it open' }),
  vim.keymap.set('n', '<leader>P', ':Git! push<CR>', { desc = 'git [P]ush' }),
  vim.keymap.set('n', '<leader>PP', ':Git -c push.default=current push<CR>', { desc = 'git [P]ush to [P]roduction' }),
}
