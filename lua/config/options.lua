-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.lazyvim_ts_lsp = "vtsls"
vim.opt.spelllang = { "en", "es" }
vim.opt.number = true
vim.opt.relativenumber = false

-- Files from untrusted repositories must not be allowed to alter editor state.
vim.opt.exrc = false
vim.opt.modeline = false
