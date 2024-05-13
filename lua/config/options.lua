-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

vim.opt.autoindent = true

vim.g.autoformat = false

-- If we are on windows, we want to specify the shell to use powershell
if vim.fn.has("win32") == 1 then
    vim.opt.shell = "powershell.exe"
end
