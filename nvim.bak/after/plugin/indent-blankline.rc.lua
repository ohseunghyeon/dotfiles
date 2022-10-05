local ok, ib = pcall(require, 'indent_blankline')
if (not ok) then return end

ib.setup {
  char = "▏",
  use_treesitter = true,
  show_first_indent_level = false,
}
