local status, ts = pcall(require, "nvim-treesitter.configs")
if (not status) then return end

ts.setup {
  ensure_installed = "all",
  ignore_install = { "" },
  highlight = {
    enable = true,
    disable = { "css" },
  },
  autopairs = {
    enable = true,
  },
  indent = {
    enable = true,
  },
  autotag = {
    enable = true,
  },
}

-- vim.opt.foldmethod="expr"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
