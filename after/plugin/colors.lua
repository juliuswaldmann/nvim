function LineNumberColors()
    vim.api.nvim_set_hl(0, 'LineNrAbove', { fg='#51B3EC', bold=true })
    vim.api.nvim_set_hl(0, 'LineNr', { fg='white', bold=true })
    vim.api.nvim_set_hl(0, 'LineNrBelow', { fg='#FB508F', bold=true })
    vim.o.signcolumn = "auto"
    vim.o.numberwidth = 1
end

--local function set_terminal_mode_statuscolumn()
--  vim.wo.relativenumber = true
--  vim.wo.number = true
--  vim.wo.statuscolumn = [[%=%{&number ? (v:relnum == 0 ? '~' : printf('%1d', v:relnum)) : ''}]]
--end
--
---- Function to reset status column back to default
--local function reset_normal_mode_statuscolumn()
--  vim.wo.relativenumber = true
--  vim.wo.number = true
--  --vim.wo.statuscolumn = [[%=%{v:relnum ? printf('%1d', v:relnum) : printf('%1d', v:lnum)}]]
--  --vim.wo.statuscolumn = [[%=%{&number ? (v:relnum == 0 ? printf('%1d', v:lnum) : printf('%1d', v:relnum)) : ''}]]
--  vim.wo.statuscolumn = [[%=%{printf('1%d', v:relnum)}]]
--end
--
--vim.api.nvim_create_augroup('TerminalModeStatusColumn', { clear = true })
--
--vim.api.nvim_create_autocmd('TermEnter', {
--  group = 'TerminalModeStatusColumn',
--  pattern = '*',
--  callback = function()
--    LineNumberColors()
--    set_terminal_mode_statuscolumn()
--  end
--})
--
--vim.api.nvim_create_autocmd('TermLeave', {
--  group = 'TerminalModeStatusColumn',
--  pattern = '*',
--  callback = function()
--    LineNumberColors()
--    reset_normal_mode_statuscolumn()
--  end
--})
--
--vim.api.nvim_create_autocmd('CursorMoved', {
--  group = 'TerminalModeStatusColumn',
--  pattern = '*',
--  callback = function()
--    if vim.bo.buftype == 'terminal' then
--      set_terminal_mode_statuscolumn()
--    end
--  end,
--})

--LineNumberColors()
