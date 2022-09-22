local stauts, gitsigns = pcall(require, 'gitsigns')
if (not status) then return end

gitsigns.setup {}
