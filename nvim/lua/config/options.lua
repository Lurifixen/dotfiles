vim.opt.nu = true -- Enabling line numbers
vim.opt.relativenumber = true

-- Sync clipboard NVIM/OS
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

-- Don't show mode
vim.opt.showmode = true

-- Break indenting
vim.opt.breakindent = true

vim.cmd 'set expandtab'
vim.cmd 'set tabstop=2'
vim.cmd 'set softtabstop=2'
vim.cmd 'set shiftwidth=2'
vim.cmd 'set number'
vim.cmd 'set relativenumber'

-- Configure how splits are opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Show which line cursor is on
vim.opt.cursorline = true

-- Searching
vim.opt.ignorecase = true
vim.opt.smartcase = true
