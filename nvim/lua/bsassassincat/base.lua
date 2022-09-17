vim.cmd("autocmd!")

vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

vim.wo.number = true

vim.opt.autoindent = true
vim.opt.background = 'dark'
vim.opt.backspace = { 'start', 'eol', 'indent' }
vim.opt.backup = false
vim.opt.backupskip = { '/tmp/*', '/private/tmp/*' }
vim.opt.breakindent = true
vim.opt.clipboard = "unnamedplus"
vim.opt.cmdheight = 1
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.hlsearch = true
vim.opt.inccommand = 'split'
vim.opt.ignorecase = true -- Case insensitive searching UNLESS /C or capital in search
vim.opt.laststatus = 2
vim.opt.mouse = "a"
vim.opt.number = true
vim.opt.numberwidth = 4
vim.opt.relativenumber = true
vim.opt.path:append { '**' } -- Finding files - Search down into subfolders
vim.opt.pumblend = 5
vim.opt.showcmd = true
vim.opt.smarttab = true
vim.opt.smartindent = true
vim.opt.scrolloff = 10
vim.opt.shell = 'fish'
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.termguicolors = true
vim.opt.title = true -- set the title of window to the value of the titlestring
vim.opt.titlestring = "%<%F%=%l/%L - nvim" -- what the title of the window will be set to
vim.opt.undodir = vim.fn.stdpath "cache" .. "/undo"
vim.opt.undofile = true -- enable persistent undo
vim.opt.updatetime = 300 -- faster completion
vim.opt.wrap = false -- No Wrap lines
vim.opt.wildignore:append { '*/node_modules/*' }
vim.opt.winblend = 0
vim.opt.wildoptions = 'pum'

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = '*',
  command = "set nopaste"
})

-- Add asterisks in block comments
vim.opt.formatoptions:append { 'r' }
