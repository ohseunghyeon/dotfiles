local overrides = require "custom.plugins.overrides"

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
   autocmd!
    autocmd BufWritePost */custom/plugins/init.lua source <afile> | PackerSync
  augroup end
]]

return {
  ["goolord/alpha-nvim"] = {
    disable = false, -- enables dashboard
    override_options = overrides.alpha,
  },

  -- ✅ Highlight, list and search todo comments in your projects
  ["folke/todo-comments.nvim"] = {
    opt = true,
    setup = function()
      require("core.lazy_load").on_file_open "todo-comments.nvim"
    end,
    config = function()
      require("custom.plugins.others").todo_comments()
    end,
  },

  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end,
  },

  -- override plugin configs
  ["nvim-treesitter/nvim-treesitter"] = {
    override_options = overrides.treesitter,
  },

  ["williamboman/mason.nvim"] = {
    override_options = overrides.mason,
  },

  ["kyazdani42/nvim-tree.lua"] = {
    override_options = overrides.nvimtree,
  },

  -- Install a plugin
  ["max397574/better-escape.nvim"] = {
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  -- code formatting, linting etc
  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require "custom.plugins.null-ls"
    end,
  },

  -- lsp ui
  -- ["glepnir/lspsaga.nvim"] = {
  --   after = "nvim-lspconfig",
  --   config = function()
  --     require("custom.plugins.others").lspsaga()
  --   end,
  --   setup = function()
  --     require("core.utils").load_mappings "lsp_config"
  --   end,
  -- },
  -- Rainbow parentheses using treesitter
  ["p00f/nvim-ts-rainbow"] = {
    after = "nvim-treesitter",
  },
  -- Use treesitter to auto close and auto rename html tag
  ["windwp/nvim-ts-autotag"] = {
    after = "nvim-treesitter",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },

  -- Debug Adapter Protocol client
  ["mfussenegger/nvim-dap"] = {
    cmd = "DapToggleBreakpoint",
    config = function()
      require "custom.plugins.nvim-dap"
    end,
    setup = function()
      require("core.utils").load_mappings "dap_config"
    end,
  },
  -- A UI for nvim-dap
  ["rcarriga/nvim-dap-ui"] = {
    after = "nvim-dap",
    config = function()
      require("custom.plugins.others").dapui()
    end,
  },
  -- adds virtual text support to nvim-dap
  ["theHamsta/nvim-dap-virtual-text"] = {
    after = "nvim-dap",
    config = function()
      require("nvim-dap-virtual-text").setup()
    end,
  },
  -- nvim-dap adapter for vscode-js-debug
  ["mxsdev/nvim-dap-vscode-js"] = {
    after = "nvim-dap",
    config = function()
      require "custom.plugins.nvim-dap-vscode-js"
    end,
  },
  -- The VS Code JavaScript debugger
  ["microsoft/vscode-js-debug"] = {
    opt = true,
    run = "npm install --legacy-peer-deps && npm run compile",
  },
  -- Smart and powerful comment plugin for neovim.
  ["numToStr/Comment.nvim"] = {
    override_options = overrides.comment,
  },
  -- Find, Filter, Preview, Pick. All lua, all the time.
  ["nvim-telescope/telescope.nvim"] = {
    override_options = overrides.telescope,
  },
  -- FZF sorter for telescope written in c
  ["nvim-telescope/telescope-fzf-native.nvim"] = {
    after = "telescope.nvim",
    run = 'make'
  },
-- Add/change/delete surrounding delimiter pairs with ease
  ["kylechui/nvim-surround"] = {
    opt = true,
    setup = function()
      require("core.lazy_load").on_file_open "nvim-surround"
    end,
    config = function()
      require("nvim-surround").setup {}
    end,
  },
  -- tabbing out from parentheses, quotes, and similar contexts
  ["abecodes/tabout.nvim"] = {
    wants = { "nvim-treesitter" },
    after = { "nvim-cmp" },
    config = function()
      require("tabout").setup {}
    end,
  },
  -- 🌌 Next-generation motion plugin
  ["ggandor/lightspeed.nvim"] = {
    opt = true,
    setup = function()
      require("core.lazy_load").on_file_open "lightspeed.nvim"
    end,
  },
  -- Getting you where you want with the fewest keystrokes.
  ["ThePrimeagen/harpoon"] = {
    opt = true,
    setup = function()
      require("core.lazy_load").on_file_open "harpoon"
      require("core.utils").load_mappings "harpoon"
    end,
  },
  -- add log messages
  ["gaelph/logsitter.nvim"] = {
    ft = { "javascript", "typescript", "go", "lua" },
    after = { "nvim-treesitter" },
  },

  -- project management
  ["ahmedkhalf/project.nvim"] = {
    opt = true,
    setup = function()
      require("core.lazy_load").on_file_open "project.nvim"
      require("core.utils").load_mappings "telescope"
    end,
    config = function()
      require("project_nvim").setup()
    end,
  },
  -- A task runner and job management plugin for Neovim
  ["stevearc/overseer.nvim"] = {
    cmd = { "OverseerToggle" },
    config = function()
      require("custom.plugins.configs.others").overseer()
    end,
  },
  -- markdown preview
  ["iamcco/markdown-preview.nvim"] = {
    ft = "markdown",
    run = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
  -- Edit Readonly files
  -- ["lambdalisue/suda.vim"] = {
  --   cmd = "SudaWrite",
  -- },
  -- Bundle snippets from multiple sources and convert them to your format of choice
  -- ["smjonas/snippet-converter.nvim"] = {
  --   cmd = "ConvertSnippets",
  --   config = function()
  --     require("custom.plugins.configs.others").snippet_converter()
  --   end,
  -- },

  -- remove plugin
  -- ["hrsh7th/cmp-path"] = false,
}
