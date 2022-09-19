local keymap = vim.keymap

local opts = { silent = true }

--Remap space as leader key
keymap.set("", "<Space>", "<Nop>")
vim.g.mapleader = " "

-- Split window
keymap.set('n', 'ss', ':split<Return><C-w>w')
keymap.set('n', 'sv', ':vsplit<Return><C-w>w')

-- Better window navigation
keymap.set("n", "<C-h>", "<C-w>h", opts)
keymap.set("n", "<C-j>", "<C-w>j", opts)
keymap.set("n", "<C-k>", "<C-w>k", opts)
keymap.set("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap.set("n", "<C-Up>", ":resize -2<CR>")
keymap.set("n", "<C-Down>", ":resize +2<CR>")
keymap.set("n", "<C-Left>", ":vertical resize -2<CR>")
keymap.set("n", "<C-Right>", ":vertical resize +2<CR>")

-- Clear highlights
keymap.set("n", "<leader>h", "<cmd>nohlsearch<CR>")


-- fold zc unfold zo


-- Nvim tree
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- cmp

