local dap_status_ok, dap = pcall(require, "dap")
if not dap_status_ok then
  return
end

local dap_ui_status_ok, dapui = pcall(require, "dapui")
if not dap_ui_status_ok then
  return
end

local dap_virtual_text_status_ok, dap_virtual_text = pcall(require, 'nvim-dap-virtual-text')
if not dap_virtual_text_status_ok then
  return
end

-- vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticSignError", linehl = "", numhl = "" })
-- # Sign
vim.fn.sign_define('DapBreakpoint', { text = '🟥', texthl = '', linehl = '', numhl = '' })
vim.fn.sign_define('DapBreakpointCondition', { text = '🟧', texthl = '', linehl = '', numhl = '' })
vim.fn.sign_define('DapLogPoint', { text = '🟩', texthl = '', linehl = '', numhl = '' })
vim.fn.sign_define('DapStopped', { text = '🈁', texthl = '', linehl = '', numhl = '' })
vim.fn.sign_define('DapBreakpointRejected', { text = '⬜', texthl = '', linehl = '', numhl = '' })

dapui.setup {
  icons = { expanded = '▾', collapsed = '▸' },
  mappings = {
    expand = { '<CR>', '<2-LeftMouse>' },
    open = 'o',
    remove = 'd',
    edit = 'e',
    repl = 'r',
    toggle = 't',
  },
  expand_lines = vim.fn.has('nvim-0.7'),
  layouts = {
    {
      elements = {
        -- Elements can be strings or table with id and size keys.
        { id = 'scopes', size = 0.25 },
        'breakpoints',
        'stacks',
        'watches',
      },
      size = 40,
      position = 'left',
    },
    {
      elements = {
        { id = 'repl', size = 0.5 },
        { id = 'console', size = 0.5 },
      },
      size = 10,
      position = 'bottom',
    },
  },
  floating = {
    max_height = nil, -- These can be integers or a float between 0 and 1.
    max_width = nil, -- Floats will be treated as percentage of your screen.
    border = 'rounded', -- Border style. Can be 'single', 'double' or 'rounded'
    mappings = {
      close = { 'q', '<Esc>' },
    },
  },
  windows = { indent = 1 },
  render = {
    max_type_length = nil,
  }
}
dap_virtual_text.setup {
  enabled = true,
  enabled_commands = true,
  highlight_changed_variables = true,
  highlight_new_as_changed = false,
  show_stop_reason = true,
  commented = false,
  only_first_definition = true,
  all_references = false,
  filter_references_pattern = '<module',
  virt_text_pos = 'eol',
  all_frames = false,
  virt_lines = false,
  virt_text_win_col = nil,
}

dap.listeners.after.event_initialized['dapui_config'] = function()
  dapui.open()
end
dap.listeners.before.event_terminated['dapui_config'] = function()
  dapui.close()
end
dap.listeners.before.event_exited['dapui_config'] = function()
  dapui.close()
end

local dap_vscode_js_status_ok, dap_vscode_js = pcall(require, "dap-vscode-js")
if not dap_vscode_js_status_ok then
  return
end

dap_vscode_js.setup({
  -- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
  -- node_path = "$HOME/.deno/bin", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
  -- debugger_path = "(runtimedir)/site/pack/packer/opt/vscode-js-debug", -- Path to vscode-js-debug installation.
  adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' }, -- which adapters to register in nvim-dap
})

local exts = {
  'javascript',
  'typescript',
  'javascriptreact',
  'typescriptreact',
  -- using pwa-chrome
  'vue',
  'svelte',
}

for i, ext in ipairs(exts) do
  dap.configurations[ext] = {
    {
      type = 'pwa-node',
      request = 'launch',
      name = 'Launch Program (pwa-node)',
      cwd = vim.fn.getcwd(),
      args = { '${file}' },
      sourceMaps = true,
      protocol = 'inspector',
    },
    {
      type = 'pwa-node',
      request = 'launch',
      name = 'Launch Program (pwa-node with ts-node)',
      cwd = vim.fn.getcwd(),
      runtimeArgs = { '--loader', 'ts-node/esm' },
      runtimeExecutable = 'node',
      args = { '${file}' },
      sourceMaps = true,
      protocol = 'inspector',
      skipFiles = { '<node_internals>/**', 'node_modules/**' },
      resolveSourceMapLocations = {
        "${workspaceFolder}/**",
        "!**/node_modules/**",
      },
    },
    {
      type = 'pwa-node',
      request = 'launch',
      name = 'Launch Program (pwa-node with deno)',
      cwd = vim.fn.getcwd(),
      runtimeArgs = { 'run', '--inspect-brk', '--allow-all', '${file}' },
      runtimeExecutable = 'deno',
      attachSimplePort = 9229,
    },
    {
      type = 'pwa-node',
      request = 'launch',
      name = 'Launch Test Program (pwa-node with jest)',
      cwd = vim.fn.getcwd(),
      runtimeArgs = { '${workspaceFolder}/node_modules/.bin/jest' },
      runtimeExecutable = 'node',
      args = { '${file}', '--coverage', 'false' },
      rootPath = '${workspaceFolder}',
      sourceMaps = true,
      console = 'integratedTerminal',
      internalConsoleOptions = 'neverOpen',
      skipFiles = { '<node_internals>/**', 'node_modules/**' },
    },
    {
      type = 'pwa-node',
      request = 'launch',
      name = 'Launch Test Program (pwa-node with vitest)',
      cwd = vim.fn.getcwd(),
      program = '${workspaceFolder}/node_modules/vitest/vitest.mjs',
      args = { 'run', '${file}' },
      autoAttachChildProcesses = true,
      smartStep = true,
      skipFiles = { '<node_internals>/**', 'node_modules/**' },
    },
    {
      type = 'pwa-node',
      request = 'launch',
      name = 'Launch Test Program (pwa-node with deno)',
      cwd = vim.fn.getcwd(),
      runtimeArgs = { 'test', '--inspect-brk', '--allow-all', '${file}' },
      runtimeExecutable = 'deno',
      attachSimplePort = 9229,
    },
    {
      type = 'pwa-chrome',
      request = 'attach',
      name = 'Attach Program (pwa-chrome = { port: 9222 })',
      program = '${file}',
      cwd = vim.fn.getcwd(),
      sourceMaps = true,
      port = 9222,
      webRoot = '${workspaceFolder}',
    },
    {
      type = 'node2',
      request = 'attach',
      name = 'Attach Program (Node2)',
      processId = require('dap.utils').pick_process,
    },
    {
      type = 'node2',
      request = 'attach',
      name = 'Attach Program (Node2 with ts-node)',
      cwd = vim.fn.getcwd(),
      sourceMaps = true,
      skipFiles = { '<node_internals>/**' },
      port = 9229,
    },
    {
      type = 'pwa-node',
      request = 'attach',
      name = 'Attach Program (pwa-node)',
      cwd = vim.fn.getcwd(),
      processId = require('dap.utils').pick_process,
      skipFiles = { '<node_internals>/**' },
    },
  }
end
