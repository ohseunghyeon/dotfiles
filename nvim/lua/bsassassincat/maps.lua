local keymap = vim.keymap.set

local opts = { silent = true }

-- remap space as leader key
keymap('', '<Space>', '<Nop>', opts)
vim.g.mapleader = ' '

-- Split window
keymap('n', '<leader>ss', ':split<Return><C-w>w', opts)
keymap('n', '<leader>sv', ':vsplit<Return><C-w>w', opts)

-- Window navigation
keymap('n', '<C-h>', '<C-w>h', opts)
keymap('n', '<C-j>', '<C-w>j', opts)
keymap('n', '<C-k>', '<C-w>k', opts)
keymap('n', '<C-l>', '<C-w>l', opts)

-- Resize with arrows
keymap('n', '<C-Up>', ':resize -2<CR>', opts)
keymap('n', '<C-Down>', ':resize +2<CR>', opts)
keymap('n', '<C-Left>', ':vertical resize -2<CR>', opts)
keymap('n', '<C-Right>', ':vertical resize +2<CR>', opts)

-- Clear highlights
keymap('n', '<leader>h', '<cmd>nohlsearch<CR>', opts)

-- Nvim tree
keymap('n', '<leader>e', ':NvimTreeToggle<CR>', opts)

-- Bufferline
keymap('n', '<Tab>', ':BufferLineCyclePrev<CR>', opts)
keymap('n', '<S-Tab>', ':BufferLineCycleNext<CR>', opts)

-- Telescope
keymap('n', '<leader>ff', ':Telescope find_files<CR>', opts)
keymap('n', '<leader>fg', ':Telescope live_grep<CR>', opts)
keymap('n', '<leader>fb', ':Telescope buffers<CR>', opts)
keymap('n', '<leader>fh', ':Telescope help_tags<CR>', opts)
