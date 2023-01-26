vim.opt.termguicolors = true
vim.cmd [[highlight IndentBlanklineIndent guifg=#6e6f6c gui=nocombine]]

require('indent_blankline').setup {
  char = '┊',
  show_trailing_blankline_indent = false,
  char_highlight_list = {
    "IndentBlanklineInd1ent",
  },
}
