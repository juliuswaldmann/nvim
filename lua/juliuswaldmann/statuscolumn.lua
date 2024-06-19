vim.api.nvim_set_hl(0, 'LineNrAbove', { fg='#51B3EC', bold=true })
vim.api.nvim_set_hl(0, 'LineNr', { fg='white', bold=true })
vim.api.nvim_set_hl(0, 'LineNrBelow', { fg='#FB508F', bold=true })

vim.o.signcolumn = "auto"
vim.o.numberwidth = 1

local function is_terminal_window()
  local buftype = vim.api.nvim_buf_get_option(0, "buftype")
  return buftype == "terminal"
end

local function is_in_file_explorer_mode()
  local filetype = vim.bo.filetype
  return filetype == 'netrw'
end

LineNumbers = function ()
    if vim.v.relnum == 0 then
        if is_terminal_window() then
            return "~"
        end
        -- if not terminal mode
        return vim.v.lnum .. " "
    end

   return "%=" .. vim.v.relnum

end

MyStatusColumn = function()
    if not is_in_file_explorer_mode() then
        return LineNumbers() .. " " --margin after line numbers
    end
    return ""
end

vim.o.statuscolumn = "%!v:lua.MyStatusColumn()";
