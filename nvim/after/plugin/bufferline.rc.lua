local status, bufferline = pcall(require, 'bufferline')
if (not status) then return end

bufferline.setup {
  options = {
    show_close_icon = false,
    show_buffer_close_icons = false,
    offsets = {{ filetype = 'NvimTree', text = 'File Explorer' }}
  }
}

