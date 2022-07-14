# statusbufferline.vim

This plugin transforms the Vim statusline in a buffer list.

[statusbufferline](screenshot.png)

# Usage

Simply install the plugin using your favorite package manager.

To configure it, only three variables:

- `g:sbline_show_bfnr`: If 1 (default), the buffers are listed with their
  respective number. 0 to disable.  
- `g:sbline_show_modified`: if 1 (default), shows if a buffer is modified.  
- `g:sbline_ruler`: If 1 (default), emulated the Vim ruler on the righ side of
  the statusline. If 2, shows a more minimal ruler than Vim's default and if 0,
  don't show any ruler.

The coloring of the current buffer is setted by the group
`StatusBufferLineActive` and the others by the default `StatusLine` group.
