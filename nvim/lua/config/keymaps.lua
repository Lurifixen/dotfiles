-- Setting spacebar to be my leader key
vim.g.mapleader = " "

-- Neotree 
vim.keymap.set('n', '<leader>ft', ':Neotree toggle<CR>')

-- Window movement
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', {desc = 'Move focus to the left window'})
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', {desc = 'Move focus to the right window'})
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', {desc = 'Move focus to the lower window'})
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', {desc = 'Move focus to the upper window'})

-- Highlight text when yanking
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.keymap.set('i', 'å', '[', { remap = true })
vim.keymap.set('i', 'Å', '{', { remap = true })
vim.keymap.set('i', '¨', ']', { remap = true })
vim.keymap.set('i', '^', '}', { remap = true })
vim.keymap.set('i', '¤', '$', { remap = true })
vim.keymap.set('i', '§', '~', { remap = true })
