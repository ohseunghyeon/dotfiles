local status, telescope = pcall(require, 'telescope')
if (not status) then return end

local actions = require('telescope.actions')

telescope.setup {
  defaults = {
    file_ignore_patterns = { '.git/', 'node_modules' },
    mappings = {
      i = {
        ['<Down>'] = actions.cycle_history_next,
        ['<Up>'] = actions.cycle_history_prev,
        ['<C-j>'] = actions.move_selection_next,
        ['<C-k>'] = actions.move_selection_previous,
        ['<C-h>'] = 'which_key',
      },
    },
  },
}