# statusbufferline.vim

This plugin transforms the Vim statusline or tabline in a buffer list.

[statusbufferline](screenshot.png)

# Usage

Simply install the plugin using your favorite package manager.

To configure it, these variables:

- `g:sbline_show_bfnr`: If 1 (default), the buffers are listed with their
  respective number. 0 to disable.  
- `g:sbline_show_modified`: if 1 (default), shows if a buffer is modified.  
- `g:sbline_ruler`: If 1, emulated the Vim ruler on the righ side of the
  statusline. If 2, shows a more minimal ruler than Vim's default. If
  3 (default), transforms the ruler in a tablist and if 0, don't show any ruler.  

- `g:sbline_to_status`: 1 or 0 (default). Draws the sbline on the statusline.  

- `g:sbline_to_tabs`: 1 (default) or 0. Draws the sbline on the tabline.  

- `sbline_crop_bufname`: 1 (default) or 0. Crops the buffername to be only the
  filename, without directories.  

The coloring of the current buffer is setted by the group
`StatusBufferLineActive` and the others by the default `StatusLine` group.
