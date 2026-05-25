-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "gg", "gg0", { desc = "Go to first line and first column" })
vim.keymap.set("n", "G", "G$", { desc = "Go to last line and end of line" })
