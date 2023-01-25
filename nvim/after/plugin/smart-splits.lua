require('smart-splits').setup({
  -- Ignored filetypes (only while resizing)
  ignored_filetypes = {
    'nofile',
    'quickfix',
    'prompt',
  },
  -- Ignored buffer types (only while resizing)
  ignored_buftypes = { 'NvimTree' },
  -- the default number of lines/columns to resize by at a time
  default_amount = 3,
  -- whether to wrap to opposite side when cursor is at an edge
  -- e.g. by default, moving left at the left edge will jump
  -- to the rightmost window, and vice versa, same for up/down.
  wrap_at_edge = true,
  -- when moving cursor between splits left or right,
  -- place the cursor on the same row of the *screen*
  -- regardless of line numbers. False by default.
  -- Can be overridden via function parameter, see Usage.
  move_cursor_same_row = false,
  -- resize mode options
  resize_mode = {
    -- key to exit persistent resize mode
    quit_key = '<ESC>',
    -- keys to use for moving in resize mode
    -- in order of left, down, up' right
    resize_keys = { 'h', 'j', 'k', 'l' },
    -- set to true to silence the notifications
    -- when entering/exiting persistent resize mode
    silent = false,
    -- must be functions, they will be executed when
    -- entering or exiting the resize mode
    hooks = {
      on_enter = nil,
      on_leave = nil,
    },
  },
  -- ignore these autocmd events (via :h eventignore) while processing
  -- smart-splits.nvim computations, which involve visiting different
  -- buffers and windows. These events will be ignored during processing,
  -- and un-ignored on completed. This only applies to resize events,
  -- not cursor movement events.
  ignored_events = {
    'BufEnter',
    'WinEnter',
  },
  -- enable or disable the tmux integration
  tmux_integration = true,
  -- disable tmux navigation if current tmux pane is zoomed
  disable_tmux_nav_when_zoomed = true,
})

-- resizing splits
-- amount defaults to 3 if not specified
-- use absolute values, no + or -
-- the functions also check for a range,
-- so for example if you bind `<A-h>` to `resize_left`,
-- then `10<A-h>` will `resize_left` by `(10 * config.default_amount)`
-- require('smart-splits').resize_up(amount)
-- require('smart-splits').resize_down(amount)
-- require('smart-splits').resize_left(amount)
-- require('smart-splits').resize_right(amount)
-- moving between splits
-- pass same_row as a boolean to override the default
-- for the move_cursor_same_row config option.
-- See Configuration.
-- require('smart-splits').move_cursor_up()
-- require('smart-splits').move_cursor_down()
-- require('smart-splits').move_cursor_left(same_row)
-- require('smart-splits').move_cursor_right(same_row)
-- persistent resize mode
-- temporarily remap your configured resize keys to
-- smart resize left, down, up, and right, respectively,
-- press <ESC> to stop resize mode (unless you've set a different key in config)
-- resize keys also accept a range, e.e. pressing `5j` will resize down 5 times the default_amount
-- require('smart-splits').start_resize_mode()

-- recommended mappings
-- resizing splits
-- these keymaps will also accept a range,
-- for example `10<A-h>` will `resize_left` by `(10 * config.default_amount)`
-- vim.keymap.set('n', '<C-Left>', function() require('smart-splits').resize_left() end)
-- vim.keymap.set('n', '<C-Down>', function() require('smart-splits').resize_down() end)
-- vim.keymap.set('n', '<C-Up>', function() require('smart-splits').resize_up() end)
-- vim.keymap.set('n', '<C-Right>', function() require('smart-splits').resize_right() end)
-- moving between splits
vim.keymap.set('n', '<C-h>', function() require('smart-splits').move_cursor_left() end)
vim.keymap.set('n', '<C-j>', function() require('smart-splits').move_cursor_down() end)
vim.keymap.set('n', '<C-k>', function() require('smart-splits').move_cursor_up() end)
vim.keymap.set('n', '<C-l>', function() require('smart-splits').move_cursor_right() end)

