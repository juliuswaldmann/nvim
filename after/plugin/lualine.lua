
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Move to previous/next
map('n', '<A-,>', '<Cmd>bnext<CR>', opts)
map('n', '<A-.>', '<Cmd>bprevious<CR>', opts)
-- Re-order to previous/next
--map('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts)
--map('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opts)
-- Goto buffer in position...
map('n', '<A-1>', '<Cmd>LualineBuffersJump! 1<CR>', opts)
map('n', '<A-2>', '<Cmd>LualineBuffersJump! 2<CR>', opts)
map('n', '<A-3>', '<Cmd>LualineBuffersJump! 3<CR>', opts)
map('n', '<A-4>', '<Cmd>LualineBuffersJump! 4<CR>', opts)
map('n', '<A-5>', '<Cmd>LualineBuffersJump! 5<CR>', opts)
map('n', '<A-6>', '<Cmd>LualineBuffersJump! 6<CR>', opts)
map('n', '<A-7>', '<Cmd>LualineBuffersJump! 7<CR>', opts)
map('n', '<A-8>', '<Cmd>LualineBuffersJump! 8<CR>', opts)
map('n', '<A-9>', '<Cmd>LualineBuffersJump! 9<CR>', opts)
map('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)
-- Pin/unpin buffer
--map('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)
-- Close buffer
map('n', '<A-c>', '<Cmd>bdelete<CR>', opts)

local colors = {
    white = "#cccccc",
    grey = "#303030",
    black = "#080808"
}
local custom = require'lualine.themes.palenight'

custom.normal.c.fg = colors.white
custom.normal.c.gui = ""

require('lualine').setup {
    options = {
        icons_enabled = false,
        theme = custom,
        component_separators = { left = ' ', right = '|'},
        section_separators = { left = ' ', right = ' '},
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        },
    },
    tabline = {
        lualine_a =
        {
            {
              'buffers',
              show_filename_only = true,   -- Shows shortened relative path when set to false.
              hide_filename_extension = false,   -- Hide filename extension when set to true.
              show_modified_status = true, -- Shows indicator when the buffer is modified.

              mode = 2, -- 0: Shows buffer name
                        -- 1: Shows buffer index
                        -- 2: Shows buffer name + buffer index
                        -- 3: Shows buffer number
                        -- 4: Shows buffer name + buffer number

              max_length = vim.o.columns,

              filetype_names = {
                netrw = 'netrw',
                TelescopePrompt = 'Telescope',
                dashboard = 'Dashboard',
                packer = 'Packer',
                fzf = 'FZF',
                alpha = 'Alpha'
              }, -- Shows specific buffer name for that filetype ( { `filetype` = `buffer_name`, ... } )

              -- Automatically updates active buffer color to match color of other components (will be overidden if buffers_color is set)
              use_mode_colors = true,

              buffers_color = {
                active = {
                    --fg = '#ffffff',
                    --bg = '#0000ff',
                    gui = 'bold'
                  },
                  inactive = {
                    fg = colors.white,
                    bg = colors.grey,
                    gui = 'bold'
                  },
              },

              symbols = {
                modified = ' ●',      -- Text to show when the buffer is modified
                alternate_file = '#', -- Text to show to identify the alternate file
                directory =  '',     -- Text to show when the buffer is a directory
              },
            }
        },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {'tabs'}
    }
}


